require 'rspec'

class ComputerPlayer
  attr_reader :number, :table
  def initialize
    generate_number
    initialize_table
  end

  def submit_guess_for_human_number
  end

  def get_guess_response(square_count, circle_count)
  end

  def generate_number
    [1,2,3,4]
  end

  def initialize_table
    @table = []
    number = [0,0,0,0]
    while number != [9,8,7,6] do
      if number[0] < 9
        number[0] += 1
      else 
        number[0] = 0
        number[1] += 1

        if number[1] < 9
          number[1] += 1
        else
          number[1] = 0
          number[2] += 1

          if number[2] < 9
            number[2] += 1
          else
            number[2] = 0
            number[3] += 1
            if number[3] > 9
              number[3] = 0
            end
          end
        end
      end

      p  number

      # [1,1,2,3].uniq
      @table << number if number.uniq.count == 4
    end
  end


end

RSpec.describe "ComputerPlayer" do
  context "the first round" do
    let(:human_number) { [1,2,3,4] }

    describe "generating the guess" do
      it "returns a random guess" do
        p ComputerPlayer.new.submit_guess_for_human_number

      end
    end


  end
end

