puts "🌱 Seeding spices..."

User.create(username: 'Will', email: "will@example.com", password: '123')
User.create(username: 'Astika', email: "Astika@example.com", password: '123')
User.create(username: 'John', email: "John@example.com", password: '123')

Game.create(position: 'r1bqkbnr/pppp1ppp/2n5/4p3/2B1P3/5N2/PPPP1PPP/RNBQK2R w KQkq - 2 3')
Game.create(position: 'rnbqkbnr/pppp1ppp/4p3/8/8/2N5/PPPPPPPP/R1BQKBNR b KQkq - 1 1')
Game.create(position: 'r1bqkbnr/pppp1ppp/2n5/4p3/8/1P2P3/PBPP1PPP/RN1QKBNR w KQkq - 2 3')

Matchup.create(user_id: 1, game_id: 1, side: 'B')
Matchup.create(user_id: 1, game_id: 2, side: 'W')
Matchup.create(user_id: 2, game_id: 1, side: 'W')
Matchup.create(user_id: 2, game_id: 3, side: 'B')
Matchup.create(user_id: 3, game_id: 2, side: 'B')
Matchup.create(user_id: 3, game_id: 3, side: 'W')

puts "✅ Done seeding!"
