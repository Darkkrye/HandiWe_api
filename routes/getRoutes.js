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
var Test = sequelize.import("../models/test")

module.exports = function(api){
    api.get('/hello', function(req, res, next) {
        Test.findAll().then(function(testes) {
            var test = testes[0]

            return res.status(200).send(test.test)
        })
    	return res.status(404)
    })
}
