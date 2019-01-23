var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'My First Jenkins AWS EC2...', subTitle: 'Mani' });
});

module.exports = router;
