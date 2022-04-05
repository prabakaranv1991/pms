require('dotenv').config()

module.exports = (on, config) => {
  // copy any needed variables from process.env to config.env
  console.log(__filename )
  config.BASEURL = process.env.BASEURL
  // do not forget to return the changed config object!
  return config
}