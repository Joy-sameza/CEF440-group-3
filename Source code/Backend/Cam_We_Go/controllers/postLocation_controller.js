const PostLocation = require('../models/postLocation_model');

const CIRCLE_RADIUS = 1000; // in Meters
const APP_EARTH_RADIUS = 6378 * 1000; // in Meters



// Adding new post in the database
const create_post = (req, res) => {
    const { location, roadSigns } = req.body;

    const newPostLocation = new PostLocation({
        location: {
            type: location.type,
            coordinates: [location.coordinates.longitude, location.coordinates.latitude]
        },
        roadSigns
    });

    newPostLocation.save()
        .then(result => {
            res.json(result);
        })
        .catch(err => {
            if (err.name === 'ValidationError') {
                console.log(err);
                res.status(400).json({ error: 'Invalid coordinates' });
            } else {
                res.status(500).json({ error: 'Failed to add post' });
            }
        });
}




// Finding post nearest to user
const findPostNearUser = (req, res) => {
    const { location, direction } = req.body;

    PostLocation.find({
        location: {
            $near: {
                $geometry: {
                    type: location.type,
                    coordinates: [location.coordinates.longitude, location.coordinates.latitude]
                },
                $minDistance: 250, // in Meters
                $maxDistance: 350 // in Meters
            }
        },
        'roadSigns.direction': direction
    })
        .then(post => {
            if (!post.length) {
                return res.status(204).json({ error: 'No post found in the range' });
            }
            res.json(post);
        })
        .catch(err => {
            if (err.name === 'ValidationError') {
                res.status(400).json({ error: 'Invalid coordinates' });
            } else {
                res.status(500).json({ error: 'Failed to fetch nearest post' });
            }
        });
}




// Finding post nearest to user within a circle
const findPostNearUserCircle = (req, res) => {
    const { location, direction, circleRadius } = req.body;

    const center = [location.coordinates.longitude, location.coordinates.latitude]; // [longitude, latitude]
    const radius = circleRadius || CIRCLE_RADIUS; // in meters

    PostLocation.find({
        location: {
            $geoWithin: {
                $centerSphere: [center, radius / APP_EARTH_RADIUS] // radius in meters
            }
        },
        'roadSigns.direction': direction
    })
        .then(cPosts => {
            if (!cPosts.length) {
                return res.status(204).json({ error: 'No posts found in the circular range' });
            }
            res.json(cPosts);
        })
        .catch(err => {
            if (err.name === 'ValidationError') {
                res.status(400).json({ error: 'Invalid coordinates' });
            } else {
                res.status(500).json({ error: 'Failed to fetch circular range posts' });
            }
        });
}




// Getting all posts
const all_posts = (req, res) => {
    const { location, direction } = req.body;

    PostLocation.aggregate([
        {
            $geoNear: {
                near: {
                    type: location.type,
                    coordinates: [location.coordinates.longitude, location.coordinates.latitude]
                },
                spherical: true,
                distanceField: "distance",
                query: { 'roadSigns.direction': direction }
            }
        },
        {
            $sort: { distance: 1 }
        }
    ])
        .then(posts => {
            res.json(posts);
        })
        .catch(err => {
            if (err.name === 'ValidationError') {
                res.status(400).json({ error: 'Invalid coordinates' });
            } else {
                res.status(500).json({ error: 'Failed to fetch posts' });
            }
        });
}




// Finding a particular post by roadSignIds
const find_post = (req, res) => {
    const { roadSignIds, direction } = req.query;
    const roadSignIdsArray = Array.isArray(roadSignIds) ? roadSignIds : [roadSignIds];

    PostLocation.find({
        'roadSigns.roadSignId': { $in: roadSignIdsArray },
        'roadSigns.direction': direction
    })
        .then(results => {
            if (!results.length) {
                return res.status(404).json({ error: 'Post not found' });
            }
            res.json(results);
        })
        .catch(err => {
            res.status(500).json({ error: 'Failed to fetch post' });
        });
}




// Updating a particular post by roadSignIds
const update_post = (req, res) => {
    const { roadSignIds, direction, coordinates } = req.body;
    const roadSignIdsArray = Array.isArray(roadSignIds) ? roadSignIds : [roadSignIds];
    const updated_post = { 
        roadSigns: roadSignIdsArray.map(id => ({ roadSignId: id, direction })),
        location: { type: 'Point', coordinates }
    };

    PostLocation.findOneAndUpdate(
        { 'roadSigns.roadSignId': { $in: roadSignIdsArray }, 'roadSigns.direction': direction }, 
        updated_post, 
        { new: true }
    )
        .then(updatedPost => {
            if (!updatedPost) {
                return res.status(404).json({ error: 'Post not found' });
            }
            res.json(updatedPost);
        })
        .catch(err => {
            console.error('Error updating post:', err);
            res.status(500).json({ error: 'Failed to update post' });
        });
}



// Deleting post by roadSignIds
const delete_post = (req, res) => {
    const { roadSignIds, direction } = req.query;
    const roadSignIdsArray = Array.isArray(roadSignIds) ? roadSignIds : [roadSignIds];

    PostLocation.findOneAndDelete({
        'roadSigns.roadSignId': { $in: roadSignIdsArray },
        'roadSigns.direction': direction
    })
        .then(deletedPost => {
            if (!deletedPost) {
                return res.status(404).json({ error: 'Post not found' });
            }
            res.json(deletedPost);
        })
        .catch(err => {
            res.status(500).json({ error: 'Failed to delete post' });
        });
}




module.exports = {
    create_post,
    findPostNearUser,
    findPostNearUserCircle,
    find_post,
    update_post,
    all_posts,
    delete_post
}