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

# Generate a board with {count} cells per block
# A board is an array of arrays of arrays of arrays of values
# Array of rows of blocks containing rows of cells
# Example 4x4 board:
# [[[[0,0],[0,0]],[[0,0],[0,0]]],[[[0,0],[0,0]],[[0,0],[0,0]]]]
board = (count) ->

	# Find the proper dimensions of a board with {count} cells per block
	dim = (count) ->
		height = Math.floor(Math.sqrt(count))
		while (count / height % 1) != 0
			height--
		height: height
		width: count / height

	size = dim count
	((((0 for [1..(size.width)]) for [1..(size.height)]) for [1..(count/size.width)]) for [1..(count/size.height)])

render board 9
