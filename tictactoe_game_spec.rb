require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'view.rb'

describe Game do

	describe "#initialize" do
		it "creates a new game" do
			game = Game.new
	    	game.class.should == Game
		end
	end

	describe "#initialize_session" do
		context "with valid input" do
			it "creates players" do
		      game = Game.new
		      game.initialize_session
			end
			it "creates board" do

			end
		end
		context "without valid input" do
        	it "asks for valid input" do

        	end
		end
	end

	describe "#interpret_user_input" do
		context "with valid user input" do
	    	it "returns a mark" do

	    	end
	    end
	    context "with INVALID user input" do
	    	it "ask for valid input" do

	    	end
	    end
	end

	describe "#does_location_exist" do
		context "when location exists" do
			it "returns true" do
		    	
			end
		end
		context "when location does NOT exist" do
			it "returns false" do
		    	
			end
		end
	end

	describe "#find_next_player" do
		it "returns player object for the player to go next" do
	    	
		end
	end

	describe "#result" do
		it "returns winner, stalemate or an empty string" do
	    	
		end
	end

	describe "#winner" do
		context "if there is a winner" do
			it "returns true" do
		    	
			end
        end
        context "if there is no winner" do
			it "returns false" do
		    	
			end
        end
	end

	describe "#stalemate?" do
		context "if there is a stalemate" do
			it "returns true" do
		    	
			end
        end
        context "if there is no stalemate" do
			it "returns false" do
		    	
			end
        end
	end

end