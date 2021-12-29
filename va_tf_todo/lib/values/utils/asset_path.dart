const String imageRootPath = 'images/';
final String bckgrndImage = _getPath('background.jpg');
final String todoImage = _getPath('todo.png');
final String profileImage = _getPath('profile.png');

String _getPath(String name) => imageRootPath + name;
