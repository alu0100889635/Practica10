require 'lista'
class Plato

    include Comparable

    # Se redefine la comparación para que se realice en base al valor calórico total
	#
	# @param other [Plato] tipo del parámetro
	# @return [Boolean] verdadero o falso si se cumple la condición o no.
    def <=>(other)
		@vct <=> other.vct
    end

    # Devuelve el valor del atributo
	#
    attr_accessor :contenido, :nombre, :proteinas, :carbohidratos, :lipidos, :vct

    # Inicializa el objeto de la clase Plato
	#
	# @param arraycontent [Array] array con los alimentos del plato
	# @param nombre [String] nombre del plato
    def initialize(arraycontent, nombre)
        @contenido = Lista.new()
        @nombre = nombre
        @proteinas = 0.0
        @carbohidratos = 0.0
        @lipidos = 0.0
        @cantidadtotal = 0.0
        @vct = 0.0
        arraycontent.each do | alimento |
            @contenido.insert_one(alimento)
            @proteinas += alimento.proteins
            @carbohidratos += alimento.carbohydrates
            @lipidos += alimento.lipids
            @cantidadtotal += alimento.amount
            @vct += alimento.get_kcal
        end
    end

    # Calcula y devuelve la cantidad de proteínas del plato
	#
	# @return [Float] cantidad de proteínas
    def get_proteinas
        porcentaje = (@proteinas * 100)/@cantidadtotal
        porcentaje.ceil(2)
    end

    # Calcula y devuelve la cantidad de carbohidratos del plato
	#
	# @return [Float] cantidad de carbohidratos
    def get_carbohidratos
        porcentaje = (@carbohidratos * 100)/@cantidadtotal
        porcentaje.ceil(2)
    end

    # Calcula y devuelve la cantidad de lípidos del plato
	#
	# @return [Float] cantidad de lípidos
    def get_lipidos
        porcentaje = (@lipidos * 100)/@cantidadtotal
        porcentaje.ceil(2)
    end

    # Devuelve el plato formateado con su información
	#
	# @return [String] plato formateado
    def to_s
        aux = "#{@nombre}: "
        @contenido.each do |alimento|
            aux.concat("#{alimento.name} #{alimento.amount}g ")
        end
        aux.concat(".")
    end
end