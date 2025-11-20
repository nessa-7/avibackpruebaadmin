const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


const adminService = {

    async buscarPorId(id) {
        return await prisma.admin.findUnique({
            where: { id }
        });
    }
    
}

module.exports = adminService;

