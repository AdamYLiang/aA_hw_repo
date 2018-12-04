require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    add_stones
  end

  def add_stones
    @cups.map!.with_index do |el, idx|
      if idx == 6 || idx == 13
        @cups[idx] = []
      else
        @cups[idx] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_to_place = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos

    until stones_to_place.empty?
      cup_idx += 1 
      cup_idx = 0 if cup_idx > 13 
      if cup_idx == 6 
        @cups[6] << stones_to_place.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones_to_place.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones_to_place.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      return :prompt
    elsif @cups[ending_cup_idx].count == 1 
      return :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    if player1_score == player2_score 
      :draw
    else 
      player1_score > player2_score ? @name1 : @name2
    end
  end
end
