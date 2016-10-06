process.env.NODE_ENV = "test"

var request = require('supertest')
var api = require('../index.js')
var Sequelize = require('sequelize')
var ENDPOINT = require('../ENDPOINT.js')

describe('Hello World', function() {
    it('should return Hello World', function() {
        return request(api)
            .get('/hello')
            .send()
            .expect("Hello World")
    })

    it('should fail to return Hello World', function() {
        return request(api)
            .get('/hello')
            .send()
            .expect("Hello, World !")
    })
})
