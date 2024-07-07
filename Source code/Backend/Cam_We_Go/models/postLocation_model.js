const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Defining the post location schema
const postLocationSchema = new Schema({
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
    roadSigns: [{
        roadSignId: {
            type: Schema.Types.ObjectId,
            ref: 'RoadSign'
        },
        direction: {
            type: String,
            enum: ['North', 'East', 'South', 'West'],
            required: true
        }
    }]
});

// 2D sphere index
postLocationSchema.index({ location: '2dsphere' });
// roadSigns direction index
postLocationSchema.index({ 'roadSigns.direction': 1 });

// Creating a model based on the post location schema
const PostLocation = mongoose.model('PostLocation', postLocationSchema);

module.exports = PostLocation;
