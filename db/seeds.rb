# Create admin user
User.create(
  first_name: 'Sean',
  last_name: 'Washington',
  email: 'hello@seanwash.com',
  password: 'r6m4i3'
)

# Tags
Tag.create name: 'dexterity'
Tag.create name: 'speed'
Tag.create name: 'strength'

# Exercises
Exercise.create(
  name: 'G Major Scale Sequence',
  content: 'You just play the g major scale in a sequence.',
  user: User.first
)

# Entries
Entry.create(
  content: 'I practiced for a while.',
  journal: Journal.first
)
