require 'ruby2d'
WINDOW_WIDTH = 640
WINDOW_HEIGHT = 480
class InputHandler
  include Ruby2D::DSL
  def initialize(game_logic)
    @game_logic = game_logic
    @snake = Array.new(64, Square.new(x: 10, y: 20, size: 20, color: 'red'))
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
  def move_snake
    head = @snake.first
    new_x = head.x + @x_speed
    new_y = head.y + @y_speed
    new_head = Square.new(x: new_x, y: new_y, size: 25, color: 'red')
    @snake.unshift(new_head)

    tail = @snake.pop
    tail.remove
    re_enter_window(@snake.first)
  end
  def re_enter_window(segment)
    if segment.x < 0
      segment.x = WINDOW_WIDTH
    elsif segment.x > WINDOW_WIDTH
      segment.x = 0
    end
    if segment.y < 0
      segment.y = WINDOW_HEIGHT
    elsif segment.y > WINDOW_HEIGHT
      segment.y = 0
    end
  end
end
