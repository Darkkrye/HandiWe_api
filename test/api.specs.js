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
})

describe("CHALLENGE :", function() {
    it("/cars - should return list of cars", function() {
        return request(api)
            .get('/cars')
            .send()
            .expect(200)
    })

    it("/cars/reserve/123456 - should return 404 not found error", function() {
        return request(api)
            .put('/cars/reserve/123456')
            .send()
            .expect(404)
            .expect("No car found for this id. Or maybe is already reserved")
    })

    it("/cars/reserve/4 - should update car and return 200 Ok", function() {
        return request(api)
            .put('/cars/reserve/4')
            .send()
            .expect(200)
    })

    it("/cars/unreserve/4 - should reupdate car and return 200 Ok", function() {
        return request(api)
            .put('/cars/unreserve/4')
            .send()
            .expect(200)
    })
})
