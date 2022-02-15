const { pool } = require('./../../dbConfig')

const getUserActivities = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM activity WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user activities: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const getUserActivityById = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'SELECT * FROM activity WHERE user_id = $1 AND id = $2',
    [user_id, id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user activities: ${error}`)
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
        throw new Error(`Cannot add activity: ${error}`)
      }
      res.status(201).json()
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
        throw new Error(`Cannot update activity: ${error}`)
      }
      res.status(200).json()
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
        throw new Error(`Cannot delete activity: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  getUserActivities,
  getUserActivityById,
  addNewActivity,
  updateActivity,
  deleteActivity
}