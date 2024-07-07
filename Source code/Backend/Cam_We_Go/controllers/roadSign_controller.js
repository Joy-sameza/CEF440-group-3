const RoadSign = require('../models/roadSign_model');


// Adding new road sign to the database
const create_roadSign = (req, res) => {
    const newRoadSign = new RoadSign({
        name: req.body.name,
        description: {
            usage: req.body.description.usage,
            purpose: req.body.description.purpose,
            action: req.body.description.action,
            penalty: req.body.description.penalty
        },
        category: req.body.category,
        image: req.body.image
    });

    // Save the road sign to the database
    newRoadSign.save()
        .then(savedRoadSign => {
            res.json(savedRoadSign);
            console.log('Road sign saved successfully:', savedRoadSign);
        })
        .catch(err => {
            console.error('Error saving road sign:', err);
            res.status(500).json({ error: 'Failed to add road sign' });
        });
}

// Finding a particular road sign by name
const find_roadSign = (req, res) => {
    const name = req.params.name;
    RoadSign.findOne({ name: name })
        .then(result => {
            if (!result) {
                return res.status(404).json({ error: 'Road sign not found' });
            }
            res.json(result);
        })
        .catch(err => {
            console.error('Error fetching road sign:', err);
            res.status(500).json({ error: 'Failed to fetch road sign' });
        });
}

const update_roadSign = (req, res) => {
    const { name } = req.params.name;
    const { description, category, image } = req.body;

    RoadSign.findOneAndUpdate({ name: name }, { description, category, image }, { new: true })
        .then(updatedRoadSign => {
            if (!updatedRoadSign) {
                return res.status(404).json({ error: 'Road sign not found' });
            }
            res.json(updatedRoadSign);
        })
        .catch(err => {
            console.error('Error updating road sign:', err);
            res.status(500).json({ error: 'Failed to update road sign' });
        });
}

// Getting all road signs from the database
const all_roadSigns = (req, res) => {
    RoadSign.find()
        .then(results => {
            res.json(results);
        })
        .catch(err => {
            console.error('Error fetching road signs:', err);
            res.status(500).json({ error: 'Failed to fetch road signs' });
        });
}

// Deleting road sign from the database by name
const delete_roadSign = (req, res) => {
    const { name } = req.params.name;

    RoadSign.findOneAndDelete({ name: name })
        .then(deletedRoadSign => {
            if (!deletedRoadSign) {
                return res.status(404).json({ error: 'Road sign not found' });
            }
            res.json(deletedRoadSign);
        })
        .catch(err => {
            console.error('Error deleting road sign:', err);
            res.status(500).json({ error: 'Failed to delete road sign' });
        });
}



module.exports = {
    create_roadSign,
    find_roadSign,
    update_roadSign,
    all_roadSigns,
    delete_roadSign
};
