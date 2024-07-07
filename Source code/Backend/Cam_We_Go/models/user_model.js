const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define the schema
const UserSchema = new Schema({
  userName: {
    type: String,
    required: true
  },
  userEmail: {
    type: String,
    required: true,
    unique: true  // userEmail should be unique
  },
  userNumber: {
    type: String,
    required: true,
    unique: true  // userEmail should be unique
  },
  userPassword: {
    type: String,
    required: true
  },
  roadSignPreferences: {
    type: [String],  // Array of strings
    enum: ['Warning', 'Regulatory', 'Informative' ,'Guide']  // Only allow these values
  },
  roadStatePreferences: {
    type: [String],  // Array of strings
    enum: ['Events', 'Constructions', 'Accidents', 'Weather', 'Traffic']  // Only allow these values
  }
}, { timestamps: true });

// Indexes
UserSchema.index({ userEmail: 1 });
UserSchema.index({ userNumber: 1 });

// Create a model based on the schema
const User = mongoose.model('User', UserSchema);

module.exports = User;
