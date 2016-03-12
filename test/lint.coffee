should = require "@threadmetal/should"

pkg = {}

pkg.module = require "../package.coffee"
pkg.json = require "../package.json"

pkg.rendered =
	module: JSON.stringify pkg.module
	json: JSON.stringify pkg.json

PJV = require "package-json-validator"
	.PJV

module.exports =
	lint:
		"package.json should exist and be valid": (done) ->
			should.exist pkg.json
			result = PJV.validate pkg.rendered.json, "npm"
			if result.valid
				done()
			else
				done new Error result.critical

		"package module should exist and be valid": (done) ->
			should.exist pkg.module
			result = PJV.validate pkg.rendered.module, "npm"
			if result.valid
				done()
			else
				done new Error result.critical

		"package module and package.json should be JSON-equivalent": ->
			pkg.rendered.json.should.equal pkg.rendered.module

		"package module and package.json should not be object-equivalent": ->
			pkg.json.should.not.equal pkg.module

		"package module and package.json should be deep-value-equivalent": ->
			pkg.json.should.deep.equal pkg.module

		"each package listed in devDependencies should be requireable": ->
			for dep in pkg.json.devDependencies
				should.exist require dep
