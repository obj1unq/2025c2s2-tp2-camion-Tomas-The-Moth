import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)

	}

	method validarCarga(unaCosa){
		if (cosas.contains(unaCosa)){
			self.error("la cosa ya está cargada") 
		}
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method validarDescarga(unaCosa){
		if (!cosas.contains(unaCosa)){
			self.error("la cosa no está cargada") 
		}
	}

	method todosPar() {
	  return cosas.all({cosas => (cosas.peso()) % 2 == 0})
	  }

	  method hayAlgunoQuePesa(kilogramos){
       return cosas.any({cosas => cosas.peso() == kilogramos})
	  }
      method algunoQuePesa(kilogramos){
       return cosas.find({cosas => cosas.peso() == kilogramos})
	  }

	  method pesoTotal() {
		return cosas.sum({cosas => cosas.peso()}) + 1000
	  }

      method excesoDePeso() {
	   return self.pesoTotal() > 2500}


	   method validarDeNivel(peligrosidad){
       if (!cosas.any({cosas => cosas.nivelPeligrosidad() == peligrosidad})) {
		self.error("no hay ninguna cosa con ese nivel de peligrosidad")
	   }
	   }

	 method esDeNivel(peligrosidad){
		self.validarDeNivel(peligrosidad)
		return cosas.find({cosas => cosas.nivelPeligrosidad() == peligrosidad})
	   }

	   method deMayorNivel(peligrosidad){
           return cosas.filter({cosas => cosas.nivelPeligrosidad() > peligrosidad})
	  }

	  method masNivelQue(unaCosa){
		return self.deMayorNivel(unaCosa.nivelPeligrosidad())
	  }

	  method puedeCircular(peligrosidadIndicada){
		return !self.excesoDePeso() and self.deMayorNivel(peligrosidadIndicada).isEmpty()
	  }

	method cosaQuePesaEntre(min, max) {
    return cosas.filter({cosa => cosa.peso() > min && cosa.peso() < max})
}
	method cosaQueMasPesa(){
	 
    var maxPeso = cosas.map({cosa => cosa.peso()}).max()
    
    return cosas.find({cosa => cosa.peso() == maxPeso})
            }
	

method pesos(){
	return cosas.map({cosa => cosa.peso()})
}
	method bultosTotales(){
		cosas.sum({cosa=> cosa.bultos()})
	}
}




