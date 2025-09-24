/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property camiseta = "lionel-titular.png"
	
	method image() {
		return camiseta
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method cambiarCamiseta() { 
		self.validarCambioCamiseta()
		if (camiseta =="lionel-titular.png"){
			camiseta = "lionel-suplente.png"
		}else{
			camiseta = "lionel-titular.png"
		}
	}

	method validarCambioCamiseta(){
		if (!self.puedeCambiarCamiseta()) {self.error("Error")}
	}
	
	method puedeCambiarCamiseta(){
		return position.x() == 0
	} 
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

