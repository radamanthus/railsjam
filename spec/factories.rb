Factory.define :user do |u|
  u.name       "John Doe"
  u.email      'johndoe@yahoo.com'
  u.login      'john_doe'
  u.password    'summer'
  u.password_confirmation 'summer'
end


Factory.define :gallery do |g|
  g.name         "RailsJam"
  g.description  "Photos taken - September 2010"
end