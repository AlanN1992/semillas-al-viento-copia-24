import parcelas.*

class Planta inherits Parcela{
	var property anioObtencion
	var property altura
	
	method horasSolTolera(){ return 7}
	method esFuerte(){ return (self.horasSolTolera() >= 9) }
	method daSemilla(){ return (self.esFuerte())}
	method espacioOcupado()
	method parcelaIdeal()
	method seAsociaBien(){
		var seAsocia
		if (self.tipoParcela() == 'ecologica'){
			if(not self.tieneComplicaciones() and self.parcelaIdeal()){seAsocia = true}
			else {seAsocia = false} 
			}
		else{
			if (plantas.size() == 2 and self.esFuerte()){seAsocia = true}
			else {seAsocia=false}
			}
	}	
}

class Menta inherits Planta{
	
	override method espacioOcupado(){ return (altura + 1) }
	override method daSemilla(){ return (super() or self.espacioOcupado() > 1.5 ) }
	override method parcelaIdeal(){ return (self.superficie() > 6)}
}

class Soja inherits Planta{
	override method horasSolTolera(){
		if (altura < 0.3) { return 6 }
		else if (altura.between(0.3,0.8)){return 7}
		else {return 12}
		}
	override method daSemilla(){ 
		const condicionAlternativa = (anioObtencion > 2007 and altura.between(0.75,0.9))
		return (super() or condicionAlternativa)
		}
	override method espacioOcupado(){ return altura/2}
	override method parcelaIdeal(){return self.horasDeSol() == self.horasSolTolera()}
}

class Quinoa inherits Planta{
	var property espacioOcupaQuinoa
	
	override method horasSolTolera(){ return if(espacioOcupaQuinoa < 0.3){return 10} else {super()} }
	override method daSemilla(){ return(super() or anioObtencion < 2005) }
	override method parcelaIdeal(){ return (plantas.all({cosa=>cosa.altura() < 1.5}))}
	override method espacioOcupado(){return espacioOcupaQuinoa}
}

class SojaTransgenica inherits Soja{
	override method daSemilla(){ return false}
	override method parcelaIdeal(){ return (self.cantidadMaxima() == 1)}
}

class HierbaBuena inherits Menta{
	override method espacioOcupado(){ return super()*2}
}
