require 'bundler'
Bundler.require

require_relative 'lib/player'

class Game
	attr_accessor :human_player, :enemies
	def initialize(name)
		@enemies = []
		@human_player = player.new(name)
		player1 = player.new("Jean Cule")
		player2 = player.new("Eva Tebattre")
		player3 = player.new("Nick Tarace")
		player4 = player.new("Moussa rasé")
		@enemies.push(player1, player2, player3, player4)
	end

	def kill_player(dead)
		@enemies.delete(dead)
	end

	def is_still_ongoing?
		if (@human_player.life_points >0) && (!@enemies.empty?)
			return true
		else
			return false
		end
	end

	def show_players
		@human_player.show_player
		puts "Il reste #{@enemies.count} enemies en jeu."
	end

	def menu
		puts "Quelle action veux-tu effectuer ?"
		puts "                     "
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"
		puts "                     "
		puts "attaquer un joueur en vue :"
		@enemies.each { |e| i = 0
		puts "#{i} - #{e.show_sate}"
		i += 1
		}
		print "action:"
	end
end

