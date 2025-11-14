require 'ruby2d'
require_relative '../input_handler'

RSpec.describe InputHandler do
  let(:game_logic) { double('GameLogic') }

  subject(:input_handler) { described_class.new(game_logic) }

  describe '#move_snake' do
    it 'moves the snake head according to x_speed and y_speed' do
      # Set speeds
      input_handler.instance_variable_set(:@x_speed, 2)
      input_handler.instance_variable_set(:@y_speed, 0)

      # initial position for snake head
      head = input_handler.instance_variable_get(:@snake).first
      initial_x = head.x
      initial_y = head.y

      input_handler.move_snake

      new_head = input_handler.instance_variable_get(:@snake).first

      expect(new_head.x).to eq(initial_x + 2)
      expect(new_head.y).to eq(initial_y)
    end
  end
end