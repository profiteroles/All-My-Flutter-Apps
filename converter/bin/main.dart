import 'dart:io';
import 'package:sli_wizard/sli_wizard.dart';
import 'package:converter/src/converter.dart';

void main() {
  final prompter = new Prompter();

  final choise = prompter.askBinary('Are you here to convert an Image?');

  if (!choise) {
    exit(0);
  }

  final format = prompter.askMultiple('Select Format: ', buildFormatOption());
  final selectedFile = prompter.askMultiple('Select an Image to Convert!', buildFileOptions());

  final newPath = convertImage(selectedFile, format);

  final shouldOpen = prompter.askBinary('Open the Image?');

  if (shouldOpen) {
    Process.run('open', [newPath]);
  }
}

List<Option> buildFormatOption() {
  return [new Option('Convert to jpeg', 'jpeg'), new Option('Convert to png', 'png')];
}

List<Option> buildFileOptions() {
  return Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) && entity.path.contains(new RegExp(r'\.(png|jpg|jpeg)'));
  }).map((entity) {
    final filename = entity.path.split(Platform.pathSeparator).last;
    return new Option(filename, entity);
  }).toList();
}
