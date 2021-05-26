class Node<String> {
  String _node;
  int _height;
  Node<String> _left;
  Node<String> _right;

  Node(this._node) {
    _height = 1;
  }

  String get getNode {
    return _node;
  }

  set setNode(String name) {
    this._node = name;
  }

  int get getHeight {
    return _height;
  }

  set setHeight(int height) {
    this._height = height;
  }

  Node<String> get getLeft {
    return _left;
  }

  set setLeft(Node<String> leftNode) {
    this._left = leftNode;
  }

   Node<String> get getRight {
    return _right;
  }

  set setRight(Node<String> rightNode) {
    this._right = rightNode;
  }
  
}
