class Board
  def initialize
    # puts "What dimension would you like your board?"
    # puts "Please input one integer, (N x N)"
    # @input = gets.chomp.to_i
    # n = input**2
    # @board = (1..n).to_a
    @chosen_blocks = []
    @board = (1..9).to_a
  end

  def show_board
    # # board_size = @board.length
    # split_board = @board.each_slice(n).to_a
    # split_board.each do |x|

# ASCII: This will be the middle rows for each column/row subsection
    middle_row_all = [
      [" "*3 + "#{@board[0]}" + " "*3 + "|", " "*3 + "#{@board[1]}" + " "*3 + "|", " "*3 + "#{@board[2]}" + " "*3],
      [" "*3 + "#{@board[3]}" + " "*3 + "|", " "*3 + "#{@board[4]}" + " "*3 + "|", " "*3 + "#{@board[5]}" + " "*3],
      [" "*3 + "#{@board[6]}" + " "*3 + "|", " "*3 + "#{@board[7]}" + " "*3 + "|", " "*3 + "#{@board[8]}" + " "*3]
    ]
# This will be the top rows for each column/row subsection
    tb_row_all = [" "*7 + "|", " "*7 + "|"," "*7]
# This will be the bottom rows for the first and second top subsections
    bottom_row12 = ["_"*7 + "|", "_"*7 + "|", "_"*7]
# This will be the bottom row for the third(last) bottom subsection
    bottom_row_3 = [" "*7 + "|", " "*7 + "|", " "*7]

    puts tb_row_all.join
    puts middle_row_all[0].join
    puts bottom_row12.join
    puts tb_row_all.join
    puts middle_row_all[1].join
    puts bottom_row12.join
    puts tb_row_all.join
    puts middle_row_all[2].join
    puts tb_row_all.join
  end

  def replace_block(move, current_piece)
    @board[move] = current_piece
    @chosen_blocks << move + 1
  end

  def available_blocks
    available = @board.select { |x| (1..9).to_a.include?(x) }
  end

  def current_board
    @board
  end
end