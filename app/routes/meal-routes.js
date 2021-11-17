const { pool } = require('./../../dbConfig')

const getUserMeals = (req, res) => {
  const user_id = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM meals WHERE user_id = $1',
    [user_id],
    (error, results) => {
      if (error) {
        throw error
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
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

const addNewMeal = (req, res) => {
  const { name, notes, user_id } = req.body

  pool.query(
    'INSERT INTO meals (name, notes, user_id) VALUES ($1, $2, $3)',
    [name, notes, user_id],
    error => {
      if (error) {
        throw error
      }
      res.status(201).send('Meal added')
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
        throw error
      }
      res.status(200).send('Meal updated')
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
        throw error
      }
      res.json(200).send('Meal deleted')
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
