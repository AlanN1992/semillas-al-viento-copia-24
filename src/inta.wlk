import parcelas.*

object inta {
	const parcelas = []
	
	method promedioDePlantas(){
		return parcelas.sum({cosa => cosa.cantidadPlantas()}) / parcelas.size()
	}
	
	method masAutosustentable(){
		const parcelaGrande = parcelas.filter({cosa=>cosa.cantidadPlantas() > 4})
		return (parcelaGrande.max({cosa=>cosa.cantidadPlantasBienAsociadas()}))		
	}
	
}
