import 'contants.dart';
import 'node.dart';

class Tree {
  Node root, n;

  void insert(String data) {
    root = insertNode(root, data);
  }

  int max(int a, int b) {
    return (a > b) ? a : b;
  }

  int height(Node data) {
    if (data == null) {
      return 0;
    }
    return data.getHeight;
  }

  void updateHeight(Node node) {}

  Node rightRotate(Node y) {}

  Node leftRotate(Node x) {}

  int getBalance(Node node) {}

  Node balanceNode(Node node) {
    return node;
  }

  Node insertNode(Node node, String data) {
    if (node = null) {
      return Node(data);
    } else {
      return node;
    }
    return node;
  }

  void reset() {}
}
