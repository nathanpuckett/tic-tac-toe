# frozen_string_literal: false

# board[2,5,8][0][3,9,15]

# Game Board
class Board
  attr_reader :board
  attr_accessor :moves

  def initialize
    @board = [
      ['   a     b     c  '], ['      |     |     '],
      ['1  -  |  -  |  -  '], [' _____|_____|_____'],
      ['      |     |     '], ['2  -  |  -  |  -  '],
      [' _____|_____|_____'], ['      |     |     '],
      ['3  -  |  -  |  -  '], ['      |     |     ']
    ]
    @moves = ['-', '-', '-', '-', '-', '-', '-', '-', '-']
  end

  def refresh_board
    @board[2][0][3] = self.moves[0]
    @board[2][0][9] = self.moves[1]
    @board[2][0][15] = self.moves[2]
    @board[5][0][3] = self.moves[3]
    @board[5][0][9] = self.moves[4]
    @board[5][0][15] = self.moves[5]
    @board[8][0][3] = self.moves[6]
    @board[8][0][9] = self.moves[7]
    @board[8][0][15] = self.moves[8]
  end
end

game = Board.new

game.moves[0] = 'X'

game.refresh_board

puts game.board
