# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # First diagonal
  [2,4,6], # Second diagonal
]

# won? method
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
  position_1 = board[win_combo[0]] #takes 1st index of 1st array
  position_2 = board[win_combo[1]]
  position_3 = board[win_combo[2]]

  position_1 == position_2 && position_2 == position_3 &&
  position_taken?(board, win_combo[0]) #delineates its not an open space
  end
end

#full? method
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

#draw? method
def draw?(board)
  full?(board) && !(won?(board)) ? true : false
end

#over? method
def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end
