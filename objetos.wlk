/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	var image = "lionel-titular.png"
	const objetivo = pelota
	
	method image() {
		return image
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear(){
		self.validarPosicionDeObjetivo()
		objetivo.moverPelotaAlPatear()
	}

	method taquito() {
		self.validarPosicionDeObjetivo()
		objetivo.patearAtras()
	}
	
	method levantarla(){
		self.validarPosicionDeObjetivo()
		objetivo.levantarseYBajar()
	}

	method validarPosicionDeObjetivo(){
		if (not self.tieneElObjetivo()){
			self.error("Lionel no está en la misma posición que la objetivo.")
		}
	}

	method buscarla(){
		position = objetivo.position()
	}

	method tieneElObjetivo(){
		return position == objetivo.position()
	}

	method cambiarCamiseta() { 
		self.validarCambioCamiseta()
		if (image == "lionel-titular.png"){
			image = "lionel-suplente.png"
		}else{
			image = "lionel-titular.png"
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

	method moverPelotaAlPatear(){
		
		position = game.at(((position.x()+3).min(game.width()-1)),position.y())
	}

	method levantarseYBajar(){
		self.levantarse()
		self.bajar()
	}

	method levantarse(){
		position = position.up(1)
	}

	method bajar(){
		game.schedule(2000, {=> position = position.down(1)})
	}

	method patearAtras() {
		position = game.at( (position.x() - 2).max(0), position.y()   )

	}
}

