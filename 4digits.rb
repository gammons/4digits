# sqaures means  it's in my number and the wrong position
# circle means it's in my number and the right position
# computer has [1,2,3,4]
# human puts a guess in [1,2,7,8]
# computer will output [1,2,7,8], sqaures = 2, circles = 0
# computer guesses human's sequence
# computer will output a guess [2,3,4,5]
# human has to fill in how many squares or circles it is
#
#
won = false

def generate_computer_sequence
  numbers = [[0,1,2,3],[0,1,2,4]]
  numbers[1]
end

def get_human_guess
  $stdout << "Enter your guess: "
  numbers = gets.chomp
  $stdout << "Your number is #{numbers}\n"


end

human_guesses = []
computer_guesses = []
rounds = 0

while !won and rounds < 10 do
  computer_numbers = generate_computer_sequence
  $stdout << "Human!  pick your number sequence.\n"
  guess = get_human_guess
  human_guesses <<  guess


  rounds++
end
