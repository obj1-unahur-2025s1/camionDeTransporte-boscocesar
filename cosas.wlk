object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1 // parte 2
    method consecuenciaCarga() {} //parte 2
}

object bumblebee {
    method peso() = 800
    var estaRobot = true
    method bultos() = 2  // parte 2
    method consecuenciaCarga(){
        self.hacerseRobot() 
    }//parte 2
    method hacerseAuto() {
      estaRobot = false
    }
    method hacerseRobot() {
      estaRobot = true
    }
    method peligrosidad() = if(estaRobot) 30 else 15
}

object ladrillos {
    method peso() = cantidad * 2
    method peligrosidad() = 2
    method consecuenciaCarga() {
        self.agregarLadrillos(12) //parte 2
    }
    var cantidad = 0
    method bultos() =
        if(cantidad <= 100) 1 
        else if (cantidad.between(101, 300)) 2
        else 3 // parte 2
    method agregarLadrillos(cantidadLadrillos) {
        cantidad = cantidad + cantidadLadrillos
    }
    method cantidad() = cantidad
}
object arenaGranel {
    var property peso = 0
    method peligrosidad() = 1
    method bultos() = 1 // parte 2
    method consecuenciaCarga() {
        peso = 0.max(peso -10) //parte 2 NO ENTENDI PREGUNTAR
    }
}
object bateriaAntiaerea{
    var tieneMisiles = true
    method peso() = if (tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method bultos() = if(tieneMisiles) 2 else 1 //parte 2
    method consecuenciaCarga() {
        self.cargarMisiles() //parte 2
    }
    method cargarMisiles() {tieneMisiles = true}
    method descargarMisiles(){tieneMisiles = false}
    method tieneMisiles() = tieneMisiles
}
object contenedorPortuario {
    const carga =[]
    method peso() = 100 + self.pesoTotal()
    method pesoTotal() = carga.sum({carga => carga.peso()})
    method bultos() = 1 + carga.sum({c => c.bultos()}) // parte 2
    method consecuenciaCarga() {
        carga.forEach({carga => carga.consecuenciaCarga()})
    } //parte 2
    method peligrosidad() = if(carga.isEmpty()) 0 else carga.max({carga => carga.peligrosidad()}).peligrosidad()
    method cargar(cosa) {carga.add(cosa)}

}
object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1 // parte 2
    method consecuenciaCarga() {
        peso += 15
    }//parte 2
}
object embalajeSeguridad {
    var property cosaEmbalada = arenaGranel
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad() / 2
    method bultos() = 2  // parte 2
    method consecuenciaCarga() {}//parte2
}