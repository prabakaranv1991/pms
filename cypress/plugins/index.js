require('dotenv').config({ path: '../../../.env' })

module.exports = (on, config) => {
  // copy any needed variables from process.env to config.env
  config.BASEURL = process.env.BASEURL
  console.log(process.env)
  // do not forget to return the changed config object!
  return config
}