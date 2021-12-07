import 'package:sli_wizard/sli_wizard.dart';

void main() {
  var options = [new Option('I want red', '#f00'), new Option("I want blue", '#00F')];
  final promtpter = new Prompter();

  String colorCode = promtpter.askMultiple("What's your fav color", options);
  bool answer = promtpter.askBinary('Do you like dart?');
  print(colorCode);
  print(answer);
}
