class Player
	attr_accessor :name, :life_points

	def initialize(blaze)
		@name = blaze
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(hit=0)
		@life_points -= hit
		if @life_points <= 0
			puts "le joueur #{@name} a été tué"
			@life_points = 0
		end
	end

	def attacks(target)
		puts "#{@name} attaque #{target.name}"
		damage = compute_damage
		target.gets_damage(damage)
		puts "il lui inflige #{damage} points de dommages"
	end

	def compute_damage
    	return rand(1..6)
  	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(blaze)
		@weapon_level = 1
		super(blaze)
		@life_points = 100
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		level = rand(1..6)
  		puts "Tu as trouvé une arme de niveau #{level}"
  		if level > @weapon_level
  			@weapon_level = level
  			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  		else
  			puts "Elle n'est pas mieux que ton arme actuelle"
  		end
  	end	

  	def search_health_pack
  		health = rand(1..6)
  		puts "Tu as trouvé une arme de niveau #{level}"
  		if health == 1
  			puts "Tu n'as rien trouvé... Bouffon !"
  		elsif health == 6
  			puts "Waow, tu as trouvé un pack de +80 points de vie !"
  			if @life_points > 20
  				@life_points = 100
  			else
  				@life_points += 80
  			end
  		else
  			if @life_points > 50
  				@life_points = 100
  			else
  				@life_points += 50
  			end
  			 "Bravo, tu as trouvé un pack de +50 points de vie !"
  		end
  	end	
end