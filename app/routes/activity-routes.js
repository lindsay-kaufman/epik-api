const { pool } = require('./../../dbConfig')
const moment = require('moment')

const getUserActivitiesByDay = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const created_at = parseInt(req.params.created_at)

  const createdAt = pm.environment.set(created_at, moment().format(("YYYY-MM-DD")));

  pool.query(
    'SELECT * FROM activity WHERE user_id = $1 AND createdAt = $2',
    [user_id, createdAt],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

// might not need this
const getUserActivityById = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'SELECT * FROM activity WHERE user_id = $1 AND id = $2',
    [user_id, id],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewActivity = (req, res) => {
  const { description, user_id } = req.body

  pool.query(
    'INSERT INTO activity (description, user_id) VALUES ($1, $2)',
    [description, user_id],
    error => {
      if (error) {
        throw error
      }
      res.status(201).send('New activity added!')
    }
  )
}

const updateActivity = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { description } = req.body

  pool.query(
    'UPDATE activity SET description = $1 WHERE user_id = $2 AND id = $3',
    [description, user_id, id],
    error => {
      if (error) {
        throw error
      }
      res.status(200).send('Activity modified')
    }
  )
}

const deleteActivity = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM activity WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw error
      }
      res.status(200).send('Activity deleted')
    }
  )
}

module.exports = {
  getUserActivitiesByDay,
  getUserActivityById,
  addNewActivity,
  updateActivity,
  deleteActivity
}