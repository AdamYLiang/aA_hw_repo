require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over 
      system('clear')
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn 
    show_sequence
    sleep(2)
    system('clear')
    @game_over = require_sequence
    unless @game_over
      round_success_message
      self.sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence
    result = false 

    @seq.each do |el|
      puts "Type sequence one at a time: "
      guess = gets.chomp
      return true unless el == guess
    end

    result
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game over!"
    puts "Resetting.."
    sleep(2)
    system('clear')
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
