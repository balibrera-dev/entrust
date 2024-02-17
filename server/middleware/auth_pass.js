const jwt = require('jsonwebtoken');
const public_key = 'paswordKey';

const authPass = async (req, res, next) => {
  try {
    //CHECK FOR TOKEN
    const token = req.header('x-auth-token');
    if (!token)
      return res.status(401).json({
        msg: 'No auth token, access denied',
      });
    //GET USER FROM TOKEN
    const verifiedUser = jwt.verified(token, public_key);
    if (!verifiedUser)
      return res.status(401).json({
        msg: 'Token verification failed, access denied',
      });
    req.user = verifiedUser.id;
    req.token = token;
    next();
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

module.exports = authPass;
