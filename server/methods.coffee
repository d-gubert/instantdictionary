DICTIONARY = 'http://www.collinsdictionary.com/dictionary/german-english/'

cheerio = Meteor.npmRequire 'cheerio'

Meteor.methods(
	lookUp: (word) ->
    html = Meteor.http.get(DICTIONARY+word).content
    
    if html.indexOf('Sorry') is -1
      return "Not found"
    
    parsed = cheerio.load html  
    Dictionary.insert
      word: word
      definition: parsed('div.definition_content.col.main_bar').text()
      
    parsed('div.translations h4.gramGrp span').first().text()
)