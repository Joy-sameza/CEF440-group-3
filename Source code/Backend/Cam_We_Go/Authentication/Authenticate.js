require('dotenv').config();

const jwt = require('jsonwebtoken');

const { SECRET_TOKEN: secretToken, REFRESH_TOKEN: refreshToken } = process.env;


// token generator
const tokenGenerator = (userDetails) => {
    const accessToken = jwt.sign(userDetails, secretToken);
    return accessToken;
}

// User Token Authentication manager
const authenticateUserToken = (req, res, next) => {
    const authHeader = req.headers['x-cam_we_go'];
    const token = authHeader && authHeader.split(' ')[1]

    if (!token) return res.status(401).json({ error: 'No user token received' });

    jwt.verify(token, secretToken, (err, userDetails) => {
        if (err) return res.status(403).json('Token is no longer valid');
        req.user = { ...userDetails };
        next();
    })
}



module.exports = {
    tokenGenerator,
    authenticateUserToken
}