require 'ruby2d'

class GameLogic
  attr_reader :snake
  def initialize
    @snake = []
    @food = Square.new(x: rand(GRID_WIDTH) * GRID_SIZE, y: rand(GRID_HEIGHT) * GRID_SIZE, size: GRID_SIZE, color: 'yellow')
  end
  def start
  end
  def spawn_food
    @food = Square.new(x: rand(GRID_WIDTH) * GRID_SIZE, y: rand(GRID_HEIGHT) * GRID_SIZE, size: GRID_SIZE, color: 'yellow')
  end
  def check_collision (snake)

    head = snake.first

    if hit(head, @food)
      new_segment = Square.new(x: head.x, y: head.y, size: GRID_SIZE, color: 'red')
      snake << new_segment

      spawn_food

      @food.add
      @ate_food = true
    else
      @ate_food = false
    end

    # check if snake collides with itself
  end
  def hit(a, b)
    a.x < b.x + b.size &&
      a.x + a.size > b.x &&
      a.y < b.y + b.size &&
      a.y + a.size > b.y
  end

end