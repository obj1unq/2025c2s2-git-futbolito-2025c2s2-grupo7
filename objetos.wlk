/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	const objetivo = pelota
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method taquito() {
		self.validarTaquito()
		objetivo.patearAtras()
	}
	method validarTaquito() {
		if( not (position == objetivo.position()))  {
			 self.error ("No esta en la misma posicion que la objetivo")
	  	}
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
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

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
