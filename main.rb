require 'ruby2d'
set title: 'Snake', width: 640, height: 480

@snake = Square.new(x: 10, y: 20, size: 25, color: 'red')

@x_speed = 0
@y_speed = 0

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

update do
  @snake.x += @x_speed
  @snake.y += @y_speed
end

show
