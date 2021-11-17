const Pool = require('pg').Pool
const pool = new Pool({
  user: 'lindsaykaufman',
  host: 'localhost',
  database: 'calendar',
  password: '3139Lakeshore',
  port: 5432,
})

//for testing
const getMoodByUser = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM mood WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

const getMoodByDay = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const created_at = parseInt(req.params.created_at)

  pool.query(
    'SELECT * FROM mood WHERE user_id = $1 AND created_at = $2',
    [user_id, created_at],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewMoodLog = (req, res) => {
  const { notes, user_id } = req.body

  pool.query(
    'INSERT INTO mood (notes, user_id) VALUES ($1, $2)',
    [notes, user_id],
    error => {
      if (error) {
        throw error
      }
      res.status(201).send('Mood logged')
    }
  )
}

const updateMoodLog = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { notes } = req.body

  pool.query(
    'UPDATE mood SET notes = $1 WHERE user_id = $2 AND id = $3',
    [notes, user_id, id],
    error => {
      if (error) {
        throw error
      }
      res.status(200).send('Mood updated')
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
        throw error
      }
      res.status(200).send('Mood deleted')
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
