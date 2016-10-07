var mysql = require('mysql')
var bodyparser = require('body-parser')
var Sequelize = require('sequelize')
var ENDPOINT = require('../ENDPOINT.js')

var sequelize

process.env.NODE_ENV = "test"

if (process.env.NODE_ENV === "test") {
    console.log(ENDPOINT.dev)

    sequelize = new Sequelize(ENDPOINT.dev, {
    	define: {
    		timestamps: false
    	},
        logging: false
    });
} else {
    console.log(ENDPOINT.endpoint)

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
}
