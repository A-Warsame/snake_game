require 'ruby2d'

class GameLogic
  attr_reader :snake
  def initialize
    @snake = []
    @food = Circle.new(x: rand(WINDOW_WIDTH), y: rand(WINDOW_HEIGHT), radius: 10, sectors: 32, color: 'fuchsia', z: 10)
  end
  def start; end
  def spawn_food
    # spawn food at random location
  end
  def check_collision
    # check if snake collides with food
    # check if snake collides with itself
    # check if snake goes out of bounds
  end

end
