# Proyecto Integrador N°3

El presente documento, es el **Proyecto Integrador N°3** de ***Argentina Program 4.0***. Ésta es una pequeña solución informática que sirve para la consulta de una base de datos MYSQL de películas y series implementada mediante un servidor Express.js y métodos http GET y POST.

#### Especificaciones
- Servidor: http://127.0.0.1:8080
- Autor: Juan Adolfo Herrera

#### Requerimientos
- Node.js v18.16.0
- Sequelize v6.33.0
- GIT v2.40.1
- IDE - Visual Studio Code v1.83.0

#### Estructura de directorios
``` tree
    ├── node_modules
    ├── src
    │   ├──server.js
    │   ├── connection
    │   │   └── connection_db.js
    │   ├── json
    │   │   └── varios archivos json generados mediante la funcion readjson.js.
    │   ├── models
    │   │   └── contiene los modelos que representan cada tabla de la base de datos.
    │   ├── routes  "Rutas a 
    │   │   └── actor.js 
    │   │   └── catalogo.js 
    │   │   └── readjson.js 
    │   │   └── writejson.js      
    ├── .env
    ├── .env.dist
    ├── .eslintrc.json
    ├── .gitignore
    ├── package.json
    ├── package-lock.json 
    └── README.md
```

---
### CONFIGURACION DE ENTORNO
  - #### VARIABLES DE ENTORNO
    Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables:
    ``` js
        PORT=8080
        HOST=127.0.0.1

        DB_NAME=TrailerFlix
        DB_USER=tu usuario de mysql
        DB_PASS=tu password de mysql
    ```

 - #### TESTS
    Hasta el momento, no se ha implementado ningún test, sin embargo se ha prestado gran atención a las validaciones.

 - #### ERRORES & FORMATOS
    La comprobación de errores y formatos se ejecuta por medio del comando ***npm run eslint***. se hace por medio de Eslint. Para visualizar los errores en tiempo de escritura, se debe tener instalada la extensión de **Eslint** en Visual Studio Code.
    
---
### MÓDULO DE READJSON

Este módulo permite leer el archivo trailerflix.json através de un script y generar archivos json de las claves principales que formarán las tablas de la base de datos. Se ejecuta por medio del comando ***npm run read***

### MÓDULO DE WRITEJSON

Este módulo permite cargar cada tabla de la base de datos TrailerFlix através de la lectura de archivos json generados por el módulo readjson, ver REF. La carga se realiza mediante un método POST en la ruta http://127.0.0.1:8080/writejson?load='?'. 

REF: (catálogo, categoría, genero, actricesyactores, catalogo_tags, catalogo_reparto).

#### Métodos HTTP
| Tipo | URI | Descripción |
|------|-----|-------------|
| POST | http://127.0.0.1:8080/writejson?load='?' | Permite cargar las tablas (ver REF) Requiere query|

### MÓDULO DE CATALOGO

Este módulo permite consultas a la base de datos TrailerFlix. El mismo, ofrece diferentes opciones de filtro, ver REF. Además, permite visualizar reportes por Id , filtrar registros por nombre, categoría y género, en estos últimos permiten búsquedas por parámetros pacciales.
REF. (catálogo, categoría, genero, actricesyactores).

#### Métodos HTTP
| Tipo | URI | Descripción |
|------|-----|-------------|
| GET  | http://127.0.0.1:8080/catalogo | Obtiene los registros de cada tabla(ver REF) Requiere query|
| GET  | http://127.0.0.1:8080/catalogo/1 | Obtiene un registro en específico |
| GET  | http://127.0.0.1:8080/catalogo/nombre/:nombre | Obtiene un registro determinado por el nombre o porción del mismo |
| GET  | http://127.0.0.1:8080/catalogo/genero/:genero | Obtiene todos registro de un género específico |
| GET  | http://127.0.0.1:8080/catalogo/categoria/:categoria | Obtiene todos registro de una categoría específica |


