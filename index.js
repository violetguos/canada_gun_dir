import { createRequire } from 'module';
const require = createRequire(import.meta.url);

const fs = require('fs');
const data = require('./dataEntry/createUser')
fs.writeFile('data.json', data, (err) => {
  if (err) {
      throw err;
  }
  console.log("JSON data is saved.");
});