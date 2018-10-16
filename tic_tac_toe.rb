class Player
    attr_accessor :name, :state, :symbol

    @@number = 0

    def initialize(name, symbol)
        @@name = name
        @@symbol = symbol
        puts "#{name} you're the first player, your symbol is #{symbol}"
    end


    
end

class BoardCase

    attr_accessor :case, :coordinate, :x, :y, :compteur

    def initialize(coordinate)
    @@coordinate = coordinate

    end
    def case
        @@case = "x"
        puts @@case, @@coordinate
    end

end





class Board 
      attr_accessor :spaces

    def initialize
      @spaces = Array.new(9, "-")
    end

    def generate_board 
        board = ""
        (0..8).step(3) do |i|
        board += "| #{@spaces[i]} | #{@spaces[i + 1]} | #{@spaces[i + 2]} |\n"
        end
    puts board + "\n\n\n"
    end

    def add_symbol(position, symbol) 
        

        @spaces[position] = symbol
    end

    def space_taken(position) 
        return @spaces[position] == "X" || @spaces[position] == "O"
    end
end

class Game
    attr_accessor :player1, :player2, :move, :case, :compteur, :positions
    @@positions = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    @@move = Board.new
    @@compteur = 0
    def start 
        puts "************************************"
        puts "** Welcome to the TicTacToe game! **"
        puts "************************************"
        puts "Player 1 name:"
        player1 = gets.chomp
        player1= Player.new(player1, "X")
        puts "Player 2 name:"
        player2 = gets.chomp
        player2= Player.new(player2, "O")
    end

    def play
        if @@compteur %2 == 0 
            puts "Player 1"
            puts "which position? (a1,a2 .. c2,c3)"
            @case = gets.chomp.to_s

            @@move.add_symbol(@@positions.index(@case).to_i, "X")
            @@move.generate_board
        else
            puts "Player 2"
            puts "which position? (a1,a2 .. c2,c3)"
            @case = gets.chomp.to_s
            @@move.add_symbol(@@positions.index(@case).to_i, "O")
            @@move.generate_board
        end    
            @@compteur += 1
    end



end



game = Game.new
game.start
9.times do 
game.play
end