username = "betahaus"
email    = "contact@#{username}.com"

Language.create([
  { name: "english", abbreviation: "en" },
  { name: "french", abbreviation: "fr" },
  { name: "german", abbreviation: "de" },
  { name: "spanish", abbreviation: "es" }
  ])

User.create(email: email, language: 'english')


mathias_id = User.find_by_email(email).id

Account.create([
  { name: "#{username}", timezone: "london", language_id: Language.find_by_name("english").id, notifications: 0, user_id: mathias_id },
  { name: "#{username}_de", timezone: "berlin", language_id: Language.find_by_name("german").id, notifications: 0, user_id: mathias_id },
  { name: "#{username}_es", timezone: "madrid", language_id: Language.find_by_name("spanish").id, notifications: 2, user_id: mathias_id }
  ])

Flip.create([
  { from: Account.find_by_name("#{username}").id, to: Account.find_by_name("#{username}_de").id, kind: "human", user_id: mathias_id },
  { from: Account.find_by_name("#{username}").id, to: Account.find_by_name("#{username}_es").id, kind: "computer", user_id: mathias_id }
  ])

# Tweets
Translation.create([
  {
    account_id: Account.find_by_name("#{username}_es").id,
    source: "Please Retweet my latest Berlin Startup Girl post: Croissants and Awkward Glances: A Tale of Networking in Berlin http://ow.ly/mrGh5",
    source_language: 'english',
    content: "Por favor Retweet mi última Berlín inicio Chica mensaje: Croissants y miradas incómodas: A Tale of Networking en Berlín http://ow.ly/mrGh5",
    language: 'spanish',
    kind: 'human',
    status: 'published',
    published_at: (Time.now - 2.hours)
  },
  {
    account_id: Account.find_by_name("#{username}_es").id,
    source: "If you're planning on visiting TechHub this coming Monday why not come along to the #cavecastlep product launch at 2pm in room 1.03.",
    source_language: 'english',
    language: 'spanish',
    kind: 'human',
    status: 'processing'
  }
])

# Mentions
mention_translation_1 = Translation.create(
  {
    account_id: Account.find_by_name("#{username}_es").id,
    source: "Me encanta tu historia, ¿dónde vives?",
    source_language: 'spanish',
    content: 'I love your story, where do you live ?',
    language: 'english',
    kind: 'computer',
    status: 'processed',
    reply: true,
    published_at: (Time.now - 1.hour)
  }
)

mention_translation_2 = Translation.create(
  {
    account_id: Account.find_by_name("#{username}_es").id,
    source: "Gran artículo. ¿Estás pensando en alojarse en Berlín?",
    source_language: 'spanish',
    content: 'Great article. Are you thinking of staying in Berlin?',
    language: 'english',
    kind: 'computer',
    status: 'processed',
    reply: true,
    published_at: (Time.now - 1.minute)
  }
)

reply_id = Translation.where(status: 'published', account_id: Account.find_by_name("#{username}_es").id).first.id

Mention.create!([
  {
    translation_id: mention_translation_1.id,
    twitter_handle: 'elxavi',
    name: 'Xavi Sanchez',
    reply_id: reply_id
  },
  {
    translation_id: mention_translation_2.id,
    twitter_handle: 'cavalli',
    name: 'Roberto Cavalli',
    reply_id: reply_id
  },
  ])
