require 'ruby2d'
WINDOW_WIDTH = 640
WINDOW_HEIGHT = 480
class InputHandler
  include Ruby2D::DSL
  def initialize(game_logic)
    @game_logic = game_logic
    @snake = Square.new(x: 10, y: 20, size: 25, color: 'red')
    @x_speed = 0
    @y_speed = 0
  end

  def start
    on :key_down do |event|
      case event.key
      when 'up'
        @y_speed = -2
        @x_speed = 0
      when 'down'
        @y_speed = 2
        @x_speed = 0
      when 'left'
        @x_speed = -2
        @y_speed = 0
      when 'right'
        @x_speed = 2
        @y_speed = 0
      end
    end
  end

  def re_enter_window

    if @snake.x < 0
      @snake.x = WINDOW_WIDTH
    elsif @snake.x > WINDOW_WIDTH
      @snake.x = 0
    end

    if @snake.y < 0
      @snake.y = WINDOW_HEIGHT
    elsif @snake.y > WINDOW_HEIGHT
      @snake.y = 0
    end
  end

  def move_snake
    @snake.x += @x_speed
    @snake.y += @y_speed
    re_enter_window
  end
end