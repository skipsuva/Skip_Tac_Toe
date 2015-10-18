
$game_board = {
  :A1 => nil, 
  :A2 => nil, 
  :A3 => nil,
  :B1 => nil, 
  :B2 => nil, 
  :B3 => nil,
  :C1 => nil, 
  :C2 => nil, 
  :C3 => nil
}

$game_status = []

def welcome
  puts "Welcome to Skip Tac Toe!"
  puts "This is a game for two players, and the instructions are as follows:"
  puts "You will be selecting coodinates on the board with the goal of connecting three Xs or three Os."
  puts "The can connect vertically, diagonally, or horizontally."
  sleep 1   #Utilizing the sleep trick to build in a bit more interesting user experience.
  puts "You will select coordinates on the board by indicating the following codes:"
  puts "[A1, A2, A3]"
  puts "[B1, B2, B3]"
  puts "[C1, C2, C3]"
  sleep 1
  puts "GAME ON!"
end

def player_one_turn
  acceptable_answers = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  
  puts "Player 1: please input the location of your move." #code code from player_two_turn

  x = gets.chomp  #DO TO can i elimate this based on the follwoing block?

  until acceptable_answers.include?(x)    #This ensures the players are unputting the correct and recognized gameplay values.
    puts "That is an invalid coordinate, please try again."
    x = gets.chomp
  end

  x = x.to_sym     #this turns the player entry into a symbol so that we can compare it to the cooresponding hash keys

  #We now need to go through each row of the gameboard to check to see if the space is empty.
  #If it is, we can let the player go - if not, they need to choose again.
  if $game_board.keys.include?(x)   #This checks to see if the first row contains the key that matches the player entry
    until $game_board[x] == nil && acceptable_answers.include?(x.to_s)  #this checks to make sure the space is empty AND that the entry is still correct (in case the space is filled)
      puts "Sorry, that space has been chosen already.  Try again."
      x = gets.chomp
      x = x.to_sym
    end
    $game_board[x] = "X"
  end

  puts "You chose #{x}."
  puts "#{$game_board[:A1]}, #{$game_board[:A2]}, #{$game_board[:A3]}"
  puts "#{$game_board[:B1]}, #{$game_board[:B2]}, #{$game_board[:B3]}"
  puts "#{$game_board[:C1]}, #{$game_board[:C2]}, #{$game_board[:C3]}"
   #this prints out the current board with the player moves

end

def player_two_turn
  acceptable_answers = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  puts "Player 2: please input the location of your move." #code code from player_two_turn
  x = gets.chomp

  until acceptable_answers.include?(x)    #This ensures the players are unputting the correct and recognized gameplay values.
    puts "That in an invalid coordinate, please try again."
    x = gets.chomp
  end

  x = x.to_sym     #this turns the player entry into matching hash symbol

  if $game_board.keys.include?(x)   #This checks to see if the first row contains the key that matches the player entry
    until $game_board[x] == nil && acceptable_answers.include?(x.to_s)  #this checks to make sure the space is empty AND that the entry is still correct (in case the space is filled)
      puts "Sorry, that space has been chosen already.  Try again."
      x = gets.chomp
      x = x.to_sym
    end
    $game_board[x] = "O"
  end
  
  puts "You chose #{x}."
  puts "#{$game_board[:A1]}, #{$game_board[:A2]}, #{$game_board[:A3]}"
  puts "#{$game_board[:B1]}, #{$game_board[:B2]}, #{$game_board[:B3]}"
  puts "#{$game_board[:C1]}, #{$game_board[:C2]}, #{$game_board[:C3]}"
   #this prints out the current board with the player moves
end

#This will run after each player turn to see if there is a winner.
#I mapped out each of the 8 winning board layouts for both players, as well as a 'draw' scenario.
def check_board
  #Checks 1 of 8 conditions - Top row horizontal
  if $game_board[:A1] == "X" && $game_board[:A2] == "X" && $game_board[:A3] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"    #This will add a value to the empty array, which our runner method will be on the lookout for.
  end
  if $game_board[:A1] == "O" && $game_board[:A2] == "O" && $game_board[:A3] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 2 of 8 conditions - Middle row horizontal
  if $game_board[:B1] == "X" && $game_board[:B2] == "X" && $game_board[:B3] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:B1] == "O" && $game_board[:B2] == "O" && $game_board[:B3] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 3 of 8 conditions - Bottom row horizontal
  if $game_board[:C1] == "X" && $game_board[:C2] == "X" && $game_board[:C3] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:C1] == "O" && $game_board[:C2] == "O" && $game_board[:C3] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 4 of 8 conditions - First column vertical
  if $game_board[:A1] == "X" && $game_board[:B1] == "X" && $game_board[:C1] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:A1] == "O" && $game_board[:B1] == "O" && $game_board[:C1] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 5 of 8 conditions - Second column vertical
  if $game_board[:A2] == "X" && $game_board[:B2] == "X" && $game_board[:C2] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:A2] == "O" && $game_board[:B2] == "O" && $game_board[:C2] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 6 of 8 conditions - Third column vertical
  if $game_board[:A3] == "X" && $game_board[:B3] == "X" && $game_board[:C3] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:A3] == "O" && $game_board[:B3] == "O" && $game_board[:C3] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 7 of 8 conditions - Diagonal 1
  if $game_board[:A1] == "X" && $game_board[:B2] == "X" && $game_board[:C3] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:A1] == "O" && $game_board[:B2] == "O" && $game_board[:C3] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks 8 of 8 conditions - Diagonal 2
  if $game_board[:A3] == "X" && $game_board[:B2] == "X" && $game_board[:C1] == "X"
    puts "We have a winner!  Player 1!"
    $game_status = "winner"
  end
  if $game_board[:A3] == "O" && $game_board[:B2] == "O" && $game_board[:C1] == "O"
    puts "We have a winner!  Player 2!"
    $game_status = "winner"
  end

  #checks for a draw
  if $game_board.has_value?(nil) == false 
    puts "It's a draw!  Game over, man!"
    $game_status = "draw"
  end

end

#This is the runner - executing the methods in a specific order.
#It will run until there is a winner or until the board is full (resulting in a draw)
welcome
sleep 2   #Dramatic effect
until $game_status.include?("winner") || $game_status.include?("draw")   #This will loop back and forth between player turns until the $game_status array contains a value.
  player_one_turn
  check_board
  if $game_status.include?("winner") || $game_status.include?("draw")
    break   #I found that the program was running through the player 2 turn EVEN when player 1 has just won, so I needed a way to break the loop prematurely if that scenario happens
  end
  player_two_turn
  check_board
end


