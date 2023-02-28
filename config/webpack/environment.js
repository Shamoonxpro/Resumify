const { environment } = require('@rails/webpacker')
environment.loaders.delete('nodemodules')
module.exports = environment
