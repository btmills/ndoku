# Draw a board
render = (board) ->
	n = Math.sqrt(board.length)
	size = dim n
	table = $ '<tbody>'
	for row in [0...(n / size.height)]
		tr = $ '<tr>'
		for box in [(row * n / size.width)...((row + 1) * n / size.width)]
			cells = nthBoxCells board, box
			boxtable = $ '<tbody>'
			for boxrow in [0...size.height]
				boxtr = $ '<tr>'
				for cell in [0...size.width]
					boxtr.append $('<td>').addClass('cell').html(cells[boxrow * size.width + cell])
				boxtable.append boxtr
			tr.append $('<td>').append $('<table>').addClass('box').append boxtable
		table.append tr
	$('body').html $('<table>').addClass('board').append(table)

# Find the proper dimensions of a board with n cells per box
dim = (n) ->
	height = Math.floor Math.sqrt n
	while (n / height % 1) != 0
		height--
	height: height
	width: n / height

###
Generate a board with n cells per box
A board is an array of n^2 cells
A cell is either a number or a list of numbers
###
board = (n) ->
	([] for [1..n*n])

# Get the index of a cell at coordinates x, y
coordToId = (board, col, row) ->
	n = Math.sqrt board.length
	size = dim n
	row * n + col

# Get the x, y coordinates given a cell's id
idToCoord = (board, id) ->
	#console.log('idToCoord board,', id)
	n = Math.sqrt board.length
	col: id % n
	row: Math.floor(id / n)

# Select the values of the cells at a list of ids
cells = (board, ids) ->
	(board[id] for id in ids)

# Get the index of every cell in a specified row
rowIds = (board, row) ->
	n = Math.sqrt board.length
	(n * row + col for col in [0...n])

# Get the cells of the specified row (0-based)
rowCells = (board, row) ->
	cells board, rowIds board, row

# Get the index of every cell in a specified column
colIds = (board, col) ->
	n = Math.sqrt board.length
	(col + row * n for row in [0...n])

# Get the cells of the specified column (0-based)
colCells = (board, col) ->
	cells board, colIds board, col

# Get the index of every cell in a specified box
nthBoxIds = (board, box) ->
	n = Math.sqrt board.length
	size = dim n
	left = box * size.width % n
	top = Math.floor(box / (n / size.width)) * size.height
	result = []
	for y in [top...(top + size.height)]
		for x in [left...(left + size.width)]
			result.push coordToId board, x, y
	return result

# Get the cells of the box containing the specified cell (0-based)
boxCells = (board, cell) ->
	n = Math.sqrt(board.length)
	size = dim n
	col = cell % n
	row = Math.floor(cell / n)
	topleft = Math.floor(col / size.width) * size.width + Math.floor(row / size.height) * size.height

render board 9
