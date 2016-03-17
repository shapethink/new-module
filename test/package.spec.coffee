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
	package:
		module:
			"should exist and be valid": (done) ->
				should.exist pkg.module
				result = PJV.validate pkg.rendered.module, "npm"
				for issue in [ "errors", "warnings", "recommendations" ]
					if result[issue]?
						done new Error "#{issue}:\n\t#{result[issue].join "\n\t"}"
						result.valid = false
						break

				done() if result.valid

			"each package listed in devDependencies should be requireable": ->
				for dep, version of pkg.json.devDependencies
					should.exist require dep

			"each package listed in dependencies should be requireable": ->
				for dep, version of pkg.json.dependencies
					should.exist require dep

			"no package should be listed as a dependency and a devDependency": ->
				for dep, version of pkg.json.dependencies
					should.not.exist pkg.json.devDependencies[dep]

			"should be value-equivalent to json": ->
				pkg.json.should.deep.equal pkg.module

			"should not be object-equivalent to json": ->
				pkg.json.should.not.equal pkg.module

		json:
			"should exist and be valid": (done) ->
				should.exist pkg.module
				result = PJV.validate pkg.rendered.module, "npm"
				for issue in [ "errors", "warnings", "recommendations" ]
					if result[issue]?
						done new Error "#{issue}:\n\t#{result[issue].join "\n\t"}"
						result.valid = false
						break

				done() if result.valid

			"each package listed in devDependencies should be requireable": ->
				for dep, version of pkg.json.devDependencies
					should.exist require dep

			"each package listed in dependencies should be requireable": ->
				for dep, version of pkg.json.dependencies
					should.exist require dep

			"no package should be listed as a dependency and a devDependency": ->
				for dep, version of pkg.json.dependencies
					should.not.exist pkg.json.devDependencies[dep]
