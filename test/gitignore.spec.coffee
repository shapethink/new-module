should = require "@threadmetal/should"

fs = require "fs"

module.exports =
	gitignore:
		"should exist": (done) ->
			fs.exists ".gitignore", (exists) ->
				if exists then done()
				else done new Error "but it doesn't"

		"should contain a comment at the start of each block": (done) ->
			fs.readFile ".gitignore", (error, data) ->
				if error
					done error
				else
					text = data.toString()
					blocks = text.split /\n\s*\n/
					failed = false
					line = 1
					for block in blocks
						lines = block.split "\n"
						[first, rest...] = lines
						unless first.startsWith "\#"
							done new Error "but a block at line #{line} starts with \"#{first}\""
							failed = true
							break
						line += lines.length + 1

					done() unless failed

		"should end with a newline": (done) ->
			fs.readFile ".gitignore", (error, data) ->
				if error
					done error
				else
					text = data.toString()
					[rest..., last] = text.split "\n"
					if last is ""
						done()
					else
						done new Error "but the last line \"#{last}\" is unterminated"