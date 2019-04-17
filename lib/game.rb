
class Game
	attr_accessor :human_player, :enemies
	def initialize(name)
		@enemies = []
		@human_player = HumanPlayer.new(name)
		player1 = Player.new("Jean Cule")
		player2 = Player.new("Eva Tebattre")
		player3 = Player.new("Nick Tarace")
		player4 = Player.new("Moussa rasé")
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
		@human_player.show_state
		puts "Il reste #{@enemies.count} enemies en jeu."
	end

	def menu
		i = 0
		puts "Quelle action veux-tu effectuer ?"
		puts "                     "
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"
		puts "                     "
		puts "attaquer un joueur en vue :"
		@enemies.each { |e|
		print "#{i} - "
		i += 1
		e.show_state
		}
	end

	def menu_choice(choix)
		while ((choix[0] != "a") and (choix[0] != "s") and (choix[0] != "0") and (choix[0] != "1") and (choix[0] != "2") and (choix[0] != "3"))
		puts 'choisissez entre a s 0 1 2 3'	
		print "action:"
		choix = gets.chomp
	
			if (choix[0] == "a") or (choix[0] == "s") or (choix[0] == "0") or (choix[0] == "1") or (choix[0] == "2") or (choix[0] == "3")
				break
			end
		end
	
		if choix[0] == "a"
			puts "------------------------------------------------"
			@human_player.search_weapon
			puts "------------------------------------------------"
			
		elsif choix[0] == "s"
			puts "------------------------------------------------"
			@human_player.search_health_pack
			puts "------------------------------------------------"
			
		elsif choix[0] == "0"
		
			puts "------------------------------------------------"
			@human_player.attacks(@enemies[0])
			puts "------------------------------------------------"
			
		elsif choix[0] == "1"
			puts "------------------------------------------------"
			@human_player.attacks(@enemies[1])
			puts "------------------------------------------------"
		elsif choix[0] == "2"
			puts "------------------------------------------------"
			@human_player.attacks(@enemies[2])
			puts "------------------------------------------------"
		elsif choix[0] == "3"
			puts "------------------------------------------------"
			@human_player.attacks(@enemies[3])
			puts "------------------------------------------------"
		end

		@enemies.each{|status| 
			if status.life_points == 0
				kill_player(status)
			end}
	end

	def enemies_attacks
		if @enemies.empty?
			return false
		else
			puts "Les autres joueurs t'attaquent !"
			puts "                                                "
			@enemies.each {|fighter| 
				if fighter.life_points > 0 
					fighter.attacks(@human_player) 
				end}
			puts "------------------------------------------------"
		end	
	end

	def end
		puts "La partie est fine"
		if @human_player.life_points > 0
			puts "BRAVO ! TU AS GAGNE !"
		else
			puts "LOSER ! TU AS PERDU !"
		end
	end


end

