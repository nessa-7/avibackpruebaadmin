const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const bcrypt = require('bcrypt');

const adminService = {
    // buscar admin por email
    async buscarPorEmail(email) {
        return await prisma.admin.findUnique({
            where: { email }
        });
    },

    // comparar contraseñas
    async compararPassword(passwordPlano, passwordHash) {
        return await bcrypt.compare(passwordPlano, passwordHash);
    }
}

module.exports = adminService;