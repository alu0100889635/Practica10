require 'platodsl'
class Menudsl

    attr_accessor :nombre, :platos, :desc, :precios

    def initialize(nombre, &block)
        @nombre = nombre
        @desc = ""
        @platos = []
        @precios = []

        if block_given?  
            if block.arity == 1
              yield self
            else
             instance_eval(&block) 
            end
        end
    end

    def descripcion(nombre)
         @desc = nombre
    end

    def plato(plate)
        @platos << plate
    end

    def precio(price)
        @precios << price
    end

    def to_s
        output = "\n\n#{@nombre}"
        output << "\n#{'=' * @nombre.size}\n\n"
        output << "#{@desc}\n\n"
        output << "Platos: \n"
        @platos.each_with_index do |plato, index| 
            output << "#{plato}Precio: #{@precios.at(index)} €\n\n"
        end
        output
    end

end