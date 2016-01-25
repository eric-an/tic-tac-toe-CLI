class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end  

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(number)
    cells[number.to_i-1]
  end

  def full?
    cells.all? { |cell| cell == "X" || cell == "O" }
  end

  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(number)
    spot = number.to_i
    cells[spot-1] == "X" || cells[spot-1] == "O"
  end

  def valid_move?(number)
    number.to_i.between?(1,9) && !taken?(number)
  end

  def update(number, player)
    if !taken?(number) && valid_move?(number)
      cells[number.to_i-1] = player.token
    end
  end
end