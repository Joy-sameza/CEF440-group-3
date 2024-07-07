const RoadState = require('../models/roadState_model');


// Adding new road state to the database
const create_roadState = (req, res) => {
    const newRoadState = new RoadState({
        roadState: req.body.roadState,
        status: req.body.status,
        location: req.body.location, // { type: "Point", coordinates: [40.7128, -74.0060] }, Example: coordinates for a location
        ttl: req.body.ttl,
    });

    // Save the road state to the database
    newRoadState.save()
        .then(savedRoadState => {
            res.json(savedRoadState);
            console.log('Road state saved successfully:', savedRoadState);
        })
        .catch(err => {
            console.error('Error saving road state:', err);
            res.status(500).json({ error: 'Failed to add road state' });
        });
}

// Finding a particular road state by name
const find_roadState = (req, res) => {
    const nameOfIncident = req.params.nameOfIncident;
    RoadState.findOne({ roadState: nameOfIncident })
        .then(result => {
            if (!result) {
                return res.status(404).json({ error: 'Road state not found' });
            }
            res.json(result);
        })
        .catch(err => {
            console.error('Error fetching road state:', err);
            res.status(500).json({ error: 'Failed to fetch road state' });
        });
}

// Updating road state details by name
const update_roadState = (req, res) => {
    const nameOfIncident = req.params.nameOfIncident;
    const { roadState, status, location, ttl } = req.body;

    RoadState.findOneAndUpdate({ roadState: nameOfIncident }, { roadState, status, location, ttl }, { new: true })
        .then(updatedRoadState => {
            if (!updatedRoadState) {
                return res.status(404).json({ error: 'Road state not found' });
            }
            res.json(updatedRoadState);
        })
        .catch(err => {
            console.error('Error updating road state:', err);
            res.status(500).json({ error: 'Failed to update road state' });
        });
}

// Getting all road states from the database
const all_roadStates = (req, res) => {
    RoadState.find()
        .then(results => {
            res.json(results);
        })
        .catch(err => {
            console.error('Error fetching road states:', err);
            res.status(500).json({ error: 'Failed to fetch road states' });
        });
}

// Deleting road state from the database by name
const delete_roadState = (req, res) => {
    const { nameOfIncident } = req.params.nameOfIncident;

    RoadState.findOneAndDelete({ roadState: nameOfIncident })
        .then(deletedRoadState => {
            if (!deletedRoadState) {
                return res.status(404).json({ error: 'Road state not found' });
            }
            res.json(deletedRoadState);
        })
        .catch(err => {
            console.error('Error deleting road state:', err);
            res.status(500).json({ error: 'Failed to delete road state' });
        });
}



module.exports = {
    create_roadState,
    find_roadState,
    update_roadState,
    all_roadStates,
    delete_roadState
}