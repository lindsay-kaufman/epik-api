const { pool } = require('./../../dbConfig')

const getUserGoals = (req, res) => {
  const user = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM goals WHERE user_id = $1',
    [user],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user goals: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const getUserGoalById = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'SELECT * FROM goals WHERE user_id = $1 AND id = $2',
    [user_id, id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get goal: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewGoal = (req, res) => {
  const {
    title,
    description,
    completed,
    duration,
    target_occurances,
    occurances,
    user_id,
  } = req.body

  pool.query(
    `INSERT INTO goals (title, description, completed, duration, target_occurances, occurances, user_id) VALUES ($1, $2, $3, $4, $5, $6, $7)`,
    [
      title,
      description,
      completed,
      duration,
      target_occurances,
      occurances,
      user_id,
    ],
    error => {
      if (error) {
        throw new Error(`Cannot add goal: ${error}`)
      }
      res.status(201).json()
    }
  )
}

const updateGoal = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const {
    title,
    description,
    completed,
    start_date,
    updated_at,
    duration,
    target_occurances,
    occurances,
  } = req.body

  pool.query(
    'UPDATE goals SET title = $1, description = $2, completed = $3, start_date = $4, updated_at = $5, duration = $6, occurances = $7, target_occurances = $8 WHERE user_id = $9 AND id = $10',
    [
      title,
      description,
      completed,
      start_date,
      updated_at,
      duration,
      occurances,
      target_occurances,
      user_id,
      id,
    ],
    error => {
      if (error) {
        throw new Error(`Cannot update goal: ${error}`)
      }
      res.status(200).json()
    }
  )
}

const deleteGoal = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM goals WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot delete goal: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  addNewGoal,
  getUserGoals,
  getUserGoalById,
  updateGoal,
  deleteGoal,
}
