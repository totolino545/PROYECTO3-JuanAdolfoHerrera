const fs = require('fs');
const path = require('path');
// const router = express.Router();
const ruta = path.join(__dirname, '../json/trailerflix.json');

function leer() {
    return new Promise((resolve, reject) => {
        fs.readFile(ruta, 'utf8', (error, result) => {
            if (error) reject(new Error('Error. No se puede leer'));
            resolve(JSON.parse(result));
        });
    });
}
function write(contenido, tabla, complemento, complementaria) {
    return new Promise((resolve, reject) => {
        const datoscontenido = JSON.stringify(contenido, null, 2);
        const datoscomplemento = JSON.stringify(complemento, null, 2);
        fs.writeFile(`src/json/${tabla}.json`, datoscontenido, 'utf8', (error) => {
            if (error) {
                reject(new Error('Error al escribir contenido en el archivo'));
            }
            resolve(true);
        });
        fs.writeFile(`src/json/${complementaria}.json`, datoscomplemento, 'utf8', (error) => {
            if (error) {
                reject(new Error('Error al escribir contenido en el archivo'));
            }
            resolve(true);
        });
    });
}

// eslint-disable-next-line max-lines-per-function
async function readAll() {
    const catalogo = await leer();
    const campos = ['genero', 'reparto', 'categoria'];
    const complementos = ['tags', 'actricesyactores', 'catalogo'];
    let campo = [];
    // eslint-disable-next-line max-lines-per-function
    campos.forEach((valor) => {
        const archivo = campos.indexOf(valor);
        let auxiliar = []; // array acumuladora de items
        let contenido = []; // array de Generos filtrados
        let complemento = []; // array de Actores filtrados
        let id = 1;
        let idc = 1;
        let ida = 1;
        let tabla1;
        let tabla2;
        catalogo.forEach((item) => {
            if (Object.hasOwn(item, valor)) {
                switch (valor) {
                case 'genero': {
                    campo = item[valor].split(', ');
                    campo.forEach((value) => {
                        if (!auxiliar.includes(value)) {
                            auxiliar.push(value);
                            contenido.push({ Id: id++, genero: value });
                        }
                        const idcom = auxiliar.indexOf(value);
                        complemento.push({ Id: idc++, IdTitulo: item.id, Idgen: idcom + 1 });
                    });
                    delete item.genero;
                    tabla1 = valor;
                    tabla2 = `catalogo_${complementos[archivo]}`;
                    break; }
                case 'reparto': {
                    campo = item[valor].split(', ');
                    campo.forEach((value) => {
                        if (!auxiliar.includes(valor)) {
                            auxiliar.push(value);
                            complemento.push({ Id: idc++, actor: value });
                        }
                        const idcom = auxiliar.indexOf(value);
                        contenido.push({ Id: id++, IdTitulo: item.id, IdActor: idcom + 1 });
                    });
                    delete item.reparto;
                    tabla1 = `catalogo_${valor}`;
                    tabla2 = complementos[archivo];
                    break; }
                case 'categoria': {
                    campo = item[valor].split(', ');
                    campo.forEach((value) => {
                        if (!auxiliar.includes(value)) {
                            auxiliar.push(value);
                            contenido.push({ Id: ida++, categoria: value });
                        }
                        item.poster = `http://127.0.0.1:8080${item.poster}`;
                        complemento.push(item);
                    });
                    tabla1 = valor;
                    tabla2 = complementos[archivo];
                    break; }
                default:
                }
            }
        });
        write(contenido, tabla1, complemento, tabla2);
    });
}

function init() {
    readAll();
    console.log('Operacion Completada');
}

init();

module.exports = { init };