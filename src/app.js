const express = require('express');
const setRoutes = require('./routes/index'); // Ensure this path is correct

console.log('Starting the server...');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

setRoutes(app); // Ensure this function is being called correctly

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});