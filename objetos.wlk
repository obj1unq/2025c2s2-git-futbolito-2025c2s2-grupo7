/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method irHastaPelota(){
		position = pelota.position()
	}

	method patear(){
		self.validarPatear(pelota)
		pelota.moverPelotaAlPatear()
	}
	
	method validarPatear(pelota){
		if(not self.puedePatear(pelota)){
			self.error("No puede patear,no esta en la misma posición de" + pelota)
		}
	}

	method puedePatear(pelota){
		return position == pelota.position()
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method moverPelotaAlPatear(){
		
		position = game.at(((position.x()+3).min(game.width()-1)),position.y())
	}

//pelota + 3 -(ancho tablero -1)
}
