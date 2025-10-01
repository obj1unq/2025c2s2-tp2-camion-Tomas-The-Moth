import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() {return 1}
	method sufrirAccidente() {}
}



object arenaDeGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }
	method bultos() {return 1}
	method sufrirAccidente(){ 
	peso = peso + 20
	}
}

object bumblebee {
var property modo = modoAuto
method peso() { return 800}

method nivelPeligrosidad() { return modo.nivelPeligrosidad() }

method bultos() {return 2}

method modo(nuevoModo){
	modo = nuevoModo
}

method sufrirAccidente(){
  
 modo = modo.modoAlAccidentarse()
}

}

object modoAuto {
	method nivelPeligrosidad() {return 15 }
	  method modoAlAccidentarse() {return modoRobot}
}

object modoRobot {
	method nivelPeligrosidad() {return 30}
	method modoAlAccidentarse() {return modoAuto}
}


object paqueteDeLadrillos {
	var property ladrillos = 101
	method peso() { return ladrillos * 2 }
	method nivelPeligrosidad() { return 2 }

   method bultos() {
    return if (ladrillos <= 100) {
		1
	} else if (ladrillos <= 300) {
		2
	} else {
		3
}
   }

method sufrirAccidente(){
	ladrillos = (ladrillos - 12).max(0)
}

   }


object residuosRadiactivos {
	var property peso = 0
	method nivelPeligrosidad() {return 200}
   method bultos() {return 1}
   method sufrirAccidente() {peso = peso + 15}
}

object bateriaAntiAerea {
  var property haymisiles = false
  method haymisiles(valor) {
	haymisiles = valor
  }

  method peso() { 
	if (haymisiles) {
		return 300
	} else {
		return 200
	}
  }
  
   method nivelPeligrosidad() {
	  if (haymisiles){
		return 100
	  }
	  else {return 0}
	 }

	 method bultos(){
		if (haymisiles){
			return 2
		}
		else {
			return 1
		}
	 }

	 method sufrirAccidente(){
		self.haymisiles(false)
	 }
}

object contenedorPortuario{
	const cosas = #{}

	method peso(){
	return cosas.sum({cosa => cosa.peso()}) + 100
	}
    method cargar(unaCosa) {
		cosas.add(unaCosa)

	}
    method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		else{
	return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
}
	}

	method bultos(){
		return cosas.sum ({cosa => cosa.bultos()}) + 1
	}
}
object embalajeDeSeguridad {
	var contenido = null
	method embalar(unacosa){
		contenido = unacosa
	}
	method peso() { return contenido.peso()  }
	method nivelPeligrosidad() { return contenido.nivelPeligrosidad()/2 }
	method bultos() {return 2}
	method sufrirAccidente(){
		contenido.sufrirAccidente()
	}
}

object almacen {
	const property cosas = #{}

	method guardar(unaCosa) {
		cosas.add(unaCosa)
	}
	method llegar(vehiculo){
		vehiculo.cosas().forEach({cosa => self.guardar(cosa)})
		vehiculo.cosas().clear()
	}

  
}

object ruta9{
	method soportaElviaje(){
		return camion.puedeCircular(20)
	}
}

object caminosVecinales{
	var pesoMaximo = 1000
   
   method pesoMaximo(kilos){
	   pesoMaximo = kilos
   }
   method soportaElviaje(){
	   return camion.pesoTotal() <= pesoMaximo
   }
}