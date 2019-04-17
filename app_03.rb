require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Wsh bien ou quoi, comment t'appelles-tu ?"
print ">"
name_user = gets.chomp
my_game = Game.new(name_user)
while my_game.is_still_ongoing?
	my_game.show_players
	my_game.menu
	print "action:"
	choix = gets.chomp
	my_game.menu_choice(choix)
	my_game.enemies_attacks
end
my_game.end
