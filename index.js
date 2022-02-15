const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = process.env.PORT || 3000
const session = require('express-session')
const passport = require('passport')

/* TODO:
 * deploy to heroku
 * error handling and input sanitation
 * normalize responses
 * update access control origin header
 */

app.use(bodyParser.json())

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.use(
  session({
    secret: 'secret',
    resave: false,
    saveUninitialized: false,
  })
)

// initializes authentication
app.use(passport.initialize())

// turns the user value (session id) into a deserialized user object
app.use(passport.session())

app.use(function (req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*')
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type')
  res.setHeader('Access-Control-Allow-Credentials', true)
  next()
})

app.get('/', res => {
  res.json({ info: 'Node.js, Express, and Postgres API' })
})

const authRoutes = require('./app/routes/auth-routes')
const toDoRoutes = require('./app/routes/to-do-routes')
const goalRoutes = require('./app/routes/goal-routes')
//const occuranceRoutes = require('./app/routes/goal-occurances-routes')
const activityRoutes = require('./app/routes/activity-routes')
const moodRoutes = require('./app/routes/mood-routes')
const mealRoutes = require('./app/routes/meal-routes')
const sleepRoutes = require('./app/routes/sleep-routes')

app.put('/users/:id', authRoutes.updateUser)
app.delete('/users/:id', authRoutes.deleteUser)
app.post('/users', authRoutes.register) //needs hashed pw
app.post('/users', authRoutes.signIn) //not working

app.get('/todo/:user_id', toDoRoutes.getToDoList)
app.post('/todo', toDoRoutes.addListItem)
app.put('/todo/:user_id/:id', toDoRoutes.updateListItem)
app.delete('/todo/:user_id/:id', toDoRoutes.deleteListItem)

app.post('/goals', goalRoutes.addNewGoal)
app.get('/goals/:user_id', goalRoutes.getUserGoals)
app.get('/goals/:user_id/:id', goalRoutes.getUserGoalById)
app.put('/goals/:user_id/:id', goalRoutes.updateGoal)
app.delete('goals/:user_id/:id', goalRoutes.deleteGoal)

// app.get('/occurances', occuranceRoutes.getGoalOccurances)
// app.post('/occurances/:goal_id', occuranceRoutes.addGoalOccurance)
// app.delete('/occurances/:goal_id/:id', occuranceRoutes.deleteGoalOccurance)

app.get('/activity/:user_id/:id', activityRoutes.getUserActivityById)
app.get('/activity/:user_id', activityRoutes.getUserActivities)
app.post('/activity', activityRoutes.addNewActivity)
app.put('/activity/:user_id/:id', activityRoutes.updateActivity)
app.delete('/activity/:user_id/:id', activityRoutes.deleteActivity)

app.get('/mood/:user_id', moodRoutes.getMoodByUser)
app.get('/mood/:user_id/:created_at', moodRoutes.getMoodByDay)
app.post('/mood', moodRoutes.addNewMoodLog)
app.put('/mood/:user_id/:id', moodRoutes.updateMoodLog)
app.delete('/mood/:user_id/:id', moodRoutes.deleteMoodLog)

app.get('/meals/:user_id', mealRoutes.getUserMeals)
app.post('/meals', mealRoutes.addNewMeal)
app.put('/meals/:user_id/:id', mealRoutes.updateMeal)
app.delete('/meals/:user_id/:id', mealRoutes.deleteMeal)

app.get('/sleep/:user_id', sleepRoutes.getUserSleep)
app.post('/sleep', sleepRoutes.addNewSleepRecord)
app.put('/sleep/:user_id/:id', sleepRoutes.updateSleepRecord)
app.delete('/sleep/:user_id/:id', sleepRoutes.deleteSleepRecord)

app.listen(port, () => {
  console.log(`App running on port ${port}`)
})

/*
Google Calendar Integration

const fs = require('fs')
const readline = require('readline')
const { google } = require('googleapis')
const SCOPES = ['https://www.googleapis.com/auth/calendar.readonly']
const TOKEN_PATH = 'token.json'

// Load client secrets from a local file.
fs.readFile('credentials.json', (err, content) => {
  if (err) return console.log('Error loading client secret file:', err)
  // Authorize a client with credentials, then call the Google Calendar API.
  authorize(JSON.parse(content), listEvents)
})

function authorize(credentials, callback) {
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  // const client_secret = credentials.client_secret
  // const client_id = credentials.client_id
  // const redirect_uris = credentials.redirect_uris
  const oAuth2Client = new google.auth.OAuth2(
    client_id,
    client_secret,
    redirect_uris[0]
  )

  fs.readFile(TOKEN_PATH, (err, token) => {
    if (err) return getAccessToken(oAuth2Client, callback)
    oAuth2Client.setCredentials(JSON.parse(token))
    callback(oAuth2Client)
  })
}

function getAccessToken(oAuth2Client, callback) {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: SCOPES,
  })
  console.log('Authorize this app by visiting this url:', authUrl)
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  })
  rl.question('Enter the code from that page here: ', code => {
    rl.close()
    oAuth2Client.getToken(code, (err, token) => {
      if (err) return console.error('Error retrieving access token', err)
      oAuth2Client.setCredentials(token)
      // Store the token to disk for later program executions
      fs.writeFile(TOKEN_PATH, JSON.stringify(token), err => {
        if (err) return console.error(err)
        console.log('Token stored to', TOKEN_PATH)
      })
      callback(oAuth2Client)
    })
  })
}

function listEvents(auth) {
  const calendar = google.calendar({ version: 'v3', auth })
  calendar.events.list(
    {
      calendarId: 'primary',
      timeMin: new Date().toISOString(),
      maxResults: 10,
      singleEvents: true,
      orderBy: 'startTime',
    },
    (err, res) => {
      if (err) return console.log('The API returned an error: ' + err)
      const events = res.data.items
      if (events.length) {
        console.log('Upcoming 10 events:')
        events.map((event, i) => {
          const start = event.start.dateTime || event.start.date
          console.log(`${start} - ${event.summary}`)
        })
      } else {
        console.log('No upcoming events found.')
      }
    }
  )
}

*/
