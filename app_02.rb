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
user = HumanPlayer.new(name_user)
player1 = Player.new("Josianne")
player2 = Player.new("José")
enemies = [player1,player2]
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  	user.show_state
	puts "Quelle action veux-tu effectuer ?"
	puts "                     "
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts "                     "
	puts "attaquer un joueur en vue :"
	print "0 - "
	player1.show_state
	print "1 - "
	player2.show_state
	print "action:"
	choix = gets.chomp
	while ((choix[0] != "a") and (choix[0] != "s") and (choix[0] != "0") and (choix[0] != "1"))
		puts 'choisissez entre "a" "s" "0" ou "1"'	
		print "action:"
		choix = gets.chomp
	
		if (choix[0] == "a") or (choix[0] == "s") or (choix[0] == "0") or (choix[0] == "1")
			break
		end
	end
	
		if choix[0] == "a"
			puts "------------------------------------------------"
			user.search_weapon
			puts "------------------------------------------------"
			
		elsif choix[0] == "s"
			puts "------------------------------------------------"
			user.search_health_pack
			puts "------------------------------------------------"
			
		elsif choix[0] == "0"

			puts "------------------------------------------------"
			user.attacks(player1)
			puts "------------------------------------------------"
			
		elsif choix[0] == "1"
			puts "------------------------------------------------"
			user.attacks(player2)
			puts "------------------------------------------------"
			
		end
	
	
	puts "Les autres joueurs t'attaquent !"
	puts "                                                "
	enemies.each {|fighter| 
		if fighter.life_points > 0 
		fighter.attacks(user) 
		end}
	puts "------------------------------------------------"
end
puts "La partie est fine"
if user.life_points >0
	puts "BRAVO ! TU AS GAGNE !"
else
	puts "LOSER ! TU AS PERDU !"
end

#binding.pry