#use 3 arrays as the board
#states board parameters in message - current status, current available
#get user input for two, x or o, in array location
#adds entry to specific array index

#figure out way to check current status

#when winner, 


#when draw




#need gameboard array built


def welcome
  puts "Welcome to Tic Tac Toe!"
  puts "This is a game for two players, and the instructions are as follows:"
  puts "You will be selecting coodinates on a board with the goal of connecting three."
  puts "The can connect vertically, diagonally, or horizontally."
  sleep 1
  puts "You will select coordinates on the board by indicating the following codes:"
  puts "[A1, A2, A3]"
  puts "[B1, B2, B3]"
  puts "[C1, C2, C3]"
  sleep 1
  puts "GAME ON!"
end

#This will run when it is the turn of 'x'
def player_one_turn
  #code
  puts "Player 1: please input the location of your move." #code code from player_two_turn
  x = gets.chomp
  puts "You chose #{x}."
end

#This will run when it is the turn of 'o'
def player_two_turn
  #code
  puts "Player 2: please input the location of your move."
  o = gets.chomp
  #need to choose a conditional that allows for: correct board select, also checks current board for open slot or not

  if o != "A1" || "A2" || "A3" || "B1" || "B2" || "B3" || "C1" || "C2" || "C3" 
  #also need to check the arrays for exisiting entries
  #could probably do this in a more effecient way
    puts "Invalid entry, please try again." #how do we get this to loop back?
    puts "Player 2: please input the location of your move."
    o = gets.chomp
  end
  puts "You chose #{o}."

  #input here
end

def coordinates_input
  #this is where the program needs to push the selection into the correct array
  #should this just live in each player turn method?
end

def print_current_board
  #neccessary?  nice?
end

def check_board
  #this will check the conditions of possible successes
  #if conditions not met, go back to next player
  #if conditions met, announce winner




#Runner
welcome
sleep 3
player_two_turn


