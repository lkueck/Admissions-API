var Promise = require('bluebird')
var Model = require('../lib/create-model.js')
var db = require('../lib/db.js')
var util = require('util')

var Interviewer = module.exports;

Interviewer.check = function(req, res){
  client.query('SELECT interviewer_id FROM interviewer WHERE full_name = ($1)', [req.interviewer_name], function(err, response){
    if(err){
      Interviewer.create(req, res);
    } else {

    }
  })
}

Interviewer.create = function(req, res) {
  client.query('INSERT INTO interviewer (full_name) VALUES ($1)', [req.interviewer_name], function(err, response){
    if(err){
      res.status(401).send()
    } else {
      res.status(201).send()
    }
  })
}