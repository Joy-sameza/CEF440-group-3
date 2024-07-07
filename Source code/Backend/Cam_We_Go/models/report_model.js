const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// reports schema
const reportSchema = new Schema({
    nature: {
        type: String,
        enum: ['feedback', 'roadSign', 'roadState'],
        required: true
    },
    description: {
        type: String,
        required: true
    },
    filelink: {
        type: String,
        required: true
    },
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    }
}, { timestamps: true });

// Creating a model based on the report schema
const Report = mongoose.model('report', reportSchema);


module.exports = Report;