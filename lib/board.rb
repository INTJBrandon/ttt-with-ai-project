class Board
    attr_accessor :cells

    def initialize(cells = nil)
        @cells = cells || Array.new(9, " ")
      end

      def reset!
        @cells = Array.new(9, " ")
    end
    
    def display
        puts(" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
        puts("-----------")
        puts(" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
        puts("-----------")
        puts(" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
    end

    def position(input)
        @cells[input.to_i - 1]
    end

    def taken?(position)
        move = position.to_i - 1
        if self.cells[move] == "X" || self.cells[move] == "O"
            true
        else
            false
        end
    end

      def full?
        @cells.none?{|spaces| spaces == " "}
      end

      def turn_count
        counter = 0
      @cells.each do |player|
        if player == "X" || player == "O"
          counter += 1
        end
      end
      counter
      end

      def valid_move?(position)
        if position.to_i > 0 && position.to_i < 10
            if self.taken?(position) 
                false
            else
                true
            end
        end
    end
    def update(input, player)
        @cells[input.to_i - 1] = player.token
    end
      
end