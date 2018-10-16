class Player
    attr_accessor :name, :state, :symbol

    @@number = 0

    def initialize(name, symbol)
        @@name = name
        @@symbol = symbol
        puts "#{name} your symbol is #{symbol}"
    end
end

class Board 
    attr_accessor :spaces, :board
    @@positions = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    def initialize
        @@spaces = Array.new(9, "-")
    end

    def get_spaces
        return @@spaces
    end

    def generate_board 
        @@board = ""
        (0..8).step(3) do |i|
            @@board += "| #{@@spaces[i]} | #{@@spaces[i + 1]} | #{@@spaces[i + 2]} |\n"
        end
        puts @@board + "\n\n\n"
    end

    def add_symbol(position, symbol) 
        pos = @@positions.index(position).to_i
        
        while @@spaces[pos] != "-" do
            puts "Space taken, choose another one"
            pos = gets.chomp.to_s
            pos = pos.downcase!
            pos = @@positions.index(pos).to_i
        end
        @@spaces[pos] = symbol
     end

end

class Game
    attr_accessor :player1, :player2, :move, :case, :compteur, :positions, :name1, :name2, :board, :combi
    @@positions = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    @@move = Board.new
    @@compteur = 0
    @@win_combi = [[0, 1, 2], [0, 4, 8], [0, 3, 6], [3, 4, 5], [6, 7, 8], [6, 4, 2], [1, 4, 7], [2, 5, 8]]
      @@combix = []
      @@combo = []

    def start 
        puts "Player 1 name:"
        @@name1 = gets.chomp
        player1= Player.new(@@name1, "X")
        puts "Player 2 name:"
        @@name2 = gets.chomp
        player2= Player.new(@@name2, "O")
    end

    def play
    
        @@compteur = 0
        y = 0
        w = 0
        z = 0
        @@move.generate_board
        until @@compteur >=  9 || w == 1 || z == 1
            x = 0
            puts "Turn N°#{@@compteur+1}"
            if @@compteur %2 == 0 
                puts "#{@@name1}'s turn"
                puts "Which position? (a1,a2 .. c2,c3)"
                @case = gets.chomp.to_s
                @case = @case.downcase!
                while @@positions.include?(@case) == false do
                    puts "Invalid position. Please choose another one"
                    @case = gets.chomp.to_s
                end

                @@move.add_symbol(@case, "X")
                @@move.generate_board
        
            else
                puts "#{@@name2}'s turn"
                puts "Which position? (a1,a2 .. c2,c3)"
                @case = gets.chomp.to_s
                @case = @case.downcase!
                while @@positions.include?(@case) == false do
                    puts "Invalid position. Please choose another one"
                    @case = gets.chomp.to_s
                end

                @@move.add_symbol(@case, "O")
                @@move.generate_board
            end    

            @@move.get_spaces.each do |i|
            @@combix << x if i == "X"
            @@combo << x if i == "O"
            x +=1
        end
        
        @@win_combi.each { |i| w = 1 if (@@combix + i).uniq == @@combix}
        @@win_combi.each { |i| z = 1 if (@@combo + i).uniq == @@combo}
        @@compteur += 1
        y += 1
        @@combo = []
        @@combix = []
        end

        if w == 1
            puts "#{@@name1} wins !"
        elsif z == 1
            puts "#{@@name2} wins !"
        else
            puts "You're both losers"
        end
        replay
    end

    def replay

    puts "Do you want a rematch? Y/N"
    replay= gets.chomp
    if replay == "Y"
        @@move = Board.new
        @@compteur = 0
        @@combix = []
          @@combo = []
        start
        play

    end
    end
end

game = Game.new

game.start

game.play
