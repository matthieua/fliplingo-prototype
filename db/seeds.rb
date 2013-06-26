Language.create([
  { name: 'english',    abbreviation: 'en' },
  { name: 'french',    abbreviation: 'fr' },
  { name: 'german',     abbreviation: 'de' },
  { name: 'spanish',    abbreviation: 'es' }
])

User.create([
  { email: 'mathias@betahaus.de' },
  { email: 'megan@eastsidegames.com' },
  { email: 'christian@envato.com' },
  { email: 'emily@wong.com' }
])


mathias_id = User.find_by_email('mathias@betahaus.de').id

Account.create([
  { name: 'betahaus',    timezone: 'london', language_id: Language.find_by_name('english').id, user_id: mathias_id },
  { name: 'betahaus_de',    timezone: 'berlin', language_id: Language.find_by_name('german').id, user_id: mathias_id },
  { name: 'betahaus_es',    timezone: 'madrid', language_id: Language.find_by_name('spanish').id, user_id: mathias_id }
])

Flip.create([
  { from: Account.find_by_name('betahaus').id,  to: Account.find_by_name('betahaus_de').id, kind: 'ht', user_id: mathias_id },
  { from: Account.find_by_name('betahaus').id,  to: Account.find_by_name('betahaus_es').id, kind: 'mt', user_id: mathias_id },
  { from: Account.find_by_name('betahaus_de').id,  to: Account.find_by_name('betahaus_es').id, kind: 'mt', user_id: mathias_id }
])
