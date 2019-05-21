import wollok.game.*

class Vaca {
	var property position = game.at(3,5)
	const property image = "vaca.gif"

	var property peso = 150
	var property tieneSed = false
		
	method comer(kilos){
		if(not self.tieneHambre()){
			self.error("No tengo hambre")
		}
		peso += kilos/2
		tieneSed = true
	}
	method beber(){
		tieneSed = false
		peso = (peso - 1).max(0)
	}
	method tieneHambre(){return peso < 200}
	method movimiento(){
		if (peso == 50){
			self.error("Tengo hambre")
		}
		peso = 50.max(peso * 0.95)
	}
}
	
class Gallina {
	var property position = game.at(3,5)
	const property image = "gallina.gif"
	
	var property peso = 4
	var property tieneSed = false
	
	var property vecesComio = 0
	
	
	method comer(kilos){
		vecesComio += 1
		tieneSed = vecesComio == 2 or vecesComio == 5
	}
	method beber(){}
	method tieneHambre(){return vecesComio%2 == 0}
	method movimiento(){}

}

class ComederoNormal{
	var property position = game.at(8,10)
	const property image = "comedero.gif"
	var property cantidadRaciones 
	const property racion
	const property pesoSoportado
	
	method darComida(animal){
		if (animal.peso() > pesoSoportado){
			self.error("Es muy pesado")
		}
			animal.comer(racion)
			cantidadRaciones -= 1		 
	}
	method necesitaRecargar(){return cantidadRaciones < 10}
	method recargarRaciones(){
		if(self.necesitaRecargar()){
			cantidadRaciones += 30
		}
	}
	
}


