var express = require('express')
var bodyparser = require('body-parser')
var api = express()

api.use(bodyparser.json()); // support json encoded bodies
api.use(bodyparser.urlencoded({ extended: true })); // support encoded bodies

// Configuration
var DEFAULT_PORT = 3000

/* [GET] Routes */
// require('./routes/getRoutes')(api);
/* [POST] Routes */
// require('./routes/postRoutes')(api);
/* [PUT] Routes */
// require('./routes/putRoutes')(api);
/* [DELETE] Routes */
// require('./routes/deleteRoutes')(api);



var port = process.env.PORT || DEFAULT_PORT
console.log('API listening on port ' + port)
api.listen(port)

module.exports = api
