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
	method sufrirAccidente(){ self.peso(70)}
}

object bumblebee {
var  modo = modoAuto
method peso() { return 800}

method nivelPeligrosidad() { return modo.nivelPeligrosidad() }

method bultos() {return 2}

method modo(nuevoModo){
	modo = nuevoModo
}

method sufrirAccidente(){
	if (modo == modoAuto) {
		modo = modoRobot
	}
	else {
		modo = modoAuto
	}
}

}

object modoAuto {
	method nivelPeligrosidad() {return 15 }
}

object modoRobot {
	method nivelPeligrosidad() {return 30}
}


object paqueteDeLadrillos {
	var ladrillos = 101
	method peso() { return ladrillos * 2 }
	method nivelPeligrosidad() { return 2 }

    method ladrillos(cantidad){
		ladrillos = cantidad
}
   method bultos() {
    return (ladrillos/100).roundUp(0).min(3)
        
}
method sufrirAccidente(){
	ladrillos = ladrillos - 12
}

   }


object residuosRadiactivos {
	var property peso = 0
	method nivelPeligrosidad() {return 200}
   method bultos() {return 1}
   method sufrirAccidente() {self.peso(45)}
}

object bateriaAntiAerea {
  var haymisiles = false
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
			return 1
		}
		else {
			return 2
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

    method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		else{
	return cosas.max({cosa => cosa.nivelPeligrosidad()})
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
}