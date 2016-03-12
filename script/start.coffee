shell = require "@threadmetal/shell"

module.exports = () ->
	console.log "start invoked"

if module is require.main
	module.exports()
