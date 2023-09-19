const UserController = require('../controllers/usersController');

module.exports = (app) => {

    /** traer datos u obtener */
    app.get('/api/users/getAll', UserController.getAll);

/** crear o guardar datos */
    app.post('/api/users/create',  UserController.register);

    app.post('/api/users/login',  UserController.login);
}