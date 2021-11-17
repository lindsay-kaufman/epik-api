const LocalStrategy = require('passport-local').Strategy
const { pool } = require('./dbConfig')
const bcrypt = require('bcrypt')

const initialise = passport => {
  const authenticateUser = (email, password, done) => {
    pool.query(
      'SELECT * FROM users WHERE email = $1',
      [email],
      (error, results) => {
        if (error) {
          throw error
        } else {
          if (resutls.rows.length > 0) {
            const user = results.rows[0]

            bcrypt.compare(password, user.password, (err, isMatch) => {
              if (err) {
                throw new Error('no hashed password')
              } else if (isMatch) {
                return done(null, user)
              } else {
                return done(null, false)
              }
            })
          }
        }
      }
    )
  }

  passport.use(
    new LocalStrategy(
      {
        email: 'email',
        password: 'password',
      },
      authenticateUser
    )
  )

  //stores user in cookie
  passport.serializeUser((user, done) => {
    done(null, user.id)
  })

  passport.deserializeUser((id, done) => {
    pool.query(
      'SELECT * FROM users WHERE id = $1', [id], (err, results) => {
        if (err) {
          throw err
        } else {
          return done(null, results.rows[0])
        }
      }
    )
  })
}

module.exports = { initialise }