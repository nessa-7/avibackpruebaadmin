const registroService = require('../services/registroService')

const registroController = {
    
    async createAspirante(req, res){
        const nuevo = req.body
        const nuevoRegistro = await registroService.crearAspirante(nuevo)
        res.json({mensaje: "Aspirante creado", aspirante:nuevoRegistro})
    }
}

module.exports = registroController