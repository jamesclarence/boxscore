require 'faker'
I18n.reload!

# Create Users
5.times do
  user = User.new(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    role: 'standard' 
    )
    user.skip_confirmation!
    user.save!
end

# Create Teams
20.times do
  team = Team.create(
    school: Faker::Address.state,
    nickname: Faker::Team.creature.capitalize,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    league: "NBA",
    user: User.all.sample
    )
end

# Positions
position = ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"]

# Create Players
300.times do
  player = Player.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    number: Faker::Number.number(2),
    position: position.sample,
    height: Faker::Number.between(71, 86),
    weight: Faker::Number.between(180,300),
    team: Team.all.sample
    )
end

# Create Games
1000.times do
  game = Game.create(
    date: Faker::Date.between(300.days.ago, Date.today),
    location: Faker::Address.city,
    team_score: Faker::Number.between(85, 120),
    opponent_score: Faker::Number.between(85, 120),
    team: Team.all.sample,
    opponent: Team.all.sample
    )
end

# Create Statistics For Players
  # for each player do |f|



# Create an admin
admin = User.new(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a member
member = User.new(
  email: 'member@example.com',
  password: 'helloworld',
  role: 'standard'
  )
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Team.count} teams created"
puts "#{Player.count} players created"
puts "#{Game.count} games created"