class Food
	
	include Comparable
	attr :eficiencia_energetica

	# Devuelve el valor del atributo
	#
	attr_accessor :name, :proteins, :carbohydrates, :lipids, :gei, :ground, :amount

	# Se redefine la comparación para que se realice en base a la eficiencia energética
	#
	# @param other [Food] tipo del parámetro
	# @return [Boolean] verdadero o falso si se cumple la condición o no.
	def <=>(other)
		@eficiencia_energetica <=> other.eficiencia_energetica
	end

	# Inicializa el objeto de la clase Food
	#
	# @param name [String] nombre del alimento
	# @param proteins [Float] cantidad de proteínas
	# @param carbohydrates [Float] cantidad de carbohidratos
	# @param lipids [Float] cantidad de lípidos
	# @param gei [Float] cantidad de gases de efecto invernadero
	# @param ground [Float] cantidad de uso del terreno
	# @param amount [Float] cantidad de alimento
	def initialize(name, proteins, carbohydrates, lipids, gei, ground, amount)
		@name = name
		@proteins = ((amount * proteins)/100).ceil(2)
		@carbohydrates = ((amount * carbohydrates)/100).ceil(2)
		@lipids = ((amount * lipids)/100).ceil(2)
		@gei = ((amount * gei)/1000).ceil(2)
		@ground = ((amount * ground)/1000).ceil(2)
		@amount = amount
		@eficiencia_energetica = get_eficiencia_energetica
	end

	# Devuelve el nombre del alimento
	#
	# @return [String] nombre del alimento
	def get_name
		@name
	end

	# Devuelve la cantidad de proteínas del alimento
	#
	# @return [Float] cantidad de proteínas
	def get_proteins
		@proteins
	end

	# Devuelve la cantidad de carbohidratos del alimento
	#
	# @return [Float] cantidad de carbohidratos
	def get_carbohydrates
		@carbohydrates
	end

	# Devuelve la cantidad de lípidos del alimento
	#
	# @return [Float] cantidad de lípidos
	def get_lipids
		@lipids
	end

	# Devuelve la cantidad de gases de efecto invernadero que genera el alimento. Se toman como si fuera la emisión de carbono que se genera, es decir, en kgCO2eq
	#
	# @return [Float] cantidad de gases de efecto invernadero 
	def get_gei
		@gei
	end

	# Devuelve la cantidad de uso del terreno para generar el alimento. 
	#
	# @return [Float] cantidad de uso del terreno
	def get_ground
		@ground
	end

	# Devuelve la cantidad de alimento
	#
	# @return [Float] cantidad de alimento
	def get_amount
		@amount
	end

	# Devuelve la cantidad de kcal que aporta el alimento
	#
	# @return [Float] cantidad de kcal
	def get_kcal
		kcal = calculate_kcal
	end

	# Calcula la cantidad de kcal que produce el alimento
	#
	# @return [Float] cantidad de kcal
	def calculate_kcal
		kcal = 0.0
		kcal += (@lipids * 9) + (@carbohydrates * 4) + (@proteins * 4)
		kcal.ceil(2)
	end

	# Devuelve la cantidad de kcal generadas por m² del alimento
	#
	# @return [Float] cantidad de kcal
	def get_kcal_ground
		#Se calculan las kcal generadas por m²
		kcal = calculate_kcal_ground
	end

	# Calcula las kcal que produce el alimento por m² utilizado (kcal/m²) mediante la siguiente regla de tres:
	# uso de terreno m² -----> kcal que produce el alimento
	# 1m²               -----> ?kcal/m²
	#
	# @return [Float] cantidad de kcal/m² 
	def calculate_kcal_ground
		kcal = 0.0
		kcal += (@lipids * 9) + (@carbohydrates * 4) + (@proteins * 4)
		kcal = kcal/@ground
		kcal.ceil(2)
	end

	#Se calculan los gases de efecto invernadero generados por kcal. Se utilizan las siguientes reglas de tres:
	# 1 kgCO2eq ---> 3.353 kWh
	# 1 kWh ---> 3600 kJ
	# 1 kJ ---> 0,239006 kcal
	#
	#@return [Float] cantidad de gases de efecto invernadero por kcal
	def get_gei_kcal
		geikcal = @gei * 3.353
		geikcal = geikcal * 3600
		geikcal =  geikcal * 0.239006
		geikcal.ceil(2)
	end

	#Se calculan los gases de efecto invernadero generados por kcal por m². Se utiliza la equivalencia siguiente:
	#kJ/m² ---> kcal/m²
	#
	#@return [Float] cantidad de gases de efecto invernadero por kcal
	def get_gei_ground
		geikcal = get_gei_kcal
		geikcalground = geikcal / @ground #(kcal/m²)
		geikcalground.ceil(2)
	end

	#Se calcula la eficiencia energética del alimento mediante las kcal generadas y los gases de efecto invernadero por metro² necesarios para generar dichas kcal
	#
	#@return [Float] ceficiencia energética
	def get_eficiencia_energetica
		eficiencia = 0.0
		kcal = calculate_kcal_ground #devuelve las calorias producidas por m² (kcal/m)²
		geikcalground = get_gei_ground #devuelve la energia necesaria para producir esas calorias por m² ( kcal/m)²
		eficiencia = kcal/geikcalground #Se calcula la energia necesaria para producir la cantidad de alimento indicada habiendo calculado sus kcal
		eficiencia.ceil(2)
	end

	#Devuelve el alimento formateado con toda su información alimentaria
	#
	#@return [String] alimento formateado
	def to_s
		"\n#{@amount}g de #{@name} -> Proteínas #{@proteins}g, Carbohidratos #{@carbohydrates}g, Lípidos #{@lipids}g, Gases de efecto invernadero #{@gei} kgCO2eq, Uso del terreno #{@ground} m²"
	end
end
