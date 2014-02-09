config = {}
if process.platform.match(/^darwin/) 
	config.platform = 'osx'
	config.sockPort = 3001
	config.answerPort = 3301
else if process.platform.match(/^win/) 
	config.platform = 'windows'
	config.sockPort = 3001
	config.answerPort = 3301
else 
	config.platform = 'linux'
	if process.arch is 'ia32'
	config.sockPort = 3003
	config.answerPort = 3303
	else if process.arch is 'x64'
	config.sockPort = 3004
	config.answerPort = 3304
	else
		throw new Error("Unsupported platform architecture '#{process.arch}'")

config.timeout = 20000 # ms before giving up and failing the test
config.callbackURL = "http://localhost:#{config.answerPort}/callback"

module.exports = config