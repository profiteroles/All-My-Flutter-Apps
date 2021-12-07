import 'dart:io';
import 'option.dart';

class Terminal {
  const Terminal();
  void printPrompt(String prompt) {
    clearScreen();
    stdout.writeln(prompt);
  }

  void printOptions(List<Option> options) {
    options.asMap().forEach((i, option) {
      stdout.writeln('[$i] - ${option.label}');
    });

    stdout.writeln('Pass your answer\n');
    stdout.write('>');
  }

  String collectInput() {
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else if (Platform.isMacOS) {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
