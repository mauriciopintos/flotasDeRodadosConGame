class Pedido {
	var property distancia
	var property tiempo
	var property pasajeros
	const property coloresIncompatibles = #{}
	
	method velocidadRequerida() = distancia/tiempo
	method satisfacePedido(unAuto) = self.velocidadApropiada(unAuto) and self.colorApropiado(unAuto) and self.pasajerosApropiados(unAuto)
	method velocidadApropiada(unAuto) = unAuto.velocidadMax() >= 10 + self.velocidadRequerida()
	method colorApropiado(unAuto) = not coloresIncompatibles.any{ c => c == unAuto.color() }
	method pasajerosApropiados(unAuto) = unAuto.capacidad() >= pasajeros
	method acelerar() { tiempo -= 1 }
	method relajar() { tiempo += 1 }
}