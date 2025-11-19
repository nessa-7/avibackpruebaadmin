const express = require('express')
const app = express();

const cors = require('cors')

const adminRoutes = require('./rutas/adminRoutes')

app.use(cors({
    origin: 'http://localhost:5173',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type']
}))

app.use(express.json())

app.use('/avi', adminRoutes)

app.listen(3000, () => {
    console.log('Servidor corriendo en el puerto 3000')
})