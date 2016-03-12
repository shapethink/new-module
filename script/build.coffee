shell = require "@threadmetal/shell"

module.exports = () ->
	console.log "build invoked"

if module is require.main
	module.exports()
