const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const path = require('path');

const sequelize = require('./connection/connection_db');
const catalogo = require('./routes/catalogo');
const writejson = require('./routes/writejson');
const titulos = require('./routes/titulos');

const server = express();

// Middlewares
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

// Servir un recurso de forma estática (imagenes, PDFs, etc.)
server.use('/json', express.static(path.join(__dirname, 'json')));

// Rutas a Catalogos
server.use('/catalogo', catalogo);

// Rutas a Writejson
server.use('/writejson', writejson);

// Rutas a titulos
server.use('/titulos', titulos);

// Control de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send(`<h1>Error 404</h1><h3>La URL indicada no existe en este servidor</h3>`);
});

// Manejo de errores
server.use((err, req, res) => {
    console.log(err);
    res.send('error');
});

// Método oyente de solicitudes
sequelize.authenticate().then(() => {
    sequelize.sync({ force: false }).then(() => {
        server.listen(process.env.PORT, process.env.HOST, () => {
            console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
        });
    }).catch(() => {
        console.log('Hubo un problema con la sincronización con la base de datos.');
    });
}).catch(() => {
    console.log('Hubo un problema con la conección a la base de datos.');
});
