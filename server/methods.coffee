DICTIONARY = 'http://www.collinsdictionary.com/dictionary/german-english/'

cheerio = Meteor.npmRequire 'cheerio'

Meteor.methods(
	lookUp: (word) ->
		html = cheerio.load Meteor.http.get(DICTIONARY+word).content
		html('div.translations h4.gramGrp span').first().text()
)