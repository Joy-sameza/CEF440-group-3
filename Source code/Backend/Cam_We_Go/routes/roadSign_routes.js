const express = require('express');
const roadSignController = require('../controllers/roadSign_controller')
const AuthenticateUser = require('../Authentication/Authenticate');


const roadSign_router = express.Router();



// POST - Adding new road sign to the database
roadSign_router.post('/add', AuthenticateUser.authenticateUserToken, roadSignController.create_roadSign);



// GET - Finding a particular road sign by name
roadSign_router.get('/single/:name', AuthenticateUser.authenticateUserToken, roadSignController.find_roadSign);



// PUT - Updating road sign details by name
roadSign_router.put('/update/:name', AuthenticateUser.authenticateUserToken, roadSignController.update_roadSign);



// GET - Getting all road signs from the database
roadSign_router.get('/all-roadSigns', AuthenticateUser.authenticateUserToken, roadSignController.all_roadSigns);



// DELETE - Deleting road sign from the database by name
roadSign_router.delete('/delete-roadSign/:name', AuthenticateUser.authenticateUserToken, roadSignController.delete_roadSign);



module.exports = roadSign_router;
