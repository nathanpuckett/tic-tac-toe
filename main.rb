# frozen_string_literal: false

# Game Class
class Game
  @@rules = "\nWelcome to Ruby Tic Tac Toe for the Command Line!\n" \
            "\nPlease enter your moves in the following format:\n" \
            "\n'a1', 'b2', etc.\n" \
            "\nEnjoy!\n"

  def initialize
    @whose_move = 'O'
    @board = Board.new
    @moves = [
      ['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']
    ]
    @game_won = false
    start_game
    game_over
  end

  def start_game
    puts @@rules
    until @game_won
      @whose_move = switch_move
      puts "\n"
      puts @board.board
      user_move
      @game_won = winner?
      @board.refresh_board(@moves)
    end
  end

  def game_over
    puts "\n"
    puts @board.board
    puts "\nThree in a row - #{@whose_move} wins!"
    puts "\n"
  end

  def user_move
    print "\nPlease enter your move (#{@whose_move}): "
    @move = gets.chomp.split('')
    @moves[@move[1].to_i - 1][@move[0].ord - 97] = @whose_move
  end

  def switch_move
    if @whose_move == 'X'
      'O'
    else
      'X'
    end
  end

  def winner?
    if @moves[0] == %w[X X X] || @moves[0] == %w[O O O] || @moves[1] == %w[X X X] || @moves[1] == %w[O O O]
      true
    elsif @moves[2] == %w[X X X] || @moves[2] == %w[O O O] || @moves.transpose[0] == %w[X X X]
      true
    else
      false
    end
  end
end

# Board Class
class Board
  attr_reader :board

  def initialize
    @board = [
      ['   a     b     c  '], ['      |     |     '],
      ['1  -  |  -  |  -  '], [' _____|_____|_____'],
      ['      |     |     '], ['2  -  |  -  |  -  '],
      [' _____|_____|_____'], ['      |     |     '],
      ['3  -  |  -  |  -  '], ['      |     |     ']
    ]
  end

  def refresh_board(moves)
    @board[2][0][3] = moves[0][0]
    @board[2][0][9] = moves[0][1]
    @board[2][0][15] = moves[0][2]
    @board[5][0][3] = moves[1][0]
    @board[5][0][9] = moves[1][1]
    @board[5][0][15] = moves[1][2]
    @board[8][0][3] = moves[2][0]
    @board[8][0][9] = moves[2][1]
    @board[8][0][15] = moves[2][2]
  end
end

Game.new
