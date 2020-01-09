require 'plato'

class Platoefi < Plato

    # def <=>(other)
	# 	@eficiencia <=> other.eficiencia
    # end

    # Se redefine la comparación para que se realice en base a la huella nutricional
	#
	# @param other [Plato] tipo del parámetro
    # @return [Boolean] verdadero o falso si se cumple la condición o no.
    def <=>(other)
	    huella_nutricional <=> other.huella_nutricional
    end
    
    # Devuelve el valor del atributo
	#
    attr_accessor :gei, :usoterreno, :eficiencia

    # Inicializa el objeto de la clase Platoefi
	#
	# @param arraycontent [Array] array con los alimentos del plato
	# @param nombre [String] nombre del plato
    def initialize(arraycontent, nombre)
        super
        @gei = get_gei
        @usoterreno = get_usoterreno
        @eficiencia = get_eficiencia_energetica
    end

    def to_s
        output = @nombre
        output << "\n#{'=' * @name.size}\n\n"
        output << "Alimento: #{@alimentos.join(', ')}\n\n"
        output
    end
    # Calcula y devuelve la cantidad de gases de efecto invernadero del plato
	#
	# @return [Float] gases de efecto invernadero
    def get_gei
        aux = 0.0
        @contenido.each do |alimento|
            aux += alimento.gei
        end
        @gei = aux
    end

    # Calcula y devuelve la cantidad de uso del terreno del plato
	#
	# @return [Float] uso del terreno
    def get_usoterreno
        aux = 0.0
        @contenido.each do |alimento|
            aux += alimento.ground
        end
        @usoterreno = aux
    end

    # Calcula y devuelve la eficiencia energética del plato
	#
	# @return [Float] eficiencia energética
    def get_eficiencia_energetica
        aux = 0.0
        @contenido.each do |alimento|
            aux += alimento.eficiencia_energetica
        end
        @eficiencia = aux
    end

    # Calcula y devuelve la huella nutricional del plato
	#
	# @return [Float] huella nutricional
    def huella_nutricional
        ((get_impacto_energia + get_impacto_gei)/2).ceil(2)
    end

    # Calcula y devuelve el índice de impacto de la energía
	#
	# @return [Float] índice de impacto de energía
    def get_impacto_energia
        ip_energia = 0.0
        case
            when @vct < 670
                ip_energia = 1.0
            when @vct <= 830
                ip_energia = 2.0
            else
                ip_energia = 3.0
        end
        ip_energia
    end

    # Calcula y devuelve el índice de impacto de huella de carbono
	#
	# @return [Float] índice de impacto carbono
    def get_impacto_gei
        ip_carbono = 0.0 
        case
            when @gei < 800
                ip_carbono = 1.0
            when @gei <= 1200
                ip_carbono = 2.0
            else
                ip_carbono = 3.0
        end
        ip_carbono
    end
end