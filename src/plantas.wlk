class Planta {
	var property anioObtencion
	var property altura
	
	method horasSolTolera(){ return 7}
	method esFuerte(){ return (self.horasSolTolera() >= 9) }
	method daSemilla(){ return (self.esFuerte())}
	method espacioOcupado()	
}

class Menta inherits Planta{

	override method espacioOcupado(){ return (altura + 1) }
	override method daSemilla(){ return (super() or self.espacioOcupado() > 1.5 ) }
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
	override method espacioOcupado(){ return altura /2}
}

class Quinoa inherits Planta{
	var property espacioOcupaQuinoa
	
	override method horasSolTolera(){ return if(espacioOcupaQuinoa < 0.3){return 10} else {super()} }
	override method daSemilla(){ return(super() or anioObtencion < 2005) }
}

class SojaTransgenica inherits Soja{
	override method daSemilla(){ return false}
}

class HierbaBuena inherits Menta{
	override method espacioOcupado(){ return super()*2}
}
