require_relative '../gridbot'
require 'pry'

RSpec.describe Gridbot do
  let(:gridbot) { Gridbot.new }

  describe "#place" do
    it "places the gridbot on a valid position" do
      gridbot.place(0, 0, "N")
      expect(gridbot.x).to eq(0)
      expect(gridbot.y).to eq(0)
      expect(gridbot.orientation).to eq("N")
      expect(gridbot.placed).to be true
    end

    it "rejects invalid positions" do
      gridbot.place(10, 10, "N")
      expect(gridbot.placed).to be false
    end

    it "rejects invalid orientations" do
      gridbot.place(0, 0, "X")
      expect(gridbot.placed).to be false
    end
  end

  describe "#move" do
    before { gridbot.place(0, 0, "N") }

    it "moves north" do
      gridbot.move
      expect(gridbot.y).to eq(1)
    end

    it "prevents moving off the grid" do
      gridbot.place(0, 5, "N")
      gridbot.move
      expect(gridbot.y).to eq(5)
    end
  end

  describe "#left and #right" do
    before { gridbot.place(0, 0, "N") }

    it "turns left correctly" do
      gridbot.left
      expect(gridbot.orientation).to eq("W")
    end

    it "turns right correctly" do
      gridbot.right
      expect(gridbot.orientation).to eq("E")
    end
  end

  describe "#report" do
    it "prints the current position" do
      gridbot.place(1, 2, "E")
      expect { gridbot.report }.to output("1,2,E\n").to_stdout
    end

    it "does nothing if not placed" do
      expect { gridbot.report }.not_to output.to_stdout
    end
  end
end
