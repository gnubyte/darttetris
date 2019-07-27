part of tetris;

class IBlock extends Block {
  //Block in shape of I

  IBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 -2).floor(), -1);
    tiles[1] = Tile((width / 2- 1).floor(), -1);
    tiles[2] = Tile((width /2).floor(), -1);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'cyan';
  }//end constructor

}//end class Iblock


class OBlock extends Block {
  // Block in Shape of O

  OBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2).floor(), -1);
    tiles[1] = Tile((width / 2 +1).floor(), -1);
    tiles[2] = Tile((width /2).floor(), 0);
    tiles[3] = Tile((width /2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'yellow';
  }//end constructor

}//end class Oblock

class JBlock extends Block {
  // Block in Shape of J

  JBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2 - 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'blue';
  }//end constructor

}//end class Jblock

class LBlock extends Block {
  // Block in Shape of L

  LBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'orange';
  }//end constructor

}//end class L block

class TBlock extends Block {
  // Block in Shape of T
  TBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2).floor(), -1);
    rotationTile = tiles[1];
    color = 'purple';
  }//end constructor

}//end class T block



class ZBlock extends Block {
  // Block in Shape of Z
  ZBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width /2).floor(), -1);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'red';
  }//end constructor

}//end class Z bblock

class SBlock extends Block {
  // Block in Shape of Z
  SBlock(int width) {
    // constructor, starts off 
    tiles[0] = Tile((width / 2 - 1).floor(), -1);
    tiles[1] = Tile((width / 2).floor(), -1);
    tiles[2] = Tile((width / 2 ).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'green';
  }//end constructor

}//end class Z bblock

// ==== horizontal spawning