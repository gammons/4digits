# here is a comment at the top!
require 'rspec'

class GuessParser
  attr_reader :number, :guess
  attr_reader :square_count, :circle_count

  def initialize(number, guess)
    @number= number
    @guess = guess
    @square_count = 0
    @circle_count = 0
  end

  def parse
    get_number_of_circles
    get_number_of_squares
  end

  def get_number_of_circles
    (0..3).each do |x|
      digit = @guess[x]
      (0..3).each do |y|
        @circle_count += 1 if @number[y] == digit and x != y
      end
    end
    @circle_count
  end

  def get_number_of_squares
    (0..3).each do |x|
      if @number[x] == @guess[x]
        @square_count += 1
      end
    end
    @square_count
  end
end

RSpec.describe "GuessParser" do
  describe "getting the number of squares" do
    context "when we have one correct digit in the correct order" do
      let(:number) { [1,2,3,4] }
      let(:guess) { [1,5,6,7] }
      let(:parser) { GuessParser.new(number, guess) }

      it "returns 1 square" do
        expect(parser.get_number_of_squares).to be(1)
      end
    end

    context "when we have 2 correct digits in the correct order" do
      let(:number) { [1,2,3,4] }
      let(:guess) { [1,5,3,7] }
      let(:parser) { GuessParser.new(number, guess) }

      it "returns 2 squares" do
        expect(parser.get_number_of_squares).to be(2)
      end
    end
  end

  describe "getting the number of circles" do
    context "when we have one correct digit somewhere in the number" do
      let(:number) { [1,2,3,4] }
      let(:guess) { [5,6,7,1] }
      let(:parser) { GuessParser.new(number, guess) }

      it "returns 1 circle" do
        expect(parser.get_number_of_circles).to be(1)
      end

      context "when the number is actually a square" do
        let(:number) { [1,2,3,4] }
        let(:guess) { [1,5,6,7] }
        let(:parser) { GuessParser.new(number, guess) }
        it "does not return a circle" do
          expect(parser.get_number_of_circles).to_not be(1)
          expect(parser.get_number_of_circles).to be(0)
        end
      end
    end

    context "when we have two correct digits somewhere in the number" do
      let(:number) { [1,2,3,4] }
      let(:guess) { [2,5,7,1] }
      let(:parser) { GuessParser.new(number, guess) }

      it "returns 2 circles" do
        expect(parser.get_number_of_circles).to be(2)
      end
    end
  end
end
