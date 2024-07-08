const express = require('express');
const reportController = require('../controllers/report_controller');
const AuthenticateUser = require('../Authentication/Authenticate');

const report_router = express.Router();



// POST - Adding new report in the database
report_router.post('/add-report', AuthenticateUser.authenticateUserToken, reportController.create_report);



// GET - Getting all reports from the database
report_router.get('/all-reports', AuthenticateUser.authenticateUserToken, reportController.all_reports);



// DELETE - Deleting a report from the database by ID
report_router.delete('/delete-report/:reportId', AuthenticateUser.authenticateUserToken, reportController.delete_report);



module.exports = report_router;
