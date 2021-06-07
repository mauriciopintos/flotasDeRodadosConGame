import rodados.*
import pedidos.*

class Dependencia {
	const property nombre
	var property empleados
	const flota = []
	const property pedidos = #{}
	
	method agregarAFlota(unRodado) { flota.add(unRodado) }
	method pesoTotalFlota() = flota.sum{ r => r.peso() }
	method estaBienEquipada() = flota.size() >= 3 and flota.all{ r => r.velocidadMax() >= 100 }
	method capacidadTotalEnColor(unColor) = flota.filter( { r => r.color() == unColor } ).sum( { r => r.capacidad() } )
	method colorDelRodadoMasRapido() = flota.max( { r => r.velocidadMax() } ).color()
	method capacidadFaltante() = empleados - self.capacidadFlota()
	method capacidadFlota() = flota.sum( { r => r.capacidad() } )
	method esGrande() = empleados >= 40 and flota.size() >= 5
	
	method agregar(unPedido) { pedidos.add(unPedido) }
	method quitar(unPedido) { pedidos.remove(unPedido) }
	method totalPasajeros() = pedidos.sum( { p => p.pasajeros() } )
	method noSePuedeSatisfacer() = pedidos.filter( { p => self.noSatisface(p) } )
	method noSatisface(pedido) = flota.all( { rodado => not pedido.satisfacePedido(rodado) } )
	
	method incompatibleConTodos(unColor) = pedidos.all( { p => self.incompatibleCon(p,unColor) } )
	method incompatibleCon(pedido,color) = pedido.coloresIncompatibles().any( { c => c == color } )
	
	method relajaTodos() { pedidos.forEach( { p => p.relajar() } ) }
}