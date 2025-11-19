const adminService = require('../services/adminService');
const jwt = require('jsonwebtoken');

const adminController = {
    async login(req, res) {
        const { email, password } = req.body;

        // validar que existe
        const admin = await adminService.buscarPorEmail(email);
        if (!admin) {
            return res.status(400).json({ mensaje: "Credenciales incorrectas" });
        }

        // validar contraseña
        const valido = await adminService.compararPassword(password, admin.password);
        if (!valido) {
            return res.status(400).json({ mensaje: "Credenciales incorrectas" });
        }

        // crear token
        const token = jwt.sign(
            {
                id: admin.id,
                nombre: admin.nombre,
                email: admin.email
            },
            process.env.JWT_SECRET,
            { expiresIn: "8h" }
        );

        res.json({
            mensaje: "Login exitoso",
            token
        });
    }
}

module.exports = adminController;