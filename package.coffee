module.exports =
	name: "@threadmetal/new-module"
	description: "a generator of modules"
	author: "Robert M. Koch <threadmetal@gmail.com> (https://threadmetal.github.io/)"
	version: "0.0.1"
	license: "UNLICENSED"
	private: true
	repository:
		type: "git"
		url: "git+https://github.com/threadmetal/new-module.git"
	bugs:
		url: "https://github.com/threadmetal/new-module/issues"
		email: "threadmetal@gmail.com"
	homepage: "https://github.com/threadmetal/new-module#readme"
	devDependencies:
		"@threadmetal/should": "github:threadmetal/should"
		"coffee-script": "^1.10.0"
		mocha: "^2.4.5"
		"package-json-validator": "^0.6.1"
	scripts:
		test: "mocha"

