# Create admin user
User.create first_name: 'Sean', last_name: 'Washington', email: 'hello@seanwash.com', password: 'r6m4i3'

# Create first journal
Journal.create user: User.first
