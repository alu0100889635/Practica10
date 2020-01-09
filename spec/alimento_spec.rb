require './lib/alimento'
require './lib/lista'
require './lib/plato'
require './lib/platoefi'
require './lib/platodsl'
require './lib/menudsl'

RSpec.describe Alimento do

	before (:all) do
		@prueba1 = Food.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0, 100.0)
		@prueba2 = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 100.0)
		@prueba3 = Food.new("Leche", 20.6, 0.0, 5.6, 5.7, 7.1, 100.0)
	end

	context "Probando las instancias de variables" do
		it "tiene nombre" do
			expect(@prueba1.name).to eq("Cerdo")
		end

		it "tiene cantidad de proteínas" do
			expect(@prueba1.proteins).to eq(21.5)
		end

		it "tiene cantidad de carbohidratos" do
			expect(@prueba1.carbohydrates).to eq(0.0)
		end

		it "tiene cantidad de lípidos" do
			expect(@prueba1.lipids).to eq(6.3)
		end

		it "tiene cantidad de gases de efecto invernadero" do
			expect(@prueba1.gei).to eq(0.76)
		end

		it "tiene cantidad de terreno utilizado" do
			expect(@prueba1.ground).to eq(1.11)
		end

		it "tiene cantidad en gramos" do
			expect(@prueba1.amount).to eq(100.0)
		end
	end

	context "Probando los getters" do
		
		it "tiene un método que devuelve el nombre" do
			expect(@prueba1.get_name).to eq("Cerdo")
		end

		it "tiene un método que devuelve las proteínas" do
			expect(@prueba1.get_proteins).to eq(21.5)
		end

		it "tiene un método que devuelve los carbohidratos" do
			expect(@prueba1.get_carbohydrates).to eq(0.0)
		end

		it "tiene un método que devuelve los lípidos" do
			expect(@prueba1.get_lipids).to eq(6.3)
		end

		it "tiene un método que devuelve los gases de efecto invernadero" do
			expect(@prueba1.get_gei).to eq(0.76)
		end

		it "tiene un método que devuelve la cantidad de terreno utilizado" do
			expect(@prueba1.get_ground).to eq(1.11)
		end

		it "tiene un método que devuelve el valor energético de un alimento" do
			expect(@prueba1.get_kcal).to eq(142.7)
		end

		it "tiene un método que devuelve la cantidad del alimento" do
			expect(@prueba1.get_amount).to eq(100.0)
		end

		it "tiene un método que devuelve la eficiencia energética " do
			expect(@prueba1.eficiencia_energetica).to eq(0.07)
			expect(@prueba2.eficiencia_energetica).to eq(0.09)

		end

	end

	context "Probando el to_s" do
		
		it "tiene un método que devuelve el alimento formateado" do
			expect(@prueba1.to_s).to eq("\n100.0g de Cerdo -> Proteínas 21.5g, Carbohidratos 0.0g, Lípidos 6.3g, Gases de efecto invernadero 0.76 kgCO2eq, Uso del terreno 1.11 m²")
		end
	end

	context "Probando el módulo compare" do
		it "comprueba que un alimento tiene una eficiencia energética menor que otro alimento" do
		 	expect(@prueba1 < @prueba2).to eq(true)
		end

		it "comprueba que un alimento tiene una eficiencia energética mayor que otro alimento" do
			expect(@prueba1 > @prueba2).to eq(false)
	   end

	   it "comprueba que un alimento tiene una eficiencia energética mayor o igual que otro alimento" do
			expect(@prueba1 <= @prueba2).to eq(true)
			expect(@prueba2 <= @prueba3).to eq(true)
		end

		it "comprueba que un alimento tiene una eficiencia energética menor o igual que otro alimento" do
			expect(@prueba2 >= @prueba1).to eq(true)
			expect(@prueba2 >= @prueba3).to eq(true)
		end
		
		it "comprueba si dos elementos tienen la misma eficiencia energética" do
			expect(@prueba2 == @prueba2).to eq(true)
   		end
		   
	end
end


RSpec.describe Lista do

	before (:all) do
		@pollo = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 100.0)
		@camarones = Food.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0, 100.0)
		@lentejas = Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 100.0)
		@nuez = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 100.0)
		@huevos = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 100.0)
		@leche = Food.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9, 100.0)
		@tofu = Food.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2, 100.0)

		@listaprueba1 = Lista.new()
		@listaprueba2 = Lista.new()
		@listaprueba3 = Lista.new()
		@listaprueba4 = Lista.new()
		@listaprueba5 = Lista.new()
		@listaprueba6 = Lista.new()
		@listaprueba7 = Lista.new()
		@listaprueba8 = Lista.new()
		@listaprueba9 = Lista.new()

		@arrayalimentos1 = [@pollo, @camarones]
		@arrayalimentos2 = [@lentejas, @nuez]
		@arrayalimentos3 = [@pollo, @lentejas, @nuez]
		@arrayalimentos4 = [@pollo, @lentejas, @nuez]
		@arrayalimentos5 = [@lentejas, @nuez, @huevos, @leche]
		@arrayalimentos6 = [@lentejas, @nuez, @nodotofu1]
		@arrayalimentos7 = [@pollo, @lentejas, @nuez]
	end

	context "Inicializando la lista" do
		
		it "tiene un head inicializado a nil" do
			expect(@listaprueba1.head).to eq(nil)
		end

		it "tiene un tail inicializado a nil" do
                        expect(@listaprueba1.tail).to eq(nil)
                end

		it "tiene tamaño inicializado a 0" do
                        expect(@listaprueba1.size).to eq(0)
                end


	end

	context "Inserción de nodos" do

		it "inserta un nodo en una lista vacía y comprueba que el nodo tiene next y prev" do
			expect(@listaprueba1.empty).to eq(true)
			@listaprueba1.insert_one(@pollo)
			expect(@listaprueba1.head["next"]).to eq(nil)
			expect(@listaprueba1.head["prev"]).to eq(nil)
			expect(@listaprueba1.tail["next"]).to eq(nil)
			expect(@listaprueba1.tail["prev"]).to eq(nil)
			expect(@listaprueba1.size).to eq(1)
		end

		it "inserta un nodo en una lista no vacía y comprueba que el nodo tiene next y prev" do
			expect(@listaprueba1.empty).to_not eq(true)
			@listaprueba1.insert_one(@camarones)
			expect(@listaprueba1.tail["value"]).to eq(@camarones)
			expect(@listaprueba1.size).to be >(0)
			expect(@listaprueba1.tail["next"]).to eq(nil)
			expect(@listaprueba1.tail["prev"]).to eq(@listaprueba1.head)
		end

		it "inserta varios nodos en una lista vacía" do
			expect(@listaprueba2.empty).to eq(true)
                        @listaprueba2.insert_many(@arrayalimentos1)
                        expect(@listaprueba2.head["value"]).to eq(@pollo)
                        expect(@listaprueba2.tail["value"]).to eq(@camarones)
                        expect(@listaprueba2.size).to eq(2)
		end

		it "inserta varios nodos en una lista no vacía" do
                    	expect(@listaprueba2.head["value"]).to eq(@pollo)
                        expect(@listaprueba2.tail["value"]).to eq(@camarones)
                        expect(@listaprueba2.size).to eq(2)
                        @listaprueba2.insert_many(@arrayalimentos2)
                        expect(@listaprueba2.head["value"]).to eq(@pollo)
                        expect(@listaprueba2.tail["value"]).to eq(@nuez)
                        expect(@listaprueba2.size).to eq(4)
                end

	end

	context "Extracción de nodos" do
		
		it "extrae un nodo por el comienzo" do
			expect(@listaprueba2.size).to eq(4)
			expect(@listaprueba2.head["value"]).to eq(@pollo)
			expect(@listaprueba2.extract_head).to eq(@pollo)
			expect(@listaprueba2.size).to eq(3)
			expect(@listaprueba2.head["value"]).to eq(@camarones)

		end

		it "extrae un nodo por el final" do
                        expect(@listaprueba2.size).to eq(3)
                        expect(@listaprueba2.tail["value"]).to eq(@nuez)
                        expect(@listaprueba2.extract_tail).to eq(@nuez)
                        expect(@listaprueba2.size).to eq(2)
                        expect(@listaprueba2.tail["value"]).to eq(@lentejas)

                end

		it "tiene un método que devuelve un mensaje que indica que la lista está vacía y no se pueden extraer más nodos" do
			expect(@listaprueba3.extract_head).to eq("La lista está vacía y, por tanto, no es posible extraer más nodos")
			expect(@listaprueba3.extract_tail).to eq("La lista está vacía y, por tanto, no es posible extraer más nodos")
		end

	end

	context "Probando los getters de eficiencia energética" do
		it "tiene un método que devuelve la eficiencia energética diaria de la lista" do
			expect(@listaprueba1.get_eficiencia_diaria).to eq(0.11)
		end

		it "tiene un método que devuelve la eficiencia energética anual de la lista" do
			expect(@listaprueba1.get_eficiencia_anual).to eq(40.15)
		end
	end

	context "Probando el módulo enumerable" do
		it "devuelve el alimento que tiene la mayor eficiencia energética" do
			@listaprueba1.insert_many(@arrayalimentos2)
			expect(@listaprueba1.size).to eq(4)
			expect(@listaprueba1.max).to eq(@nuez)
		end

		it "devuelve el alimento que tiene la menor eficiencia energética" do
			expect(@listaprueba1.min).to eq(@camarones)
		end

		it "realiza la función sort" do
			expect(@listaprueba1.sort).to eq([@camarones, @pollo, @lentejas, @nuez])
		end

		it "realiza la función select" do
			expect(@listaprueba1.select{|alimento| alimento.carbohydrates >= 21.0}).to eq([@lentejas, @nuez])
		end

		it "realiza la función collect" do
			expect(@listaprueba1.collect{|alimento| alimento.carbohydrates <= 21.0}).to eq([true, true, false, true])
		end
	end

end

RSpec.describe Plato do

	before (:all) do
		@lentejas = Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 100.0)
		@huevos = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 100.0)
		@arroz = Food.new("Arroz", 20.0, 21.0, 54.0, 0.3, 7.9, 100.0)
		@arrayalimentos = [@lentejas, @huevos, @arroz]
		@plato1 = Plato.new(@arrayalimentos, "Lentejas compuestas")

		@polloesp = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 150.0)
		@lentejasesp =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezesp = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@arrayesp = [@polloesp, @lentejasesp, @nuezesp]
		@platoesp = Plato.new(@arrayesp, "Pollo a la lenteja")

		@pollovasca = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 112.5)
		@lentejasvasca =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 450.0)
		@nuezvasca = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 83.33)
		@arrayvasca = [@pollovasca, @lentejasvasca, @nuezvasca]
		@platovasca = Plato.new(@arrayvasca, "Lentejas a la nuez")

		@lentejasveg =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezveg = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@huevosveg = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 22.5)
		@lecheveg = Food.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9, 127.5)
		@arrayveg = [@lentejasveg, @nuezveg, @huevosveg, @lecheveg]
		@platoveg = Plato.new(@arrayveg, "Huevos a la leche moscada")

		@lentejasvegeta =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezvegeta = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@tofuvegeta = Food.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2, 150.0)
		@arrayvegeta = [@lentejasvegeta, @nuezvegeta, @tofuvegeta]
		@platovegeta = Plato.new(@arrayvegeta, "Lentejas a la nuez")

		@pollolocura = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 375.0)
		@lentejaslocura =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 225.0)
		@nuezlocura = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 66.67)
		@arraylocura = [@pollolocura, @lentejaslocura, @nuezlocura]
		@platolocura = Plato.new(@arraylocura, "Mucha carne")
	end

	context "Creando la clase Plato" do
		it "inicializa la clase con un objeto lista" do
			expect(@plato1.nombre).to eq("Lentejas compuestas")
			expect(@plato1.contenido.class).to eq(Lista)
			expect(@plato1.contenido.size).to eq(3)
		end
	end

	context "Probando los getters" do
		it "tiene un nombre" do
			expect(@plato1.nombre).to eq("Lentejas compuestas")
		end

		it "tiene un conjunto de alimentos" do
		  	expect(@plato1.contenido.collect{|alimento| alimento}).to eq([@lentejas, @huevos, @arroz])
	    end

		it "devuelve un conjunto con la cantidad de alimentos en g" do 
		 	expect(@plato1.contenido.collect{|alimento| alimento.amount}).to eq([100.0, 100.0, 100.0])
		end

		it "devuelve el porcentaje de proteínas presentes en el plato" do
			expect(@plato1.get_proteinas).to eq(18.84)
		end

		it "devuelve el porcentaje de carbohidratos presentes en el plato" do
			expect(@plato1.get_carbohidratos).to eq(24.71)
		end

		it "devuelve el porcentaje de lípidos presentes en el plato" do
			expect(@plato1.get_lipidos).to eq(22.14)
		end
		it "devuelve el valor calórico total del plato" do
			expect(@plato1.vct).to eq(1120.05)
		end

	end

	context "Probando el to_s" do
	 	it "Devuelve el plato formateado" do 
	 		expect(@plato1.to_s).to eq("Lentejas compuestas: Lentejas 100.0g Huevos 100.0g Arroz 100.0g .")
	 	end
	 end

	 context "Probando el módulo comparable" do
		it "Devuelve el plato que tiene menor valor calórico total de entre dos dietas" do
			expect(@platoesp < @platovasca).to eq(true)
		end

		it "Devuelve el plato que tiene mayor valor calórico total que otro de entre dos dietas" do
			expect(@platoveg > @platovegeta).to eq(false)
		end

		it "Devuelve el plato que tiene menor o igual valor calórico total que otro de entre dos dietas" do
			expect(@platolocura <= @platolocura).to eq(true)
			expect(@platolocura <= @platovegeta).to eq(true)
		end

		it "Devuelve el plato que tiene mayor o igual valor calórico total que otro de entre dos dietas" do
			expect(@platolocura >= @platolocura).to eq(true)
			expect(@platolocura >= @platoveg).to eq(false)
		end

		it "comprueba si dos platos tienen el mismo valor calórico total" do
			expect(@platolocura == @platolocura).to eq(true)
		end
	end
end

RSpec.describe Platoefi do
	before (:all) do
		@cerdo = Food.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0, 100.0)
		@lentejas = Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 100.0)
		@huevos = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 100.0)
		@arroz = Food.new("Arroz", 20.0, 21.0, 54.0, 0.3, 7.9, 100.0)
		@carnevaca = Food.new("Carne Vaca", 21.1, 0.0, 3.1, 50.0, 164.0, 100.0)
		@salmon = Food.new("Salmón", 19.9, 0.0, 13.6, 6.0, 3.7, 100.0)
		@chocolate = Food.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4, 100.0)
		@cafe = Food.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3, 100.0)
		@camarones = Food.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0, 100.0)
		@leche = Food.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9, 100.0)

		@arrayalimentos = [@lentejas, @huevos, @arroz]
		@plato2 = Platoefi.new(@arrayalimentos, "Lentejas compuestas")

		@polloesp = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 150.0)
		@lentejasesp =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezesp = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@arrayesp = [@polloesp, @lentejasesp, @nuezesp]
		@platoesp = Platoefi.new(@arrayesp, "Pollo a la lenteja")

		@pollovasca = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 112.5)
		@lentejasvasca =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 450.0)
		@nuezvasca = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 83.33)
		@arrayvasca = [@pollovasca, @lentejasvasca, @nuezvasca]
		@platovasca = Platoefi.new(@arrayvasca, "Lentejas a la nuez")

		@lentejasveg =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezveg = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@huevosveg = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 22.5)
		@lecheveg = Food.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9, 127.5)
		@arrayveg = [@lentejasveg, @nuezveg, @huevosveg, @lecheveg]
		@platoveg = Platoefi.new(@arrayveg, "Huevos a la leche moscada")

		@lentejasvegeta =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		@nuezvegeta = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		@tofuvegeta = Food.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2, 150.0)
		@arrayvegeta = [@lentejasvegeta, @nuezvegeta, @tofuvegeta]
		@platovegeta = Platoefi.new(@arrayvegeta, "Lentejas a la nuez")

		@pollolocura = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 375.0)
		@lentejaslocura =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 225.0)
		@nuezlocura = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 66.67)
		@arraylocura = [@pollolocura, @lentejaslocura, @nuezlocura]
		@platolocura = Platoefi.new(@arraylocura, "Mucha carne")

		@arrayprincipal = [@carnevaca, @tofuvegeta, @lentejas]
		@platoprincipal = Platoefi.new(@arrayprincipal, "Carne al tofu")

		@arraysegundo = [@salmon, @huevos, @arroz]
		@platosegundo = Platoefi.new(@arraysegundo, "Salmón al pil pil")

		@arraypostre = [@chocolate]
		@platopostre = Platoefi.new(@arraypostre, "Café de chocolate")

		@menu = [@platoprincipal, @platosegundo, @platopostre]
		@precios = [10.25, 15.00, 7.40]

		

	end

	context "Probando los getters" do
		it "devuelve el valor total de las emisiones diarias de efecto invernadero" do
			expect(@plato2.gei).to eq(0.49)
		end

		it "devuelve la estimación del uso del terreno" do
			expect(@plato2.usoterreno).to eq(1.7)
		end

		it "devuelve la eficiencia energética del plato" do
			expect(@plato2.eficiencia).to eq(10.37)
		end
	end

	context "comprobando tipos y clases" do
		it "devuelve la clase de un objeto" do 
			expect(@plato2.contenido.head.is_a?Node).to eq(true)
			expect(@plato2.contenido.head["value"].instance_of?Food).to eq(true)
			expect(@plato2.class).to eq(Platoefi)
		end

		it "devuelve el tipo de un objeto" do 
			expect(@plato2.contenido).to respond_to("insert_one")
			expect(@plato2.contenido.head["value"]).to respond_to("get_eficiencia_energetica")
			expect(@plato2).to respond_to("get_gei")
		end

		it "devuelve la pertenencia a una jerarquía" do 
			#expect(Platoefi.ancestors).to eq([Platoefi, Plato, Comparable, Object,Kernel, BasicObject])
			expect(Plato.ancestors).to eq([Plato, Comparable, Object, Kernel, BasicObject])
			expect(Lista.ancestors).to eq([Lista, Enumerable, Object, Kernel, BasicObject])
			expect(Food.ancestors).to eq([Food, Comparable, Object, Kernel, BasicObject])
		end
	end

	context "Probando el módulo comparable" do
		it "Devuelve el plato que tiene menor eficiencia energética de entre dos dietas" do
			expect(@platoesp < @platovasca).to eq(false)
		end

		it "Devuelve el plato que tiene mayor eficiencia energética que otro de entre dos dietas" do
			expect(@platoveg > @platovegeta).to eq(false)
		end

		it "Devuelve el plato que tiene menor o igual eficiencia energética que otro de entre dos dietas" do
			expect(@platolocura <= @platolocura).to eq(true)
			expect(@platolocura <= @platovegeta).to eq(true)
		end

		it "Devuelve el plato que tiene mayor o igual eficiencia energética que otro de entre dos dietas" do
			expect(@platolocura >= @platolocura).to eq(true)
			expect(@platolocura >= @platoveg).to eq(true)
		end

		it "compara si dos platos tienen la misma eficiencia energética" do
			expect(@platolocura == @platolocura).to eq(true)
		end
	end

	context "Probando el módulo enumerable" do
		it "devuelve el alimento del plato de la dieta española que tiene la máxima eficiencia energética" do
			expect(@platoesp.contenido.max).to eq(@nuezesp)
		end

		it "devuelve el alimento del plato de la dieta vasca que tiene la mínima eficiencia energética" do
			expect(@platovasca.contenido.min).to eq(@pollovasca)
		end

		it "ordena los alimentos del plato de la dieta vegetaria de menor a mayor eficiencia energética" do
			expect(@platoveg.contenido.sort).to eq([@lecheveg, @huevosveg, @lentejasveg, @nuezveg])
		end

		it "selecciona los alimentos que tienen una cantidad de proteínas filtrada" do
			expect(@platovegeta.contenido.select{|alimento| alimento.proteins <= 27.0}).to eq([@nuezvegeta, @tofuvegeta])
		end

		it "selecciona los alimentos que tienen una cantidad de proteínas filtrada" do
			expect(@platolocura.contenido.collect{|alimento| alimento.proteins <= 15.0}).to eq([false, false, true])
		end
	end

	context "Programación funcional" do
		it "Calcula la huella nutricional de un plato" do
			expect(@platolocura.huella_nutricional).to eq(2.0)
		end

		it "Devuelve el plato con mayor huella nutricional de un menu" do
			expect(@menu.max).to eq(@platosegundo)
		end

		it "Devuelve el array de los precios con el incremento según el plato que tiene mayor huella" do
			expect((@menu.map{|plato| plato.huella_nutricional/@menu.max.huella_nutricional}).map.with_index{|factor, i| ((factor+1) * @precios.at(i)).ceil(2)}).to eq([15.38, 30.0, 11.11])
		end
	end

end


RSpec.describe Platodsl do

	before(:each) do

		pollo = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 150.0)
		lentejas =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		nuez = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)

		@plato1 = Platodsl.new("Pollo a la lenteja") do
			alimento pollo
			alimento lentejas
			alimento nuez
		end
	end

	context "Pruebas para un platoDSL" do

		it "Devuelve la información formateada de un plato" do
			expect(@plato1.to_s).to eq("\n\nPollo a la lenteja\n==================\n\nAlimentos: \n\n150.0g de Pollo -> Proteínas 30.9g, Carbohidratos 0.0g, Lípidos 8.4g, Gases de efecto invernadero 0.86 kgCO2eq, Uso del terreno 1.07 m², \n300.0g de Lentejas -> Proteínas 70.5g, Carbohidratos 156.0g, Lípidos 4.2g, Gases de efecto invernadero 0.12 kgCO2eq, Uso del terreno 1.02 m², \n133.33g de Nuez -> Proteínas 26.67g, Carbohidratos 28.0g, Lípidos 72.0g, Gases de efecto invernadero 0.04 kgCO2eq, Uso del terreno 1.06 m²\n\n")
		end
	end
end

RSpec.describe Menudsl do

	before(:all) do
		pollo = Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1, 150.0)
		lentejas =  Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4, 300.0)
		nuez = Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 133.33)
		huevos = Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7, 100.0)
		arroz = Food.new("Arroz", 20.0, 21.0, 54.0, 0.3, 7.9, 100.0)
		carnevaca = Food.new("Carne Vaca", 21.1, 0.0, 3.1, 50.0, 164.0, 100.0)
		salmon = Food.new("Salmón", 19.9, 0.0, 13.6, 6.0, 3.7, 100.0)
		chocolate = Food.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4, 100.0)
		cafe = Food.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3, 100.0)
		camarones = Food.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0, 100.0)
		leche = Food.new("Leche", 3.3, 4.8, 3.2, 3.2, 8.9, 100.0)

		plato1 = Platodsl.new("Sopa de pescado") do
			alimento salmon
			alimento camarones
			alimento leche
		end

		plato2 = Platodsl.new("Pollo a la lenteja") do
			alimento pollo
			alimento lentejas
			alimento nuez
		end

		plato3 = Platodsl.new("Tiramisú con canela") do
			alimento chocolate
			alimento leche
		end
		precio1 = 7.80
		precio2 = 10.50
		precio3 = 4.95

		@menu1 = Menudsl.new("Combo1") do
			descripcion "Sopa, pollo, tiramisú"
			plato plato1
			plato plato2
			plato plato3
			precio precio1
			precio precio2
			precio precio3
		end
	end

	context "Pruebas para un menuDSL" do

		it "Devuelve la descripción del menu" do
			expect(@menu1.desc).to eq("Sopa, pollo, tiramisú")
		end

		it "Devuelve la información formateada de un menu" do
			expect(@menu1.to_s).to eq("\n\nCombo1\n======\n\nSopa, pollo, tiramisú\n\nPlatos: \n\n\nSopa de pescado\n===============\n\nAlimentos: \n\n100.0g de Salmón -> Proteínas 19.9g, Carbohidratos 0.0g, Lípidos 13.6g, Gases de efecto invernadero 0.6 kgCO2eq, Uso del terreno 0.37 m², \n100.0g de Camarones -> Proteínas 17.61g, Carbohidratos 1.5g, Lípidos 0.6g, Gases de efecto invernadero 1.8 kgCO2eq, Uso del terreno 0.2 m², \n100.0g de Leche -> Proteínas 3.3g, Carbohidratos 4.8g, Lípidos 3.2g, Gases de efecto invernadero 0.32 kgCO2eq, Uso del terreno 0.89 m²\n\nPrecio: 7.8 €\n\n\n\nPollo a la lenteja\n==================\n\nAlimentos: \n\n150.0g de Pollo -> Proteínas 30.9g, Carbohidratos 0.0g, Lípidos 8.4g, Gases de efecto invernadero 0.86 kgCO2eq, Uso del terreno 1.07 m², \n300.0g de Lentejas -> Proteínas 70.5g, Carbohidratos 156.0g, Lípidos 4.2g, Gases de efecto invernadero 0.12 kgCO2eq, Uso del terreno 1.02 m², \n133.33g de Nuez -> Proteínas 26.67g, Carbohidratos 28.0g, Lípidos 72.0g, Gases de efecto invernadero 0.04 kgCO2eq, Uso del terreno 1.06 m²\n\nPrecio: 10.5 €\n\n\n\nTiramisú con canela\n===================\n\nAlimentos: \n\n100.0g de Chocolate -> Proteínas 5.3g, Carbohidratos 47.0g, Lípidos 30.0g, Gases de efecto invernadero 0.23 kgCO2eq, Uso del terreno 0.34 m², \n100.0g de Leche -> Proteínas 3.3g, Carbohidratos 4.8g, Lípidos 3.2g, Gases de efecto invernadero 0.32 kgCO2eq, Uso del terreno 0.89 m²\n\nPrecio: 4.95 €\n\n")
		end

		it "Devuelve los precios de los platos" do
			expect(@menu1.precios).to eq([7.8, 10.5, 4.95])
		end
	end

end

# Combo1
# ======

# Sopa, pollo, tiramisú

# Platos: 


# Sopa de pescado
# ===============

# Alimentos: 

# 100.0g de Salmón -> Proteínas 19.9g, Carbohidratos 0.0g, Lípidos 13.6g, Gases de efecto invernadero 0.6 kgCO2eq, Uso del terreno 0.37 m², 
# 100.0g de Camarones -> Proteínas 17.61g, Carbohidratos 1.5g, Lípidos 0.6g, Gases de efecto invernadero 1.8 kgCO2eq, Uso del terreno 0.2 m², 
# 100.0g de Leche -> Proteínas 3.3g, Carbohidratos 4.8g, Lípidos 3.2g, Gases de efecto invernadero 0.32 kgCO2eq, Uso del terreno 0.89 m²

# Precio: 7.8 €



# Pollo a la lenteja
# ==================

# Alimentos: 

# 150.0g de Pollo -> Proteínas 30.9g, Carbohidratos 0.0g, Lípidos 8.4g, Gases de efecto invernadero 0.86 kgCO2eq, Uso del terreno 1.07 m², 
# 300.0g de Lentejas -> Proteínas 70.5g, Carbohidratos 156.0g, Lípidos 4.2g, Gases de efecto invernadero 0.12 kgCO2eq, Uso del terreno 1.02 m², 
# 133.33g de Nuez -> Proteínas 26.67g, Carbohidratos 28.0g, Lípidos 72.0g, Gases de efecto invernadero 0.04 kgCO2eq, Uso del terreno 1.06 m²

# Precio: 10.5 €



# Tiramisú con canela
# ===================

# Alimentos: 

# 100.0g de Chocolate -> Proteínas 5.3g, Carbohidratos 47.0g, Lípidos 30.0g, Gases de efecto invernadero 0.23 kgCO2eq, Uso del terreno 0.34 m², 
# 100.0g de Leche -> Proteínas 3.3g, Carbohidratos 4.8g, Lípidos 3.2g, Gases de efecto invernadero 0.32 kgCO2eq, Uso del terreno 0.89 m²

# Precio: 4.95 €