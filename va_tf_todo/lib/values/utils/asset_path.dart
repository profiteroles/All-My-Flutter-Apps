const String _imageRootPath = 'images/';
final String bckgrndImage = _getPath('background.jpg');
final String todoImage = _getPath('todo.png');
final String profileImage = _getPath('profile.png');
final String initialGif = _getPath('initial.gif');

String _getPath(String name) => _imageRootPath + name;
