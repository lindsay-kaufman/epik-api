const { pool } = require('./../../dbConfig')
const bcrypt = require('bcrypt')

/*
- Figure out hashedPassword problem
- Get sign in working
- Do I want to make update fields optional on the FE or BE
*/
const register = async (req, res) => {
  const { firstName, lastName, email, password } = req.body
  let errors = []

  if (!firstName || !lastName || !email || !password) {
    errors.push({ message: 'Please enter all fields' })
  }

  if (password.length < 6) {
    errors.push({ message: 'Password must be at least 6 characters' })
  }

  // using hashedPassword results in an error on line 40
  const hashedPassword = await bcrypt.hash(password, 10)
  

  pool.query(
    `SELECT * FROM users WHERE email = $1`,
    [email],
    (err, results) => {
      if (err) {
        throw new Error('No user found')
      }

      if (results.rows.length > 0) {
        errors.push({ message: 'Email already registered' })
      } else {
        pool.query(
          'INSERT INTO users (firstName, lastName, email, password) VALUES ($1, $2, $3, $4)',
          [firstName, lastName, email, hashedPassword],
          (error) => {
            if (error) {
              throw new Error(`Cannot register user: ${error}`)

            }
            res.status(201).json()
          }
        )
      }
    }
  )
}

// does not work yet
const signIn = (req, res) => {
  const password = req.body.password
  let user

  pool
    .query('SELECT FROM users WHERE email = $1', [email], (error, results) => {
      //add bad credentials error later
      if (error) {
        throw error
      } else if (!results) {
        throw new Error('No user found')
      }

      user = results
      return bcrypt.compare(password, user.password)
    })
    .then(hashedPassword => {
      if (hashedPassword) {
        const token = crypto.randomBytes(16).toString('hex')
        user.token = token // might need to add token to user table
        return user.save()
      } else {
        throw new Error('Cannot sign in')
      }
    })
    .then(user => {
      res.status(201).json({ user: user.toObject() })
    })
}

const updateUser = (req, res) => {
  const id = parseInt(req.params.id)
  const { firstName, lastName, email, password } = req.body

  pool.query(
    'UPDATE users SET firstName = $1, lastName = $2, email = $3, password = $4 WHERE id = $5',
    [firstName, lastName, email, password, id],
    error => {
      if (error) {
        throw new Error(`Cannot update user: ${error}`)

      }
      res.status(200).json()
    }
  )
}

const deleteUser = (req, res) => {
  const id = parseInt(req.params.id)

  pool.query('DELETE FROM users WHERE id = $1', [id], error => {
    if (error) {
      throw new Error('Cannot delete user')
    }
    res.json()
  })
}

module.exports = {
  register,
  signIn,
  updateUser,
  deleteUser,
}
