const mongoose = require('mongoose');
const authRouter = require('../routes/auth');

const userSchema = mongoose.Schema({
  username: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value) => {
        return value.length >= 3;
      },
      message: 'Username must be at least 3 characters long',
    },
  },
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: 'Please enter a valid email address',
    },
  },
  password: {
    type: String,
    required: true,
    validate: {
      validator: (value) => {
        console.log(value);
        return value.length >= 6;
      },
      message: 'Password must be at least 6 characters long',
    },
  },
  address: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    default: 'user',
  },
  token: {
    type: String,
    default: '',
  },
});

const User = mongoose.model('User', userSchema);
module.exports = User;
