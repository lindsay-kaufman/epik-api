const { pool } = require('./../../dbConfig')

// find goals whose start date + interval = date
// interval will be passed as the array index id
// select cast(date_trunc('month', current_date) as date)

// goal occurances contain an id, created date and corresponding goal id
// the idea is to count the number of goal occurances in the goals table (represented as occurances in goal table)
// then if the number of occurances matches the target occurance from the goal table, the goal is complete


const getGoalOccurances = (req, res) => {
  const goal = parseInt(req.params.goal_id)

  pool.query(
    'SELECT * FROM goal_occurances WHERE goal_id = $1',
    [goal],
    (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows)
    }
  )
}

const addGoalOccurance = (req, res) => {
  const {created_at} = req.body

  pool.query(
    'INSERT INTO goal_occurances (created_at) VALUES ($1)',
    [created_at],
    error => {
      if (error) {
        throw error
      }
      res.status(201).send('Occurance added')
    }
  )
}

const deleteGoalOccurance = (req, res) => {
  const goal_id = parseInt(req.params.goal_id)
  const id = parseInt(req.params.id)

  pool.query(
    'DELETE FROM goal_occurances WHERE goal_id = $1 and id = $2',
    [goal_id, id],
    error => {
      if (error) {
        throw error
      }
      res.status(200).send('Occurances deleted')
    }
  )
}

module.exports = {
  getGoalOccurances,
  addGoalOccurance,
  deleteGoalOccurance
}