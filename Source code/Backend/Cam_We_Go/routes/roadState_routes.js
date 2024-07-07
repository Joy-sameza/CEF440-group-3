const express = require('express');
const roadStateController = require('../controllers/roadState_controller');
const AuthenticateUser = require('../Authentication/Authenticate');

const roadState_router = express.Router();



// POST - Adding new road state to the database
roadState_router.post('/add-roadState', AuthenticateUser.authenticateUserToken, roadStateController.create_roadState);



// GET - Finding a particular road state by name
roadState_router.get('/single-roadState/:nameOfIncident', AuthenticateUser.authenticateUserToken, roadStateController.find_roadState);



// PUT - Updating road state details by name
roadState_router.put('/update-roadState/:nameOfIncident', AuthenticateUser.authenticateUserToken, roadStateController.update_roadState);



// GET - Getting all road states from the database
roadState_router.get('/all-roadStates', AuthenticateUser.authenticateUserToken, roadStateController.all_roadStates);



// DELETE - Deleting road state from the database by name
roadState_router.delete('/delete-roadState/:nameOfIncident', AuthenticateUser.authenticateUserToken, roadStateController.delete_roadState);



module.exports = roadState_router;
