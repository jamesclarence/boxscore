require 'faker'
I18n.reload!

# Create Users
1.times do
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
2.times do
  Team.create!(
    school: Faker::Address.state,
    nickname: Faker::Team.creature.capitalize,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    league: "NBA",
    user: User.all.sample
    )
end
teams = Team.all

# Player Positions
position = ["PG", "SG", "SF", "PF", "C"]

# Create Players For Each Team
teams.each do |t|
  t.players = []
  5.times do
    t.players << Player.create!(
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      number: Faker::Number.number(2),
      position: position.sample,
      height: Faker::Number.between(71, 86),
      weight: Faker::Number.between(180,300),
      team: t
      )
  end
end

teams = Team.all

# Create Games For Teams
teams.each do |t|
  t.games = []
  5.times do
    t.games << Game.create(
      date: Faker::Date.between(300.days.ago, Date.today),
      location: Faker::Address.city,
      team_score: Faker::Number.between(85, 120),
      opponent_score: Faker::Number.between(85, 120),
      team: Team.find(1),
      opponent: Team.find(2)
      )
  end
end

# Create Statistics For Players
games = Game.all
players = Player.all

# until Stat.count == 25  do
#   games.each do |s|
#   s.stats = []
#     5.times do
#       s.stats << Stat.create(
#       fg: Faker::Number.between(1, 10),
#       fga: Faker::Number.between(5, 25),
#       # three_p: Faker::Number.between(0, 10),
#       # three_p_a: Faker::Number.between(0, 10),
#       # ft: Faker::Number.between(0, 10),
#       # fta: Faker::Number.between(0, 10),
#       # orb: Faker::Number.between(0, 5),
#       # drb: Faker::Number.between(0, 15),
#       # assists: Faker::Number.between(0, 12),
#       # steals: Faker::Number.between(0, 5),
#       # blocks: Faker::Number.between(0, 5),
#       # turnovers: Faker::Number.between(0, 8),
#       # fouls: Faker::Number.between(0, 6),
#       points: Faker::Number.between(0, 50),
#       # minutes: Faker::Number.between(0, 48),
#       player: s.players.sample
#       )
#   end
# end

players.each do |p|
  p.stats = []
    5.times do
      p.stats << Stat.create(
      fg: Faker::Number.between(1, 10),
      fga: Faker::Number.between(5, 25),
      # three_p: Faker::Number.between(0, 10),
      # three_p_a: Faker::Number.between(0, 10),
      # ft: Faker::Number.between(0, 10),
      # fta: Faker::Number.between(0, 10),
      # orb: Faker::Number.between(0, 5),
      # drb: Faker::Number.between(0, 15),
      # assists: Faker::Number.between(0, 12),
      # steals: Faker::Number.between(0, 5),
      # blocks: Faker::Number.between(0, 5),
      # turnovers: Faker::Number.between(0, 8),
      # fouls: Faker::Number.between(0, 6),
      points: Faker::Number.between(0, 50),
      # minutes: Faker::Number.between(0, 48),
      player: p,
      team: p.team,
      game: p.games.sample
      )
  end
end

# Create an admin
admin = User.new(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a member
# member = User.new(
#   email: 'member@example.com',
#   password: 'helloworld',
#   role: 'standard'
#   )
# member.skip_confirmation!
# member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Team.count} teams created"
puts "#{Player.count} players created"
puts "#{Game.count} games created"
puts  "#{Stat.count} set of statistics created"
