const { DataTypes } = require('sequelize');
const sequelize = require('../connection/connection_db');

const Catalogo_Reparto = sequelize.define('Catalogo_Reparto', {
    Id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    IdTitulo: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    IdActor: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    tableName: 'Catalogo_Reparto',
    timestamps: false
});

module.exports = Catalogo_Reparto;