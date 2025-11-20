const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()

const registroService = {
    async crearAspirante(data){
        return await prisma.aspirante.create({data})
    }
}

module.exports = registroService