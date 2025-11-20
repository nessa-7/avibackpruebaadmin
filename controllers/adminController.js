const adminService = require('../services/adminService');

const adminController = {
    async login(req, res) {
        const { idAdmin, password } = req.body;

        const buscaradmin = await adminService.buscarPorId(Id)
        res.json({mensaje: "Admin encontrado", aspirante: buscaradmin})
    }
}

module.exports = adminController;
