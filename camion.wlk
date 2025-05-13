object camion {
    const carga = []
    method pesoTotal() = 1000 + carga.sum({carga => carga.peso()})
    method peso() = self.pesoTotal()
    method cargar(cosa) {
        carga.add(cosa)
        cosa.consecuenciaCarga()
    }
    method descargar(cosa) {carga.remove(cosa)}
    method cosasCargadasSonTodasPares() = carga.all({c => c.peso().even()})
    method cosasSuperanNivelPeligrosidad(nivel) = carga.filter({carga => carga.peligrosidad() > nivel})
    method cosasSuperanPeligrosidadDeCosa(cosa) = carga.filter({c => c.peligrosidad() > cosa.peligrosidad()})


    method excedePeso() = self.pesoTotal() > 2500
    method puedeRutear(nivel) = 
    (not self.excedePeso() and self.cosasSuperanNivelPeligrosidad(nivel).isEmpty())
    
    method cosaPesaEntre_Y_(pesoMinimo, pesoMaximo) = carga.any({c => c.peso().between(pesoMinimo, pesoMaximo)})

}