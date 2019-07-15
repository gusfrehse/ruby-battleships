class Board
  @@ships = { :A => 'A+++++',
              :B => 'B++',
              :C => 'C', }

  def initialize( width, height )
    raise ArgumentError, 'width and height must be bigger than five and less than eleven.' unless \
      width > 5 && width < 11 && height > 5 && height < 11
    @width = width
    @height = height
    @board = (Array.new( height ) { Array.new( width ) }).collect { |l| l.collect { 0 } }
  end

  def put_ship( code, x, y )
    raise ArgumentError, 'position (x and y) must be inside the board' unless x < @width - 1 && x > -1 \
      && y < @height - 1 && y > -1
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
p b
b.put_ship( :A, 6, 5 )
puts b.to_s
