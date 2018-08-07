require 'tty-box'
require_relative './models/fleet'
require_relative './models/board'

system 'clear'
user_fleet = Fleet.new()
game_board= Board.new(user_fleet)
game_board.set_fleet(user_fleet)
board_matrix = game_board.generate_board
box = TTY::Box.frame(
  width: 100,
  height: 30,
  align: :center,
  padding: 1,
  border: :thick,
  style: {
  fg: :bright_yellow,
  bg: :blue,
  border: {
    fg: :bright_yellow,
    bg: :blue
  }
}
) do
  game_board.display_board(board_matrix)
end
puts box

