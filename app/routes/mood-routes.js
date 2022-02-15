const { pool } = require('./../../dbConfig')

//for testing
const getMoodByUser = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM mood WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user mood: ${error}`)

      }
      res.status(200).json(results.rows)
    }
  )
}

const getMoodByDay = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const createdAt = parseInt(req.params.created_at)

  const created_at = pm.environment.set(createdAt, moment().format(("YYYY-MM-DD")));

  pool.query(
    'SELECT * FROM mood WHERE user_id = $1 AND created_at = $2',
    [user_id, created_at],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user mood: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewMoodLog = (req, res) => {
  const { notes, score, user_id } = req.body

  pool.query(
    'INSERT INTO mood (notes, score, user_id) VALUES ($1, $2, $3)',
    [notes, score, user_id],
    error => {
      if (error) {
        throw new Error(`Cannot add mood: ${error}`)

      }
      res.status(201).json()
    }
  )
}

const updateMoodLog = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { notes, score } = req.body

  pool.query(
    'UPDATE mood SET notes = $1, score = $2 WHERE user_id = $3 AND id = $4',
    [notes, score, user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot update mood: ${error}`)
      }
      res.status(200).json()
    }
  )
}

const deleteMoodLog = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM mood WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot delete mood: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  getMoodByUser,
  getMoodByDay,
  addNewMoodLog,
  updateMoodLog,
  deleteMoodLog,
}
