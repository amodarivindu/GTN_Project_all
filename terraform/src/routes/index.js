const IndexController = require('../controllers/index');

function setRoutes(app) {
    const indexController = new IndexController();
    app.get('/', (req, res) => indexController.getIndex(req, res));
}

module.exports = setRoutes;