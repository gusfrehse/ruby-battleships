class Board
  @@ships = { :A => [ ['A', '+', '+'] ],
              :B => [ ['B', '+', '~'],
                      ['+', '+', '+'] ],
              :C => [ ['C'],
                      ['+'],
                      ['+'] ] }

  def initialize( width, height )
    raise ArgumentError, 'width and height must be bigger than five and less \
      than eleven.' unless width > 5 && width < 11 && height > 5 && height < 11
    @width = width
    @height = height
    @board = ( Array.new( height ) { Array.new( width ) } )
    @board = @board.collect { |l| l.collect { '~' } }
  end

  def put_ship( code, hx, hy )
    # TODO : the ship's head is expected to be in the top left corner in the
    # design, we don't want that in the final result
    hdy = 0
    hdx = 0
    @@ships[code].each_with_index do |line, dy|
      line.each_with_index do |value, dx|
        by = dy - hdy + hy
        bx = dx - hdx + hx
        unless value == '~'
          raise ArgumentError, 'desired position is not inside the board' \
            if by > @height - 1 || by < 0 || bx > @width - 1 || bx < 0
         
          raise ArgumentError, "there's a ship in the desired position" \
            if @board[by][bx] != '~'
          @board[by][bx] = value
        end
      end
    end
#    raise ArgumentError, 'position (x and y) must be inside the board' \
#      unless x < @width - 1 && x > -1 && y < @height - 1 && y > -1
  end

  def to_s
    ret = ""
    @board.each_with_index do |line, y|
      line.each_with_index do |value, x|
        ret << "|#{ value }|"
      end
      ret << "\n"
    end
    ret
  end
end
b = Board.new( 10, 10 )
b.put_ship( :A, 6, 5 )
b.put_ship( :B, 4, 3 )
b.put_ship( :C, 0, 0 )
puts b.to_s
