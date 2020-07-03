import plantas.*

class Parcela{
	var property ancho
	var property largo 
	var property horasDeSol
	var property tipoParcela
	const plantas = []
	
	method superficie(){ return ancho*largo }
	method cantidadMaxima(){ return if (largo > 3) {largo + 4} else {self.superficie() / 2} }
	method tieneComplicaciones(){ return (plantas.any({cosa => cosa.horasSolTolera() < horasDeSol})) }
	method poderPlantar(newPlanta){
		const tieneEspacio = plantas.size() < self.cantidadMaxima()
		const noTieneMasSol = ( horasDeSol -  newPlanta.horasSolTolera() ) <=2
		if (tieneEspacio and noTieneMasSol) {plantas.add(newPlanta)} else { self.error("Parcela completa o mucho sol para la planta")} 
	}	
}