class IndexController {
    getIndex(req, res) {
        res.send('Welcome to the simple Node.js application!');
    }
}

module.exports = IndexController;