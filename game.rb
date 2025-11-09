require 'ruby2d'
require_relative 'game_logic'
require_relative 'ui'
require_relative 'input_handler'

class Game
  attr_reader :input, :ui, :logic

  def initialize
    @logic = GameLogic.new
    @ui = UI.new(@logic)
    @input = InputHandler.new(@logic)
    @input.user_input
  end
end

game = Game.new

update do
  game.input.move_snake
  game.ui.draw
end

show
