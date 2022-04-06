module.exports = (on, config) => {
  // copy any needed variables from process.env to config.env
  console.log(process.env)

  // do not forget to return the changed config object!
  return config
}