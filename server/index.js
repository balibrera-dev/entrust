//PACKAGES
const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();
//FILES
const authRouter = require('./routes/auth');
//INIT
const PORT = process.env.PORT || 3000;
const app = express();
//MIDDLEWARE
app.use(express.json());
app.use(authRouter);
//LISTEN
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Connected to entrust server at port ${PORT}`);
});
//DATABASE
mongoose
  .connect(process.env.MONGO)
  .then(() => {
    console.log('Connected to moongose database');
  })
  .catch((e) => {
    console.log(e);
  });
