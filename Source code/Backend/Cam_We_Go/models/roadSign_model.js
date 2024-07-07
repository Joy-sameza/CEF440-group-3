const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Defining the road sign schema
const roadSignSchema = new Schema({
  name: {
    type: String,
    required: true,
    unique: true
  },
  description: {
    usage: {
      type: String,
      required: true
    },
    purpose: {
      type: String,
      required: true
    },
    action: {
      type: [String],
      required: true
    },
    penalty: {
      type: String,
      required: true
    }
  },
  category: {
    type: String,
    enum: ['Warning', 'Regulatory', 'Guide', 'Informative'],
    required: true
  },
  imageLink: {
    type: String,
    required: true,
    unique: true
  }
});

// Creating a model based on the road sign schema
const RoadSign = mongoose.model('RoadSign', roadSignSchema);

module.exports = RoadSign;
