require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# puts "combattant 1 comment t'appelles-tu ?"
# print ">"
# name1 = gets.chomp
# puts "combattant 2 comment t'appelles-tu ?"
# print ">"
# name2 = gets.chomp
# player1 = Player.new(name1)
# player2 = Player.new(name2)
# puts "Voici l'état de chaque joueur :"
# player1.show_state
# player2.show_state
# while (player1.life_points > 0) or (player1.life_points > 0)
# 	puts "----------------------------"
# 	puts "Passons à la phase d'attaque :"
# 	player1.attacks(player2)
# 	if player2.life_points <= 0
# 		break
# 	end
# 	player2.attacks(player1)
# end
my_game = Game.new("alex")
binding.pry