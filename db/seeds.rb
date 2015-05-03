# Create admin user
User.create first_name: 'Sean', last_name: 'Washington', email: 'hello@seanwash.com', password: 'r6m4i3'

# Exercises
Exercise.create name: 'G Major Scale Squence', content: 'Test content', user: User.first

# Tags
Tag.create name: 'dexterity'
Tag.create name: 'speed'
Tag.create name: 'strength'
