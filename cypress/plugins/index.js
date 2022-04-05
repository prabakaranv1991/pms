require('dotenv').config()
module.exports = (on, config) => {
  config.BASEURL = process.env.BASEURL
  console.log(process.env)
  return config
}