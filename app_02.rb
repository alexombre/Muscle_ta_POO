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
user = Player.new(name_user)
player1 = Player.new("Josianne")
player2 = Player.new("José")
enemies = [player1,player2]
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  	user.show_sate
	puts "Quelle action veux-tu effectuer ?"
	puts "                     "
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts "                     "
	puts "attaquer un joueur en vue :"
	puts "0 - #{player1.show_sate}"
	puts "1 - #{player2.show_sate}"
	print "action:"
	choix = gets.chomp
	while choix[0] == ("a" or "s" or "0" or "1")
		if choix[0] == "a"
			user.search_weapon
		elsif choix[0] == "s"
			user.search_health_pack
		elsif choix[0] == "0"
			user.attacks(player1)
		elsif choix[0] == "1"
			user.attacks(player2)
		else
			puts 'choisissez entre "a" "s" "0" ou "1"'
		end
	end
end
puts "Les autres joueurs t'attaquent !"

enemies.each {|fighter| if fighter.life_points > 0 
	fighter.attacks(user) 
	end}

puts "La partie est fine"
if user.life_points >0
	puts "BRAVO ! TU AS GAGNE !"
else
	puts "LOSER ! TU AS PERDU !"
end

binding.pry