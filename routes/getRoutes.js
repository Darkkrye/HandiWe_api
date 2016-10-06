var mysql = require('mysql')
var bodyparser = require('body-parser')
var Sequelize = require('sequelize')
var ENDPOINT = require('../ENDPOINT.js')

var sequelize

if (process.env.NODE_ENV === "test") {
    console.log(ENDPOINT.dev)

    sequelize = new Sequelize(ENDPOINT.dev, {
    	define: {
    		timestamps: false
    	}
    });
} else {
    console.log(ENDPOINT.endpoint)

    sequelize = new Sequelize(ENDPOINT.endpoint, {
    	define: {
    		timestamps: false
    	}
    });
}

/* Déclaration Models */
var Availability = sequelize.import("../models/availability")
var Conversation = sequelize.import("../models/conversation")
var Correspond = sequelize.import("../models/correspond")
var Handicap = sequelize.import("../models/handicap")
var Has_favorite = sequelize.import("../models/has_favorite")
var Has_handicap = sequelize.import("../models/has_handicap")
var Has_hours = sequelize.import("../models/has_hours")
var hour = sequelize.import("../models/hour")
var Is_interested_by = sequelize.import("../models/is_interested_by")
var Licence = sequelize.import("../models/licence")
var Message = sequelize.import("../models/message")
var Organize = sequelize.import("../models/organize")
var Place = sequelize.import("../models/place")
var Sport = sequelize.import("../models/sport")
var User = sequelize.import("../models/user")

module.exports = function(api){
    api.get('/hello', function(req, res, next) {
        if (process.env.NODE_ENV === "test") {
            return res.status(200).send("Hello World")
        } else {
            return res.status(200).send("Hello, World !")
        }
    })

    // USER
    api.get('/users', function(req, res, next) {
        User.findAll().then(function(users) {
            return res.status(200).send(users)
        })
    })

    api.get('/users/:id', function(req, res, next) {
        User.findOne({
            where: {
                idUSER: req.params.id
            }
        }).then(function(user) {
            if (user != undefined && user.idUSER == req.params.id) {
                return res.status(200).send(user)
            } else {
                return res.status(404).send("User not found")
            }
        })
    })

    api.get('/users/mail/:mail/:password', function(req, res, next) {
        User.findOne({
            where: {
                mail: req.params.mail,
                pass_word: req.params.password
            }
        }).then(function(user) {
            if (user != undefined && user.mail == req.params.mail && user.pass_word == req.params.password) {
                return res.status(200).send(user)
            } else {
                return res.status(404).send("User not found")
            }
        })
    })

    // Place
    api.get('/places', function(req, res, next) {
        Place.findAll().then(function(places) {
            return res.status(200).send(places)
        })
    })

    api.get('/places/:id', function(req, res, next) {
        Place.findOne({
            where: {
                idPLACE: req.params.id
            }
        }).then(function(place) {
            if (place != undefined && place.idPLACE == req.params.id) {
                return res.status(200).send(place)
            } else {
                return res.status(404).send("Place not found")
            }
        })
    })

    api.get('/places/name/:name', function(req, res, next) {
        Place.findOne({
            where: {
                name: req.params.name
            }
        }).then(function(place) {
            if (place != undefined && place.name == req.params.name) {
                return res.status(200).send(place)
            } else {
                return res.status(404).send("Place not found")
            }
        })
    })

}
