class Gridbot
  ORIENTATIONS = %w[N E S W].freeze
  GRID_SIZE = 6

  attr_reader :x, :y, :orientation, :placed

  def initialize
    @placed = false
  end

  def valid_position?(x, y)
    x.between?(0, GRID_SIZE - 1) && y.between?(0, GRID_SIZE - 1)
  end

  def move
    return unless placed

    new_x, new_y = next_position
    return unless valid_position?(new_x, new_y)

    @x = new_x
    @y = new_y
  end

  def place(x, y, orientation)
    return unless valid_position?(x, y)
    return unless ORIENTATIONS.include?(orientation)

    @x = x
    @y = y
    @orientation = orientation
    @placed = true
  end

  def next_position
    case @orientation
    when "N" then [@x, @y + 1]
    when "E" then [@x + 1, @y]
    when "S" then [@x, @y - 1]
    when "W" then [@x - 1, @y]
    end
  end

  def report
    return unless placed

    puts "#{@x},#{@y},#{@orientation}"
  end

  def left
    return unless placed
    @orientation = ORIENTATIONS[(ORIENTATIONS.index(@orientation) - 1) % ORIENTATIONS.size]
  end

  def right
    return unless placed
    @orientation = ORIENTATIONS[(ORIENTATIONS.index(@orientation) + 1) % ORIENTATIONS.size]
  end
end
