require 'drb/drb'

# Conecta ao servidor
uri = "druby://localhost:8787"
game = DRbObject.new_with_uri(uri)

puts "Bem-vindo ao Pedra, Papel e Tesoura!"
puts "As opções disponíveis são: #{game.options.join(', ')}"

# Obter escolha do jogador 1
print "Jogador 1, escolha (rock/paper/scissors): "
player1_choice = gets.chomp.downcase
until game.valid_choice?(player1_choice)
  puts "Escolha inválida. Tente novamente."
  print "Jogador 1, escolha (rock/paper/scissors): "
  player1_choice = gets.chomp.downcase
end

# Obter escolha do jogador 2
print "Jogador 2, escolha (rock/paper/scissors): "
player2_choice = gets.chomp.downcase
until game.valid_choice?(player2_choice)
  puts "Escolha inválida. Tente novamente."
  print "Jogador 2, escolha (rock/paper/scissors): "
  player2_choice = gets.chomp.downcase
end

# Enviar escolhas para o servidor e exibir resultado
result = game.play(player1_choice, player2_choice)
puts "Resultado: #{result}"
