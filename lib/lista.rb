require 'alimento'
Node = Struct.new(:value, :next, :prev)

class Lista

	include Enumerable

	# Recorre los elementos de una lista y ejecuta acciones sobre el valor del elemento evaluado en ese momento
	#
	def each
		aux = @head
		while (aux != nil) do
			yield aux["value"]
			aux = aux["next"]
		end
	end

	$eficiencia_diaria, $eficiencia_anual = 0.0, 0.0
	
	# Devuelve el valor del atributo
	#
	attr_accessor :head, :tail, :size

	# Inicializa el objeto de la clase Lista
	#
	# 
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

	# Inserta un nodo en la lista
	#
	# @param aliment [Node] nodo que contiene el alimento
	def insert_one(aliment)
		node = Node.new(aliment, nil, nil)
		if(empty)
			@head = node
			@tail = node
		else
			node["prev"] = @tail
			@tail["next"] = node
			@tail = node
		end
		@size += 1
	end

	# Inserta más de un nodo en la lista
	#
	# @param arrayaliment [Array] array que contiene los alimentos a insertar
	def insert_many(arrayaliments)
		
		arrayaliments.each do | aliment |
			insert_one(aliment)
		end
	end

	# Devuelve el nodo head de la lista
	#
	# @return [Node] nodo head
	def extract_head
		if(!empty)
			aux = @head
			@head = @head["next"]

			if(@head != nil)
				@head["prev"] = nil
			else
				@tail = nil
			end
		
			@size -= 1
			aux["next"] = nil
			aux["value"]

		else
			empty_to_s
		end

	end

	# Devuelve el nodo tail de la lista
	#
	# @return [Node] nodo tail
	def extract_tail
                if(!empty)
                        aux = @tail
                        @tail = @tail["prev"]

                        if(@tail != nil)
                                @tail["next"] = nil
                        else
                                @head = nil
                        end

                        @size -= 1
                        aux["prev"] = nil
						aux["value"]
		else
			empty_to_s

                end

        end

	# Comprueba si la lista está vacía y devuelve verdadero o falso
	#
	# @return [Boolean] estado de la lista
	def empty
		if((@head == nil) && (@tail == nil) && (@size == 0))
			true
		else
			false
		end
	end

	# Devuelve un mensaje cuando la lista está vacía
	#
	# @return [String] mensaje lista vacía
	def empty_to_s
		"La lista está vacía y, por tanto, no es posible extraer más nodos"
	end

	# Calcula la eficiencia diaria de los alimentos de la lista
	#
	# @return [Float] valor eficiencia diaria
	def calculate_eficiencia_diaria
		aux = @head
		while (aux != nil) do
			$eficiencia_diaria += aux["value"].get_eficiencia_energetica
			aux = aux["next"]
		end
		$eficiencia_diaria = $eficiencia_diaria.ceil(2)

	end

	# Devuelve la eficiencia diaria de los alimentos de la lista
	#
	# @return [Float] valor eficiencia diaria
	def get_eficiencia_diaria
		calculate_eficiencia_diaria
	end

	# Calcula y devuelve la eficiencia anual de los alimentos de la lista
	#
	# @return [Float] valor eficiencia anual
	def get_eficiencia_anual
		if $eficiencia_diaria == 0.0
			$eficiencia_anual = get_eficiencia_diaria * 365
		else
			$eficiencia_anual = $eficiencia_diaria * 365
		end
		$eficiencia_anual = $eficiencia_anual.ceil(2)
	end
 
end
