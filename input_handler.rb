require 'ruby2d'
WINDOW_WIDTH = 640
WINDOW_HEIGHT = 480
class InputHandler
  include Ruby2D::DSL
  def initialize(game_logic)
    @game_logic = game_logic
    @snake = Array.new(64, Square.new(x: 10, y: 20, size: 25, color: 'red'))
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
    head = @snake.first
    new_x = head.x + @x_speed
    new_y = head.y + @y_speed

    if new_x < 0
      new_head = Square.new(x: WINDOW_WIDTH, y: new_y, size: 25, color: 'red')
      @snake.unshift(new_head)
    elsif new_x > WINDOW_WIDTH
      new_head = Square.new(x: 0, y: new_y, size: 25, color: 'red')
      @snake.unshift(new_head)
    end

    if new_y < 0
      new_head = Square.new(x: new_x, y: WINDOW_HEIGHT, size: 25, color: 'red')
      @snake.unshift(new_head)
    elsif new_y > WINDOW_HEIGHT
      new_head = Square.new(x: new_x, y: 0, size: 25, color: 'red')
      @snake.unshift(new_head)
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
    re_enter_window
  end
end
