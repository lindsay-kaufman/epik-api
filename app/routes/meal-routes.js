const { pool } = require('./../../dbConfig')

const getUserMeals = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM meals WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user meals: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const getMealsByDay = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const created_at = parseInt(req.params.created_at)

  pool.query(
    'SELECT * FROM meals WHERE user_id = $1 AND created_at = $2',
    [user_id, created_at],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get user meals: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewMeal = (req, res) => {
  const { name, notes, user_id } = req.body

  pool.query(
    'INSERT INTO meals (name, notes, user_id) VALUES ($1, $2, $3) RETURNING *',
    [name, notes, user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot add meal: ${error}`)

      }
      res.status(201).json()
    }
  )
}

const updateMeal = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { name, notes } = req.body

  pool.query(
    'UPDATE meals SET name = $1, notes = $2 WHERE user_id = $3 and id = $4',
    [name, notes, user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot update meal: ${error}`)
      }
      res.status(200).json()
    }
  )
}

const deleteMeal = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM meals WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot delete meal: ${error}`)
      }
       res.json()
    }
  )
}

module.exports = {
  getUserMeals,
  getMealsByDay,
  addNewMeal,
  updateMeal,
  deleteMeal,
}
