const loginService = require('../services/loginService')

const loginController = {

    async login(req, res){
        const {idAspirante, password } = req.body;
        const buscaraspirante = await loginService.buscarPorId(Id)
        res.json({mensaje: "Aspirante encontrado", aspirante: buscaraspirante})
    }
}

module.exports = loginController