part of tetris;



class Game {
  CanvasElement board; //html canvas element
  Element gameScore; //html element to contain score
  Block currentBlock;


  static int width = 10;
  static int height = 20;
  static int cellSize = 30;

  static int linesCleared; //score for the game
  static CanvasRenderingContext2D ctx; // used to interact with canvas element

  static List<List<int>> boardState; //2D list of ints, 10x20, filled with 0s. as piece is dropped into grid, it will exist as 1s
  static List<int> rowState; //how many blocks are in each of the rows; if 10 blocks are in the row we clear that row/remove it

  Game() {
    linesCleared = 0;
    gameScore = Element.div()..id = "score";

    rowState = List<int>.filled(height, 0);
    boardState = List<int>(width)
    .map(
      (_) =>List<int>.filled(height,0),
    )
    .toList();
  }

Block getRandomPiece(){
  int randomInt = Random().nextInt(7);
  switch (randomInt) {
    case 0:
      return IBlock(width);
    case 1:
      return OBlock(width);
    case 2:
      return JBlock(width);
    case 3:
      return TBlock(width);
    case 4:
      return LBlock(width);
    case 5:
      return ZBlock(width);
    case 6:
      return SBlock(width);
  }
  return Block();
}

  void clearRows(){
    for (int idx =0; idx < rowState.length; idx++){
      int row = rowState[idx];

      if (row == width){
        // we are getting the height of the board to move everything downwards
        // we pass in the change in obj, x/y (0, cellsize) to move it downwards
        ImageData imageData = 
          ctx.getImageData(0,0, cellSize * width, cellSize * idx);
          ctx.putImageData(imageData, 0, cellSize);
        for (int y = idx; y> 0; y--){
          for (int x = 0; x < width; x++){
            boardState[x][y] = boardState[x][y - 1];
          }
          rowState[y] = rowState[ y - 1];
        }
        rowState[0] = 0;
        boardState.forEach((c) => c[0] = 0);
        linesCleared++;
      }
    }
  }


  bool validMove(){
    //whether a block has collided with another block, or the side of the board
    for (Tile tile in currentBlock.tiles){
      //we want to iterate through all the tiles in the current block
      //as we iterate, check to see that the tiles value is greater than or equal to the width
      if (tile.x >= width ||
      tile.x < 0 ||
      tile.y >= height ||
      tile.y < 0 ||
      boardState[tile.x][tile.y] == 1){
        return false;
      }
    }
    return true;
  }

  bool pieceMoving(String s){
    // animation to handle whether piece is moving
    /* Tile is grey because background gameboard is grey
     * we will delete the tile, spawn the tile in a new position with its color
     */
    bool pieceIsMoving = true;
    ctx.fillStyle = 'grey';
    currentBlock.tiles.forEach((Tile tile){
      ctx.fillRect(
        tile.x * cellSize,
        tile.y * cellSize,
        cellSize,
        cellSize
      );
    });
    if (s == 'rotate') {
      currentBlock.rotateRight();
    } else {
      currentBlock.move(s);
    }


  if (!(pieceIsMoving = validMove())){
      if (s == 'rotate') currentBlock.rotateLeft();
      if (s == 'left') currentBlock.move('right');
      if (s == 'right') currentBlock.move('left');
      if (s == 'down') currentBlock.move('up');
      if (s == 'up') currentBlock.move('down');
  }

  ctx.fillStyle = currentBlock.color;

  currentBlock.tiles.forEach((tile){
    ctx.fillRect(
      tile.x * cellSize,
      tile.y * cellSize,
      cellSize,
      cellSize,
    );
  });
  return pieceIsMoving;
  }// end piece Moving

  void updateGame(Timer timer) {
    // controls canvas refresh
    gameScore.setInnerHtml(
      "<h4>Score: ${linesCleared} Lines</p>",
    );
    if (!pieceMoving('down')){
      //if the piece is not moving down
      currentBlock.tiles.forEach((t) {
        boardState[t.x][t.y] = 1;
        rowState[t.y]++;
      });
      clearRows();
      currentBlock = getRandomPiece();
      if (!pieceMoving('down')){
        timer.cancel();
      }
    }
  }

  void initializeCanvas() {
    // makes HTML canvas

    board = Element.html('<canvas/>');
    board.width = width * cellSize;
    board.height = height * cellSize;
    ctx = board.context2D;
    ctx.fillStyle = 'grey';
    ctx.fillRect(0,0, board.width, board.height);
  }

  void handleKeyboard(Timer timer ){ 
    document.onKeyDown.listen((event) {
      if (timer.isActive) {
        if (event.keyCode == 37) pieceMoving('left');
        if (event.keyCode == 38) pieceMoving('rotate');
        if (event.keyCode == 39) pieceMoving('right');
        if (event.keyCode == 40) pieceMoving('down');
        if (event.keyCode == 32) while (pieceMoving('down')) {}
      }
    });
  }

  void start() {
    initializeCanvas();
    Element entryPoint = querySelector('#output');
    entryPoint.nodes.add(board);
    entryPoint.nodes.add(gameScore);

    Timer timer = Timer.periodic(
      Duration(milliseconds: 500),
      updateGame,
    );

    currentBlock = getRandomPiece();
    handleKeyboard(timer);
  }
} //end game class