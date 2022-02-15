const { pool } = require('./../../dbConfig')

const getUserSleep = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM sleep WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user sleep: ${error}`)

      }
      res.status(200).json(results.rows)
    }
  )
}

const getSleepByDay = (req, res) => {
  const user_id = parstInt(req.params.user_id)
  const created_at = parseInt(req.params.created_at)

  pool.query(
    'SELECT * FROM sleep WHERE user_id = $1 AND created_at = $2',
    [user_id, created_at],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user sleep: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewSleepRecord = (req, res) => {
  const { hours, quality, dreams, user_id } = req.body

  pool.query(
    'INSERT INTO sleep (hours, quality, dreams, user_id) VALUES ($1, $2, $3, $4)',
    [hours, quality, dreams, user_id],
    error => {
      if (error) {
        throw new Error(`Cannot add user sleep: ${error}`)
      }
      res.status(201).json()
    }
  )
}

const updateSleepRecord = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { hours, quality, dreams } = req.body

  pool.query(
    'UPDATE sleep SET hours = $1, quality = $2, dreams = $3 WHERE user_id = $4 and id = $5',
    [hours, quality, dreams, user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot update user sleep: ${error}`)
      }
      res.status(200).json()
    }
  )
}

const deleteSleepRecord = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM sleep WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot delete user sleep: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  getSleepByDay,
  getUserSleep,
  addNewSleepRecord,
  updateSleepRecord,
  deleteSleepRecord
}