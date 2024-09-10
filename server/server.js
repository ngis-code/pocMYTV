require('dotenv').config();
const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 8001;

const staticFolder = path.join(__dirname, process.env.BUILD_FOLDER || '../build/web');

app.use(express.static(staticFolder));

app.get('/', (req, res) => {
    res.sendFile(path.join(staticFolder, 'index.html'));
});

app.use((req, res, next) => {
    res.status(404).send('Sorry, we could not find what you were looking for!');
});

app.listen(port, () => {
    console.log(`Frontend is running on port ${port}!`);
    console.log(`Serving static files from: ${staticFolder}`);
});
