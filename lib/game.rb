class Game
    # include Players::Human
    # include Players::Computer

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    attr_accessor :player_1, :player_2, :board

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end
    
    def won?
        WIN_COMBINATIONS.any? { |winning_combo|
            return winning_combo if winning_combo.all? { |el| self.board.cells[el] == "X" } || winning_combo.all? { |el| self.board.cells[el] == "O" }
        }
    end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        if self.won? || self.draw?
            true 
        else
            false
        end
    end
    
    def winner
        self.board.cells[self.won?[0]] if self.won?
    end

    def turn
        if board.turn_count.even?
            player = player_1
        else
            player = player_2
        end 
        input = player.move(board)
        if board.valid_move?(input)
            board.update(input, player)
        else
            turn
        end      
    end

    def play
        until over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cat's Game!"
        end
    end
end