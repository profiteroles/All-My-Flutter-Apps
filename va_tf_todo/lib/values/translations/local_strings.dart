import "package:get/route_manager.dart";
import 'package:va_tf_todo/values/translations/english.dart';
import 'package:va_tf_todo/values/translations/french.dart';
import 'package:va_tf_todo/values/translations/german.dart';
import 'package:va_tf_todo/values/translations/russian.dart';
import 'package:va_tf_todo/values/translations/spanish.dart';

//Country Codes: https://www.science.co.il/international/Country-codes.php
//Translator: https://file-translate.com/en/app/json-translate

class LocalStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_AUS": english,
        "ru_RUS": russian,
        "de_DEU": german,
        "fr_FRA": french,
        "es_ESP": spanish,
      };
}
