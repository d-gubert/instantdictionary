Template.body.events(
	'keyup input': (e) ->
		if e.keyCode is 13
			Meteor.call 'lookUp', e.target.value, (error, result) ->
				console.log error?.getStack(), result
				unless error?
					$('#container').html(result)
)