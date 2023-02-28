# frozen_string_literal: false

# board[2,5,8][0][3,9,15]

# Game Class
class Game
  def initialize
    @board = Board.new
    @moves = [
      ['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']
    ]
    start_game
  end

  def start_game
    while true
      puts @board.board
      get_move
      @board.refresh_board(@moves)
    end
  end

  def get_move
    print 'Please enter your move: '
    @move = gets.chomp.split('')
    @moves[@move[1].to_i][@move[2].to_i] = @move[0]
  end
end

# Board Class
class Board
  attr_reader :board

  def initialize
    @board = [
      ['   0     1     2  '], ['      |     |     '],
      ['0  -  |  -  |  -  '], [' _____|_____|_____'],
      ['      |     |     '], ['1  -  |  -  |  -  '],
      [' _____|_____|_____'], ['      |     |     '],
      ['2  -  |  -  |  -  '], ['      |     |     ']
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

# game.get_move

# game.moves[0][0] = 'X'

# game.refresh_board

# puts game.board
