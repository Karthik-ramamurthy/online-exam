const express = require('express'),  
router = express.Router(),
authenticateJWT = require('./../middleware/authorization'),
mysql = require('mysql');
require('dotenv').config();

db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

router.get('/list', authenticateJWT, (req, res) => {
  const sql = `select name, duration, status, test_id from test where created_by = ${req.user.teacher_id};`;
  
  db.query(sql, (err, data, fields) => {
    if (err) throw err;

    res.json({
      status: 200,
      test: data,
    })
  });
});

router.post('/create', authenticateJWT, (req, res) => {
  const { name, duration } = req.body;

  const sql = `INSERT INTO test (name,duration,created_by) VALUES ('${name}', '${duration}', ${req.user.teacher_id});`;
  
  db.query(sql, (err, data, fields) => {
    if (err) throw err;

    const { insertId } = JSON.parse(JSON.stringify(data));

    res.json({
      status: 200,
      testId: insertId,
    });
  });
});

router.post('/:id/create', authenticateJWT, (req, res) => {
  const testId = req.params.id,
  { question } = req.body,
  { text, options } = question;

  const insertQuestionSQL = `insert into question (text) values ('${text}')`;
  const insertOptionSQL = `insert into options (question_id, text, is_answer) values ?`;

  db.query(insertQuestionSQL, (err, data) => {
    if (err) throw err;

    const { insertId } = JSON.parse(JSON.stringify(data));
    
    db.query(insertOptionSQL, [options.map(({optionText, isAnswer}) => [insertId, optionText, isAnswer ])], (err, data) => {
      console.log('error', err);

      res.json({
        status: 200,
        data,
      });
    });

    const insertQuestionTestSQL = `insert into test_question (question_id, test_id) values (${insertId}, ${testId})`;
    db.query(insertQuestionTestSQL, (err, data) => {
      if (err) throw err;
    });
  })
});

router.get('/:id', authenticateJWT, (req, res) => {
  const testId = req.params.id;

  const insertQuestionSQL = `select question.text as 'question', question.question_id, options.text as 'option', options.is_answer from question inner join 
    options on question.question_id = options.question_id inner join test_question on test_question.question_id 
    = question.question_id where test_question.test_id = '${testId}'`;

  db.query(insertQuestionSQL, (err, data) => {
    if (err) throw err;

    const questions = JSON.parse(JSON.stringify(data)),
    questionId = questions.map(({question_id}) => question_id)
                  .filter((x, i, a) => a.indexOf(x) == i),
    result = [];
    
    questions.forEach(({question, question_id, option, is_answer}) => {
      if(!result[questionId.indexOf(question_id)]){
        const questionArray = {};
        questionArray.text = question;
        questionArray.options = [];
        questionArray.options.push({ optionText: option, isAnswer: is_answer, questionId: question_id });
        result[questionId.indexOf(question_id)] = questionArray;
      } else {
        result[questionId.indexOf(question_id)].options.push({ optionText: option, isAnswer: is_answer});
      }
    });

    res.json({
      status: 200,
      question: result,
    });
  });
});

router.post('/:id/publish', authenticateJWT, (req, res) => {
  const testId = req.params.id;

  const updateQuery = `update test set status = 'publish' where test_id = '${testId}'`;

  db.query(updateQuery, (err, data) => {
    if(err) throw err;

    const { changedRows } = JSON.parse(JSON.stringify(data));

    if (changedRows > 0) {
      res.json({
        status: 200,
        data: 'published'
      });
    } else {
      res.json({
        status: 200,
        data: 'test Id not valid'
      });
    }
  });
});

module.exports = router;