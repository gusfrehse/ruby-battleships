# This is supposed to be a Battleships game.
# only supposed because I almosted never
# finish my projects.
require_relative "board"

class Application
  @@board01 = "board 01 test lul\n"

  def select_phase
    puts "Player 01 look to the pc, Player 02 look away"
    sleep 5
    puts "Player 01, I just wanted to say you're so much more beatiful than \
      Player 02.\nAnyway, here is your board"
    print @@board01
    puts "and here is your ships. Now, you need to understand something \
      rather difficult.\nFirst, each ship looks like this:\n\
      A+++++\n\
      Each ship has a letter. This letter we will call CODE. The ship's CODE \
      is what you can think as the name of the ship. So when I ask for a ship \
      you will NOT write the actual ship, but WILL write it's CODE. The CODE \
      is also the 'head' of the ship (in this case it is the letter 'A'). Do \ 
      you understand? If not, too bad because I am a pre-written message.\n\
      Also, it is important for you to know what is position and what is the \
      position of the ships. Position, at least in this game is a combination \
      of two numbers, a X (horizontal) and an Y (vertical) number. The \ 
      position of the ship is based on the position of the ship's CODE, which \
      is the letter, which is the 'head' of the ship and which is the only \
      character in the ship different from '+'."
  end

  def run( width, height )
    puts "Starting game"
    b1 = Board.new( width, height )
    b2 = Board.new( width, height )

    puts "01 enter three positions"
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b1.put_ship( :A,  posa[0].to_i, posa[1].to_i )
    puts b1.to_s
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b1.put_ship( :B,  posa[0].to_i, posa[1].to_i )
    puts b1.to_s
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b1.put_ship( :C,  posa[0].to_i, posa[1].to_i )
    puts b1.to_s
    puts "This is your board now"
    puts b1.to_s

    puts "02 enter three positions"
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b2.put_ship( :A,  posa[0].to_i, posa[1].to_i )
    puts b2.to_s
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b2.put_ship( :B,  posa[0].to_i, posa[1].to_i )
    puts b2.to_s
    pos = gets
    pos.strip!
    posa = pos.split( " " )
    b2.put_ship( :C,  posa[0].to_i, posa[1].to_i )
    puts b2.to_s
    puts "This is your board now"
    puts b2.to_s
  end
end

app = Application.new
app.run( 10, 10 )
