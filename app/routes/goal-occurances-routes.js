const { pool } = require('./../../dbConfig')

// goal occurances contain an id, created_at and corresponding goal id
// the idea is to count the number of goal occurances in the goals table (represented as occurances in goal table)
// then if the number of occurances matches the target occurance from the goal table, the goal is complete

/*
To add a new goal:
 - connect the dates of the current week to the table columns
 - connect the goal id to the table rows
 - post the goal occurance object with the goal id and created_at date
 - need to figure out how to capture the actual space in the UI table and connect it to the goal occurance
 - need to figure out how to fill in existing goals by the week in the UI table

For duration: 
 - find goals whose start date + interval = date
 - interval will be passed as the array index id
 - select cast(date_trunc('month', current_date) as date)
*/

const getGoalOccurances = (req, res) => {
  const goal = parseInt(req.params.goal_id)

  pool.query(
    'SELECT * FROM goal_occurances WHERE goal_id = $1',
    [goal],
    (error, results) => {
      if (error) {
        throw new Error(`Cannot get goal occurances: ${error}`)
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
        throw new Error(`Cannot add goal occurance: ${error}`)
      }
      res.status(201).json()
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
        throw new Error(`Cannot delete goal: ${error}`)
      }
      res.json()
    }
  )
}

module.exports = {
  getGoalOccurances,
  addGoalOccurance,
  deleteGoalOccurance
}