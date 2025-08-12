const express = require('express');
const axios = require('axios');
const _ = require('lodash');
const moment = require('moment');

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Sample data
const users = [
  { id: 1, name: 'Alice', createdAt: '2023-01-15' },
  { id: 2, name: 'Bob', createdAt: '2023-02-20' },
  { id: 3, name: 'Charlie', createdAt: '2023-03-25' }
];

// Routes
app.get('/', (req, res) => {
  res.send('SBOM Test JavaScript App is running!');
});

app.get('/api/users', (req, res) => {
  // Use lodash to transform data
  const formattedUsers = _.map(users, user => ({
    ...user,
    // Use moment to format dates
    formattedDate: moment(user.createdAt).format('MMM Do, YYYY')
  }));
  
  res.json(formattedUsers);
});

app.get('/api/external', async (req, res) => {
  try {
    // Use axios to make external API call
    const response = await axios.get('https://jsonplaceholder.typicode.com/posts/1');
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch external data' });
  }
});

// Start server
app.listen(port, () => {
  console.log(`SBOM Test JavaScript app listening at http://localhost:${port}`);
});
