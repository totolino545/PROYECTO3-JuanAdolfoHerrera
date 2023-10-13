const express = require('express');
const router = express.Router();

const { Vista_Catalogo } = require('../models/index');

// Endpoint a /titulos lista por ID, ruta http://localhost:8080/titulos/1
router.get('/:catalogoid', async (req, res) => {
    const ID = req.params.catalogoid;
    try {
        if (Number.isNaN(Number(ID))) {
            res.status(400).send({ message: 'El ID tiene que ser un número' });
            return;
        }
        const titulo = await Vista_Catalogo.findByPk(ID);
        if (!titulo) {
            res.status(400).json({ message: 'No se han encontrado coincidencias' });
            return;
        }
        res.status(200).send(titulo);
    } catch (error) {
        console.error('Error en la búsqueda:', error);
        res.status(500).json({ message: 'Se ha generado un error en el servidor'});
    }
});


module.exports = router;