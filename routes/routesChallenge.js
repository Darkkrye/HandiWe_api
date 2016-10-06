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
    	},
        logging: false
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
var Cars = sequelize.import("../models/cars")

module.exports = function(api){
    api.get("/cars", function(req, res, next) {
        Cars.findAll({
            where: {
                isReserved: false
            }
        }).then(function(cars) {
            if (cars.length > 0) {
                return res.status(200).send(cars)
            } else {
                return res.status(404).send("No cars found")
            }
        })
    })

    api.put("/cars/reserve/:id", function(req, res, next) {
        Cars.findOne({
            idCARS: req.params.id,
            isReserved: false
        }).then(function(car) {
            if (car != undefined && car.idCARS == req.params.id) {
                car.update({
                    isReserved: true
                }).then(function() {
                    return res.status(200).send("Car reserved !")
                })
            } else {
                return res.status(404).send("No car found for this id. Or maybe is already reserved")
            }
        })
    })

    api.put("/cars/unreserve/:id", function(req, res, next) {
        Cars.findOne({
            idCARS: req.params.id,
            isReserved: true
        }).then(function(car) {
            if (car != undefined && car.idCARS == req.params.id) {
                car.update({
                    isReserved: false
                }).then(function() {
                    return res.status(200).send("Car unreserved !")
                })
            } else {
                return res.status(404).send("No car found for this id. Or maybe not reserved")
            }
        })
    })
}
