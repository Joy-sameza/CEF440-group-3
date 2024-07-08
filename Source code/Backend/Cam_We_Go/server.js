require('dotenv').config()

const express = require('express');
const morgan = require('morgan');
const mongoose = require('mongoose');

// loading app routes 
const user_router = require('./routes/user_routes');
const roadSign_router = require('./routes/roadSign_routes');
const roadState_router = require('./routes/roadState_routes');
const post_router = require('./routes/postLocation_routes');
const report_router = require('./routes/report_routes');


// creating express app
const app = express();

// middleware
app.use(morgan('dev'));
app.use(express.json());

// connecting to mongodb and listening for requests
const dbURI = process.env.MONGO_DB_CONNECTOR;
const port = process.env.PORT || 8080

mongoose.connect(dbURI)
    .then(() => {
        console.log('Connected to MongoDB');
        app.listen(port, () => {
            console.log(`Server is running on http://localhost:${port}`);
        });
    })
    .catch((error) => {
        console.error('MongoDB connection error:', error);
    });

// Routes
app.use('/user', user_router);
app.use('/roadsign', roadSign_router);
app.use('/roadstate', roadState_router);
app.use('/post', post_router);
app.use('/report', report_router);

module.exports = app;
