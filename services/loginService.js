const {PrismaClient} = require('@prisma/client');
const prisma = new PrismaClient();

const loginService = {

    async buscarPorId(id) {
        return await prisma.aspirante.findUnique({
            where: {id}
        })
    }

}

module.exports = loginService