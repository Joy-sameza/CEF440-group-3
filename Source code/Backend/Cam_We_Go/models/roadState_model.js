const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Defining the road state schema
const roadStateSchema = new Schema({
    roadState: {
        type: String,
        enum: ['Events', 'Constructions', 'Accidents', 'Weather', 'Traffic'],
        required: true
    },
    status: {
        type: String,
        enum: ['temporal', 'permanent', 'semi-permanent'],
        required: true
    },
    location: {
        type: {
            type: String,
            enum: ['Point'],
            required: true
        },
        coordinates: {
            type: [Number],
            required: true,
            validate: {
                validator: function(v) {
                    return v.length === 2 && v[0] >= -180 && v[0] <= 180 && v[1] >= -90 && v[1] <= 90;
                },
                message: props => `${props.value} is not a valid coordinates array!`
            }
        }
    },
    ttl: {
        type: Number,
        required: true
    }
});

// Defining 2D sphere index
roadStateSchema.index({ location: '2dsphere' });

const RoadState = mongoose.model('roadState', roadStateSchema);

module.exports = RoadState;