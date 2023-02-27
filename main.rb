# frozen_string_literal: false

# board[2,5,8][0][3,9,15]

# Game Board
class Board
  attr_reader :board
  attr_accessor :moves

  def initialize
    @board = [
      ['   0     1     2  '], ['      |     |     '],
      ['0  -  |  -  |  -  '], [' _____|_____|_____'],
      ['      |     |     '], ['1  -  |  -  |  -  '],
      [' _____|_____|_____'], ['      |     |     '],
      ['2  -  |  -  |  -  '], ['      |     |     ']
    ]
    @moves = [
      ['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']
    ]
  end

  def get_move
    print 'Please enter your move: '
    @move = gets.chomp.split('')
    @moves[@move[1].to_i][@move[2].to_i] = @move[0]
    p @moves
  end

  def refresh_board
    @board[2][0][3] = self.moves[0][0]
    @board[2][0][9] = self.moves[0][1]
    @board[2][0][15] = self.moves[0][2]
    @board[5][0][3] = self.moves[1][0]
    @board[5][0][9] = self.moves[1][1]
    @board[5][0][15] = self.moves[1][2]
    @board[8][0][3] = self.moves[2][0]
    @board[8][0][9] = self.moves[2][1]
    @board[8][0][15] = self.moves[2][2]
  end
end

game = Board.new

game.get_move

# game.moves[0][0] = 'X'

game.refresh_board

puts game.board
