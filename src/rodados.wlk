import colores.*

class ChevroletCorsa {
	var property color  // colores definidos como objeto
	var property position
	const posiciones = #{self.position()}
	var property juego
	
	method image() = color.imagen()
	method peso() = 1300
	method capacidad() = 4
	method velocidadMax() = 150
	method pasoPor(posicion) = posiciones.any( { p => p == posicion } )
	method pasoPorFila(numero) = posiciones.any( { p => p.x() == numero } )
	method recorrioFilas(lista_de_numeros) = lista_de_numeros.all( { f => self.pasoPorFila(f) } )
	
	//ACCONES EN EL JUEGO
		//MOVIMIENTOS
	method irIzquierda(){
		if (self.position().x() > 0) {
			self.position(self.position().left(1))
		} 
	}
	
	method irDerecha(){
		if (self.position().x() < juego.width()-1) {
			self.position(self.position().right(1))
		} 
	}

	method subir(){
		if (self.position().y() < juego.height()-1) {
			self.position(self.position().up(1))
		} 
	}

	method bajar(){
		if (self.position().y() > 0) {
			self.position(self.position().down(1))
		} 
	}
}

class RenaultKwid {
	var property tanqueAdicional //booleano
	const property color = azul	// colores definidos como objeto

	method capacidad() = if (tanqueAdicional) 3 else 4
	method velocidadMax() = if (tanqueAdicional) 120 else 110
	method peso() = if (tanqueAdicional) 1350 else 1200
}

class AutoEspecial{
	const property capacidad
	const property velocidadMax
	const property peso
	const property color	// colores definidos como objeto
}

object trafic {
	var property interior 	// interiores definidos como objeto
	var property motor	// motores definidos como objeto
	const property color=blanco	// colores definidos como objeto

	method capacidad() = interior.capacidad()
	method velocidadMax() = motor.velocidadMax()
	method peso() = interior.peso() + motor.peso() + 4000	
}

// interiores de trafic
object comodo {
	method capacidad() = 5
	method peso() = 700
}
object popular {
	method capacidad() = 12
	method peso() = 1000
}

// motores de trafic
object pulenta {
	method peso() = 800
	method velocidadMax() = 130 
}
object bataton {
	method peso() = 500
	method velocidadMax() = 80
}