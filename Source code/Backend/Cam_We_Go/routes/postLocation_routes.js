const express = require('express');
const postController = require('../controllers/postLocation_controller');
const AuthenticateUser = require('../Authentication/Authenticate');

const post_router = express.Router();



// POST - Adding new post in the database
post_router.post('/create', AuthenticateUser.authenticateUserToken, postController.create_post);



// POST - Request with a body specifying the user's location and desired direction.
post_router.post('/get', AuthenticateUser.authenticateUserToken, postController.findPostNearUser);



// POST - Request similar to finding the nearest post, but with a circular range.
post_router.post('/near', AuthenticateUser.authenticateUserToken, postController.findPostNearUserCircle);



// GET - Finding a particular post by roadSignIds
post_router.get('/single', AuthenticateUser.authenticateUserToken, postController.find_post);



// PUT/PATCH - Updating a particular post by roadSignIds
post_router.put('/update', AuthenticateUser.authenticateUserToken, postController.update_post);



// GET - Getting all posts
post_router.get('/all', AuthenticateUser.authenticateUserToken, postController.all_posts);


// DELETE - Deleting post by roadSignIds
post_router.delete('/delete', AuthenticateUser.authenticateUserToken, postController.delete_post);




module.exports = post_router;
