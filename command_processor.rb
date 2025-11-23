require_relative 'gridbot'

class CommandProcessor
  PLACE_REGEX = /\APLACE\s+(\d+),\s*(\d+),\s*([NESW])\z/

  def initialize(gridbot)
    @gridbot = gridbot
  end

  def process(line)
    line = line.strip
    return if line.empty?

    if (match = PLACE_REGEX.match(line))
      x, y, orientation = match.captures
      @gridbot.place(x.to_i, y.to_i, orientation)
      return
    end

    return unless @gridbot.placed

    case line
    when "MOVE"   then @gridbot.move
    when "LEFT"   then @gridbot.left
    when "RIGHT"  then @gridbot.right
    when "REPORT" then @gridbot.report
    end
  end
end

# ------------------------------
# Main CLI Entry
# ------------------------------

if __FILE__ == $PROGRAM_NAME
  gridbot = Gridbot.new
  processor = CommandProcessor.new(gridbot)

  ARGF.each_line do |line|
    processor.process(line)
  end
end
