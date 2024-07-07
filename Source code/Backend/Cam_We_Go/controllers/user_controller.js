const bcrypt = require('bcrypt');
const User = require('../models/user_model');
const AuthenticateUser = require('../Authentication/Authenticate');


// logging user into the app (Authorisation && Authentication)
const login_user = async (req, res) => {

    const { userEmail: email, userPassword: password } = req.body;

    // Authentication
    try {
        const getUser = await User.findOne({ userEmail: email });

        if (!getUser) {
            return res.status(400).json({ error: 'User has no account' });
        }

        if (!await bcrypt.compare(password, getUser.userPassword)) {
            return res.status(400).json({ error: 'Incorrect Password' })
        }

        // Authorization
        const token = AuthenticateUser.tokenGenerator({ email, sub: getUser._id });
        res.setHeader('x-cam_we_go', 'BEARER ' + token)
        const { userEmail, userNumber, userName, userPassword, roadSignPreferences, roadStatePreferences, _id: id } = getUser;
        res.json({ user: { userEmail, userNumber, userName, userPassword, roadSignPreferences, roadStatePreferences, id } });
    } catch {
        res.status(500).json({ error: 'Server could not process password' });
    };

}


// Create a new user
const create_user = async (req, res) => {
    try {
        const userExist = await User.findOne({ userEmail: req.body.userEmail });

        if (userExist) {
            return res.status(400).json({ error: 'email account already used' });
        }


        const hashedPassword = await bcrypt.hash(req.body.userPassword, 10);

        const newUser = new User({
            userName: req.body.userName,
            userEmail: req.body.userEmail,
            userNumber: req.body.userNumber,
            userPassword: hashedPassword,
            roadSignPreferences: req.body.roadSignPreferences,
            roadStatePreferences: req.body.roadStatePreferences
        });

        newUser.save()
            .then(savedUser => {
                // Authorization
                const token = AuthenticateUser.tokenGenerator({ userEmail: req.body.userEmail, sub: savedUser._id });
                res.setHeader('x-cam_we_go', 'BEARER ' + token);
                const { userEmail, userNumber, userName, userPassword, roadSignPreferences, roadStatePreferences, _id: id } = savedUser;
                const userData = { user: { userEmail, userNumber, userName, userPassword, roadSignPreferences, roadStatePreferences, id } };
                res.status(201).json(userData);
            })
            .catch(err => {
                res.status(500).json({ message: 'Internal server error' });
            });
    } catch {
        res.status(500).json('Internal server error');
    }

}

// Update single user
const update_user = (req, res) => {
    const userId = req.user.sub;
    const updateUser = {
        userName: req.body.userName,
        userEmail: req.body.userEmail,
        userNumber: req.body.userNumber,
        userPassword: req.body.userPassword,
        roadSignPreferences: req.body.roadSignPreferences,
        roadStatePreferences: req.body.roadStatePreferences
    };

    User.findByIdAndUpdate(userId, updateUser, { new: true })
        .then(updatedUser => {
            if (updatedUser == null) {
                return res.status(404).json({ message: 'User not found' });
            }
            res.json(updatedUser);
        })
        .catch(err => {
            console.error('Error updating user:', err);
            res.status(500).json({ message: 'Internal server error' });
        });
};


// Find single user by ID
const find_user = (req, res) => {
    const userId = req.params.userId;

    User.findById(userId)
        .then(user => {
            if (!user) {
                return res.status(404).json({ message: 'User not found' });
            }
            res.json(user);
        })
        .catch(err => {
            console.error('Error finding user:', err);
            res.status(500).json({ message: 'Internal server error' });
        });
};

// Delete single user
const delete_user = (req, res) => {
    const userId = req.user.sub;
    User.findByIdAndDelete(userId)
        .then(deletedUser => {
            if (!deletedUser) {
                return res.status(404).json({ message: 'User not found' });
            }
            res.status(200).json(deletedUser);
        })
        .catch(err => {
            console.error('Error deleting user:', err);
            res.status(500).json({ message: 'Internal server error' });
        });
};

// get all users
const all_users = (req, res) => {
    User.find()
        .then(users => {
            res.status(200).json(users);
        })
        .catch(err => {
            console.error('Error fetching all users:', err);
            res.status(500).json({ message: 'Internal server error' });
        });
};



module.exports = {
    login_user,
    create_user,
    find_user,
    update_user,
    delete_user,
    all_users
};
