# Draw a board
# A board is an array of arrays of arrays of arrays of values
# Array of rows of blocks containing rows of cells
# Example 4x4 board:
# [[[[0,0],[0,0]],[[0,0],[0,0]]],[[[0,0],[0,0]],[[0,0],[0,0]]]]
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

# Find the proper dimensions of a board with {count} cells per block
dim = (count) ->
	height = Math.floor(Math.sqrt(count))
	while (count / height % 1) != 0
		height--
	height: height
	width: count / height
