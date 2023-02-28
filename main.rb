# frozen_string_literal: false

# Game Class
class Game
  @@rules = "\nWelcome to Ruby Tic Tac Toe for the Command Line!\n" \
            "\nPlease enter your moves in the following format:\n" \
            "\n'a1', 'b2', etc.\n" \
            "\nEnjoy!\n\n"

  def initialize
    @whose_move = 'X'
    @board = Board.new
    @moves = [
      ['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']
    ]
    @game_won = false
    start_game
  end

  def start_game
    puts @@rules
    until @game_won
      puts @board.board
      user_move
      @board.refresh_board(@moves)
    end
  end

  def user_move
    print "Please enter your move (#{@whose_move}): "
    @move = gets.chomp.split('')
    @moves[@move[1].to_i - 1][@move[0].ord - 97] = @whose_move
    @whose_move = switch_move
  end

  def switch_move
    if @whose_move == 'X'
      'O'
    else
      'X'
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
