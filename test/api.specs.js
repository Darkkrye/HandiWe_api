process.env.NODE_ENV = "test"

var request = require('supertest')
var api = require('../index.js')

describe('Hello World', function() {
    it('should return Hello World', function() {
        return request(api)
            .get('/hello')
            .send()
            .expect("Hello World")
    })
})

describe("PLACES", function() {
    it("/places - should return list of places", function() {
        return request(api)
            .get("/places")
            .send()
            .expect(200)
            .expect(Array)
    })

    it("/places/:id - should return the place", function() {
        return request(api)
            .get("/places/4")
            .send()
            .expect(200)
    })

    it("/places/:id - should return 404 Not Found", function() {
        return request(api)
            .get("/places/1")
            .send()
            .expect(404)
            .expect("Place not found")
    })

    it("/places/name/:name - should return the place", function() {
        return request(api)
            .get("/places/name/CLINIQUE MEDICO-CHIRURGICALE")
            .send()
            .expect(200)
    })

    it("/places/name/:name - should return 404 Not found", function() {
        return request(api)
            .get("/places/name/Test")
            .send()
            .expect(404)
            .expect("Place not found")
    })
})

describe("CHALLENGE :", function() {
    it("/cars - should return list of cars", function() {
        return request(api)
            .get('/cars')
            .send()
            .expect(200)
            .expect(Array)
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
