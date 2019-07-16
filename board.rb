class Board
  @@ships = { :A => 'A+++++',
              :B => 'B++',
              :C => 'C', }

  def initialize( width, height )
    raise ArgumentError, 'width and height must be bigger than five and less than eleven.' unless \
      width > 5 && width < 11 && height > 5 && height < 11
    @width = width
    @height = height
    @board = ( Array.new( height ) { Array.new( width ) } ).collect { |l| l.collect { '~' } }
  end

  def put_ship( code, x, y )
    raise ArgumentError, 'position of the \'head\' (x and y) must be inside the board' unless \
      x < @width - 1 && x > -1 && y < @height - 1 && y > -1
    # Check if ship fits in the horizontal direction
    raise ArgumentError, 'the ship does not fit in the board at the specified position' if \
      @@ships[code].length >= @width - x 
    # It fits in the horizontal
    # By now there only ships in the horizontal so i am not checking for the vertical
    @@ships[code].each_char.with_index { |e, index| @board[y][x + index] = e }
  end

  def to_s
    ret = " "
    (0...@width).each { |n| ret << " " + n.to_s + " " }
    ret << "\n"
    @board.each_with_index do |line, y|
      ret << y.to_s
      line.each_with_index do |value, x|
        ret << "|#{ value }|"
      end
      ret << "\n"
    end
    ret
  end
end
b = Board.new( 10, 10 )
b.put_ship( :A, 3, 5 )
puts b.to_s
