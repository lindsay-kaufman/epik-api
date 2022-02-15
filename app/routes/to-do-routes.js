const { pool } = require('./../../dbConfig')

const getToDoList = (req, res) => {
  const user = parseInt(req.params.user_id)

  pool.query(
    'SELECT * FROM to_do WHERE user_id = $1',
    [user],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get list: ${error}`)
      }
      res.status(200).json(results.rows)
    }
  )
}

const addListItem = (req, res) => {
  const { name, completed, user_id } = req.body

  pool.query(
    'INSERT INTO to_do (name, completed, user_id) VALUES ($1, $2, $3)',
    [name, completed, user_id],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot add list item: ${error}`)
      }
      res.status(201).json()
    }
  )
}

const updateListItem = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  const { name, completed } = req.body

  pool.query(
    'UPDATE to_do SET name = $1, completed = $2 WHERE user_id = $3 and id = $4',
    [name, completed, user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot update list item: ${error}`)
      }
      res.status(200).json()
    }
  )
}

const deleteListItem = (req, res) => {
  const user_id = parseInt(req.params.user_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM to_do WHERE user_id = $1 AND id = $2',
    [user_id, id],
    error => {
      if (error) {
        throw new Error(`Cannot delete list item: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  getToDoList,
  addListItem,
  updateListItem,
  deleteListItem,
}
