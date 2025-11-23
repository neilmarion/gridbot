require_relative '../command_processor'
require_relative '../gridbot'

RSpec.describe CommandProcessor do
  let(:gridbot) { Gridbot.new }
  let(:processor) { CommandProcessor.new(gridbot) }

  def run(cmd)
    processor.process(cmd)
  end

  describe "PLACE command" do
    it "places the gridbot correctly" do
      run("PLACE 2,3,N")
      expect(gridbot.x).to eq(2)
      expect(gridbot.y).to eq(3)
      expect(gridbot.orientation).to eq("N")
    end

    it "ignores malformed PLACE" do
      run("PLACE X,Y,N")
      expect(gridbot.placed).to be false
    end
  end

  describe "ignores commands before PLACE" do
    it "ignores MOVE before PLACE" do
      run("MOVE")
      expect(gridbot.placed).to be false
    end
  end

  describe "command processing after placement" do
    before { run("PLACE 0,0,N") }

    it "executes MOVE" do
      run("MOVE")
      expect(gridbot.y).to eq(1)
    end

    it "executes LEFT" do
      run("LEFT")
      expect(gridbot.orientation).to eq("W")
    end

    it "executes RIGHT" do
      run("RIGHT")
      expect(gridbot.orientation).to eq("E")
    end

    it "executes REPORT" do
      expect { run("REPORT") }.to output("0,0,N\n").to_stdout
    end
  end

  describe "full command sequences" do
    it "matches example 1" do
      run("PLACE 0,0,E")
      run("MOVE")
      expect { run("REPORT") }.to output("1,0,E\n").to_stdout
    end

    it "matches example 2" do
      run("PLACE 0,0,N")
      run("MOVE")
      run("MOVE")
      run("RIGHT")
      run("MOVE")
      expect { run("REPORT") }.to output("1,2,E\n").to_stdout
    end
  end
end
