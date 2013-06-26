username = "betahaus"
email    = "contact@#{username}.com"

Language.create([
  { name: "english", abbreviation: "en" },
  { name: "french", abbreviation: "fr" },
  { name: "german", abbreviation: "de" },
  { name: "spanish", abbreviation: "es" }
])

User.create(email: email)


mathias_id = User.find_by_email(email).id

Account.create([
  { name: "#{username}", timezone: "london", language_id: Language.find_by_name("english").id, user_id: mathias_id },
  { name: "#{username}_de", timezone: "berlin", language_id: Language.find_by_name("german").id, user_id: mathias_id },
  { name: "#{username}_es", timezone: "madrid", language_id: Language.find_by_name("spanish").id, user_id: mathias_id }
])

Flip.create([
  { from: Account.find_by_name("#{username}").id, to: Account.find_by_name("#{username}_de").id, kind: "human", user_id: mathias_id },
  { from: Account.find_by_name("#{username}").id, to: Account.find_by_name("#{username}_es").id, kind: "computer", user_id: mathias_id },
  { from: Account.find_by_name("#{username}_de").id, to: Account.find_by_name("#{username}_es").id, kind: "computer", user_id: mathias_id }
])
