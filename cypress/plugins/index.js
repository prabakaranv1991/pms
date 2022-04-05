require('dotenv').config()

module.exports = (on, config) => {
  // copy any needed variables from process.env to config.env
  const testFolder = '../../';
  const fs = require('fs');

  fs.readdirSync(testFolder).forEach(file => {
    console.log(file);
  });

  config.BASEURL = process.env.BASEURL
  // do not forget to return the changed config object!
  return config
}