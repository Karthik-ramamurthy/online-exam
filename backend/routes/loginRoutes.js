const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const express = require('express'),  
router = express.Router(),
mysql = require('mysql');
require('dotenv').config();

db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

router.post('/login', function(req, res) {
  const { username, password } = req.body;

  const sql = `select * from teacher where username='${username}' and password='${password}'`;
  
  db.query(sql, (err, data, fields) => {
    if (err) throw err;

    console.log(data);
    const { username, email, fname, lname, teacher_id } = JSON.parse(JSON.stringify(data))[0];
    const accessToken = jwt.sign({ username, email, firstName: fname, lastName: lname, teacher_id }, process.env.ACCESS_TOKEN_SECRET);

    res.json({
      status: 200,
      accessToken,
    });
  });
});

module.exports = router;