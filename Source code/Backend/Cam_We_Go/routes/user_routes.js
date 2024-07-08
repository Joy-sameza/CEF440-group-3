const express = require('express');
const userController = require('../controllers/user_controller')
const AuthenticateUser = require('../Authentication/Authenticate');

const user_router = express.Router();



// POST - Login a user
user_router.post('/login', userController.login_user);



// POST - Create a new user
user_router.post('/create', userController.create_user);



// PUT/PATCH - Update user details
user_router.put('/update', AuthenticateUser.authenticateUserToken, userController.update_user);



// Functions Executed by admin

// GET a single user by ID
user_router.get('/single/:userId', AuthenticateUser.authenticateUserToken, userController.find_user);



// DELETE - Delete a user
user_router.delete('/delete', AuthenticateUser.authenticateUserToken, userController.delete_user);



// GET all users
user_router.get('/all', AuthenticateUser.authenticateUserToken, userController.all_users);


module.exports = user_router;
