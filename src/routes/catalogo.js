const express = require('express');
const router = express.Router();

const { Op } = require('sequelize');
const { Generos, Actricesyactores, Categorias, Vista_Catalogo } = require('../models/index');
const messageErrorServer = JSON.stringify({ message: 'Se produjo un error en el server' });
// Endpoint a /catalogo lista las tablas Generos, Actricesyactores, Catalogo y
// Categorias ruta http://localhost:8080/catalogo?busqueda='?'
router.get('/', async (req, res, next) => {
    // Pamámetro recibido por query
    const item = req.query.busqueda;
    const campo = ['generos', 'categorias', 'actricesyactores', 'catalogo'];
    if (!campo.includes(item)) {
        res.status(400).send({ message: `Error: Se requiere un parámetro de búsqueda correcto.` });
        return;
    }
    try {
        let listado;

        switch (item) {
        case 'generos':
            listado = await Generos.findAll();
            break;
        case 'categorias':
            listado = await Categorias.findAll();
            break;
        case 'actricesyactores':
            listado = await Actricesyactores.findAll();
            break;
        case 'catalogo':
            listado = await Vista_Catalogo.findAll();
            break;
        default:
            res.status(400).send({ message: 'Error: Endpoint  no válido.' });
            return;
        }

        res.status(200).send(listado);
    } catch (err) {
        res.status(messageErrorServer);
        next(err);
    }
});

// Endpoint a /actor/ filtrar por nombre o parte del nombre ruta http://localhost:8080/actor/?actor=''?
router.get('/actor/:actor', async (req, res, next) => {
    const nombre = req.params.actor;
    try {
        if (!nombre) {
            res.status(400);
            next({ message: `Error: Se requiere un parámetro de búsqueda.` });
            return;
        }
        // Realiza la búsqueda utilizando el operador LIKE
        const resultados = await Vista_Catalogo.findAll({
            where: {
                Reparto: {
                    [Op.like]: `%${nombre}%`
                }
            }
        });
        if (resultados.length === 0) {
            res.status(400).json({ message: 'No se han encontrado coincidencias' });
            return;
        }
        const consulta = JSON.stringify(resultados, null, '\t');

        res.send(consulta);
    } catch (error) {
        console.error('Error en la búsqueda:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

// Endpoint a /catalogo/nombre busqueda por titulo o porcion del nombre ruta http://localhost:8080/catalogo/nombre/titulo
router.get('/nombre/:nombre', async (req, res, next) => {
    try {
        const titulo = req.params.nombre;
        // Verifica si el parámetro de búsqueda está presente
        if (!titulo) {
            res.status(400);
            next({ message: `Error: Se requiere un parámetro de búsqueda.` });
            return;
        }
        // Realiza la búsqueda utilizando el operador LIKE
        const resultados = await Vista_Catalogo.findAll({
            where: {
                Titulo: {
                    [Op.like]: `%${titulo}%`
                }
            }
        });
        if (resultados.length === 0) {
            res.status(400).json({ message: 'No se han encontrado coincidencias' });
            return;
        }
        const consulta = JSON.stringify(resultados, null, '\t');

        res.send(consulta);
    } catch (error) {
        console.error('Error en la búsqueda:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

// Endpoint a /catalogo/genero busqueda por Genero ruta http://localhost:8080/catalogo/genero/nombre
router.get('/genero/:genero', async (req, res, next) => {
    try {
        const nombre = req.params.genero;
        console.log(nombre);
        // Verifica si el parámetro de búsqueda está presente
        if (!nombre) {
            res.status(400);
            next({ message: `Error: Se requiere un parámetro de búsqueda.` });
            return;
        }
        // Realiza la búsqueda utilizando el operador LIKE
        const resultados = await Vista_Catalogo.findAll({
            where: {
                Genero: {
                    [Op.like]: `%${nombre}%` // `%` es un comodín para buscar cualquier coincidencia
                }
            }
        });
        if (resultados.length === 0) {
            res.status(400).json({ message: 'No se han encontrado coincidencias' });
            return;
        }
        const consulta = JSON.stringify(resultados, null, '\t');

        res.send(consulta);
    } catch (error) {
        console.error('Error en la búsqueda:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

// Endpoint a /catalogo/categoria busqueda por Categoria ruta http://localhost:8080/catalogo/genero/nombre
router.get('/categoria/:categoria', async (req, res, next) => {
    const nombre = req.params.categoria;
    // Verifica si el parámetro de búsqueda está presente
    if (!nombre) {
        res.status(400);
        next({ message: `Error: Se requiere un parámetro de búsqueda.` });
        return;
    }
    try {
        // Realiza la búsqueda utilizando el operador LIKE
        const resultados = await Vista_Catalogo.findAll({
            where: {
                Categoria: {
                    [Op.like]: `%${nombre}%` // `%` es un comodín para buscar cualquier coincidencia
                }
            }
        });
        if (resultados.length === 0) {
            res.status(400).json({ message: 'No se han encontrado coincidencias' });
            return;
        }
        const consulta = JSON.stringify(resultados, null, '\t');

        res.send(consulta);
    } catch (error) {
        console.error('Error en la búsqueda:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});


module.exports = router;