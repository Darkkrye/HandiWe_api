var mysql = require('mysql')
var bodyparser = require('body-parser')
var Sequelize = require('sequelize')
var ENDPOINT = require('../ENDPOINT.js')

var sequelize

if (process.env.NODE_ENV === "test") {
    sequelize = new Sequelize(ENDPOINT.dev, {
    	define: {
    		timestamps: false
    	},
        logging: false
    });
} else {
    sequelize = new Sequelize(ENDPOINT.endpoint, {
    	define: {
    		timestamps: false
    	},
        logging: false
    });
}

/* Déclaration Models */
var Accept = sequelize.import("../models/accept")
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

    // Sport
    api.get('/sports', function(req, res, next) {
        Sport.findAll().then(function(sports) {
            return res.status(200).send(sports)
        })
    })

    api.get('/sports/:id', function(req, res, next) {
        Sport.findOne({
            where: {
                idSPORT: req.params.id
            }
        }).then(function(sport) {
            if (sport != undefined && sport.idSPORT == req.params.id) {
                return res.status(200).send(sport)
            } else {
                return res.status(404).send("Sport not found")
            }
        })
    })

    api.get('/sports/name/:name', function(req, res, next) {
        Sport.findOne({
            where: {
                name: req.params.name
            }
        }).then(function(sport) {
            if (sport != undefined && sport.name == req.params.name) {
                return res.status(200).send(sport)
            } else {
                return res.status(404).send("Sport not found")
            }
        })
    })

    // Handicap
    api.get('/handicaps', function(req, res, next) {
        Handicap.findAll().then(function(handicaps) {
            return res.status(200).send(handicaps)
        })
    })

    api.get('/handicaps/:id', function(req, res, next) {
        Handicap.findOne({
            where: {
                idHANDICAP: req.params.id
            }
        }).then(function(handicap) {
            if (handicap != undefined && handicap.idHANDICAP == req.params.id) {
                return res.status(200).send(handicap)
            } else {
                return res.status(404).send("Handicap not found")
            }
        })
    })

    api.get('/handicaps/name/:name', function(req, res, next) {
        Handicap.findOne({
            where: {
                name: req.params.name
            }
        }).then(function(handicap) {
            if (handicap != undefined && handicap.name == req.params.name) {
                return res.status(200).send(handicap)
            } else {
                return res.status(404).send("Handicap not found")
            }
        })
    })

    // Liste utilisateurs par sport
    api.get("/users/by/sport", function(req, res, next) {
        Has_favorite.findAll().then(function(has_favorites) {
            if (has_favorites != undefined && has_favorites.length > 0) {
                return res.status(200).send(has_favorites)
            } else {
                return res.status(404).send("No Favorite found")
            }
        })
    })

    // Liste Organisation
    api.get("/organize/:idUser", function(req, res, next) {
        User.findOne({
            where: {
                idUSER: req.params.idUser
            }
        }).then(function(user) {
            if (user != undefined) {
                Organize.findAll({
                    where: {
                        idUSER: user.idUSER
                    }
                }).then(function(organizes) {
                    if (organizes != undefined && organizes.length > 0) {
                        return res.status(200).send(organizes)
                    } else {
                        return res.status(404).send("No content for this user")
                    }
                })
            } else {
                return res.status(404).send("User not found")
            }
        })
    })

    // Liste des conversation d'un user
    api.get("/conversations/:idUser", function(req, res, next) {
        User.findOne({
            where: {
                idUser: req.params.idUser
            }
        }).then(function(user){
            if (user != undefined) {
                Conversation.findAll({
                    where: {
                        idUSERA: user.idUSER
                    }
                }).then(function(conversations) {
                    if (conversations != undefined && conversations.length > 0) {
                        return res.status(200).send(conversations)
                    } else {
                        return res.status(404).send("No conversation for this user")
                    }
                })
            } else {
                return res.status(404).send("User not found")
            }
        })
    })

    // Liste des messages d'une conversation
    api.get('/messages/:idUserA/:idUserB', function(req, res, next) {
        Conversation.findOne({
            where: {
                idUSERA: req.params.idUserA,
                idUSERB: req.params.idUserB
            }
        }).then(function(conversation) {
            if (conversation != undefined) {
                Message.findAll({
                    where: {
                        idCONVERSATIONUSERA: conversation.idUSERA,
                        idCONVERSATIONUSERB: conversation.idUSERB
                    }
                }).then(function(messages) {
                    if (messages != undefined && messages.length > 0) {
                        return res.status(200).send(messages)
                    } else {
                        return res.status(404).send("No message for this conversation")
                    }
                })
            } else {
                return res.status(404).send("Conversation Not Found")
            }
        })
    })

    // HAS_HOURS
    api.get("/hours/from/:idAvailability", function(req, res, next) {
        HAS_HOURS.findAll({
            where: {
                idAVAILABILITY: req.params.idAvailability
            }
        }).then(function(has_hours) {
            if (has_hours != undefined && has_hours.length > 0) {
                return res.status(200).send(has_hours)
            } else {
                return res.status(404).send("No hours found for this Availability")
            }
        })
    })

    api.get("/hours/:idHour", function(req, res, next) {
        Hour.findAll({
            where: {
                idHOUR: req.params.idHour
            }
        }).then(function(hour) {
            if (hour != undefined) {
                return res.status(200).send(hour)
            } else {
                return res.status(404).send("No Hour found for this ID")
            }
        })
    })
}
