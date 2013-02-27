# Draw a board
render = (board) ->
	table = $ '<tbody>'
	for row in board
		tr = $ '<tr>'
		for block in row
			subtable = $('<td>').appendTo(tr)
			subtable = $('<table>').addClass('block').appendTo(subtable)
			subtable = $('<tbody>').appendTo(subtable)
			for tablerow in block
				subtr = $ '<tr>'
				for cell in tablerow
					subtr.append $('<td>').append('<div>').addClass('cell').html(cell)
				subtable.append subtr
		table.append tr
	$('body').html $('<table>').addClass('board').append(table)

# Find the proper dimensions of a board with n cells per box
dim = (n) ->
	height = Math.floor Math.sqrt n
	while (n / height % 1) != 0
		height--
	height: height
	width: n / height


render board 9
###
Generate a board with n cells per box
A board is an array of n^2 cells
A cell is either a number or a list of numbers
###
board = (n) ->
	([] for [1..n*n])
