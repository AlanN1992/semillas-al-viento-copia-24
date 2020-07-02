class Planta {
	var property anioObtencion
	var property altura
	
	method horasSolTolera(){ return 2}
	method esFuerte(){ return (self.horasSolTolera() >= 9) }
	method daSemilla(){ return true}
	method espacioOcupado(){return 2}
	
}
