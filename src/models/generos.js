const { DataTypes } = require('sequelize');
const sequelize = require('../connection/connection_db');

const Generos = sequelize.define('Generos', {
    Id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    genero: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'Generos',
    timestamps: false
});

module.exports = Generos;