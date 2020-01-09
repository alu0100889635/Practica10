class Platodsl

    attr_accessor :nombre, :alimentos

    def initialize(nombre, &block)
        @nombre = nombre
        @alimentos = []

        if block_given?  
            if block.arity == 1
              yield self
            else
             instance_eval(&block) 
            end
        end
    end

    def alimento(aliment)
        @alimentos << aliment
    end

    def to_s
        output = "\n\n#{@nombre}"
        output << "\n#{'=' * @nombre.size}\n\n"
        output << "Alimentos: \n#{@alimentos.join(', ')}\n\n"
        output
    end
end