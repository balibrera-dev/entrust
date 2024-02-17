//PACKAGES
const express = require('express');
const jwt = require('jsonwebtoken');
const bcryiptjs = require('bcrypt');
//FILES
const User = require('../models/users');
const authPass = require('../middleware/auth_pass');
//INIT
const authRouter = express.Router();
//
// REGISTER ENDPOINT
//
authRouter.post('/api/signup', async (req, res) => {
  try {
    //GET CLIENT DATA
    const { username, email, password } = req.body;
    //POST TO DATABASE
    const existingUser = await User.findOne({ email }); //return to client

    if (existingUser) {
      return res.status(400).json({
        msg: 'User with same email already exists!',
      });
    }
    //REGISTER USER
    const hashedPassword = await bcryiptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      username,
    });

    user = await user.save();

    res.status(201).json(user);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});
//
// LOGIN ENDPOINT
//
authRouter.post('/api/signin', async (req, res) => {
  try {
    //GET CLIENT DATA
    const { email, password } = req.body;
    //POST TO DATABASE
    const user = await User.findOne({ email }); //return to client
    //EMAIL NOT FOUND
    if (!user) {
      return res.status(400).json({
        msg: 'User with this email does not exist',
      });
    }
    //PASSWORD
    const isMatch = await bcryiptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({
        msg: 'Incorrect password',
      });
    }
    //TOKEN
    const token = jwt.sign({ id: user._id }, process.env.JWTPASS);

    res.status(200).json({ token, ...user._doc });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});
//
// TOKEN VALIDATION ENDPOINT
//
authRouter.post('/api/validToken', async (req, res) => {
  try {
    //TOKEN VALIDATION
    const token = req.header('x-auth-token');
    if (!token) return res.json(false);
    const verified = jwt.verify(token, public_key);
    if (!verified) return res.json(false);
    //USER VALIDATION
    const user = await findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});
//
//  GET USER ENDPOINT
//
authRouter.get('/', authPass, async (req, res) => {
  try {
    //USER VALIDATION
    const user = await findById(req.user);
    if (!user) return res.json({});
    res.json({
      ...user._doc,
      token,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

//EXPORT
module.exports = authRouter;
