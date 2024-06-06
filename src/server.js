const express = require('express');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('../swagger.json');
const memberController = require('./interfaces/memberController.js');
const bookController = require('./interfaces/bookController.js');
const { syncDatabase } = require('./infrastructure/models/index.js');
require('dotenv').config();

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/api', memberController);
app.use('/api', bookController);

const startServer = async () => {
    try {
        await syncDatabase();
        app.listen(port, () => {
            console.log(`Server is running on http://localhost:${port}`);
        });
    } catch (error) {
        console.error('Unable to sync database:', error);
    }
};

startServer();
