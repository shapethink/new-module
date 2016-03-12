shell = require "@threadmetal/shell"

module.exports = () ->
	console.log "cli invoked"

if module is require.main
	module.exports()
