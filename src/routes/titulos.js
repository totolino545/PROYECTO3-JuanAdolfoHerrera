const express = require('express');
const router = express.Router();

const { Vista_Catalogo } = require('../models/index');

// Endpoint a /titilos lista por ID, ruta http://localhost:8080/titulos/1
router.get('/:catalogoid', async (req, res, next) => {
    const ID = req.params.catalogoid;

    if (Number.isNaN(Number(ID))) {
        res.status(400).send({ message: 'El ID tiene que ser un número' });
        return;
    }

    const titulo = await Vista_Catalogo.findByPk(ID);
    if (!titulo) {
        res.status(404);
        next({ message: 'El ID no se encontró' });
        return;
    }

    res.status(200).send(titulo);
});


module.exports = router;