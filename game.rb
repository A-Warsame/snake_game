require 'ruby2d'
require_relative 'game_logic'
require_relative 'ui'
require_relative 'input_handler'

class Game
  def initialize
    @logic = GameLogic.new
    @ui = UI.new(@logic)
    @input = InputHandler.new(@logic)
  end

  def run
    @input.start
    @input.move_snake
    @ui.draw
  end

  game = Game.new
  game.run
end
show

Game.new.run
