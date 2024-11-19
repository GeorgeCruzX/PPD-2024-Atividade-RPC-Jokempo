require 'drb/drb'

class RockPaperScissorsGame
  OPTIONS = %w[rock paper scissors]

  def play(player1_choice, player2_choice)
    return "Draw!" if player1_choice == player2_choice

    case [player1_choice, player2_choice]
    when %w[rock scissors], %w[scissors paper], %w[paper rock]
      "Player 1 wins!"
    else
      "Player 2 wins!"
    end
  end

  def valid_choice?(choice)
    OPTIONS.include?(choice)
  end

  def options
    OPTIONS
  end
end

# Inicializa o servidor
uri = "druby://localhost:8787"
DRb.start_service(uri, RockPaperScissorsGame.new)
puts "Servidor rodando em #{uri}"
DRb.thread.join
