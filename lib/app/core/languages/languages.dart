import 'package:get/get.dart';

import 'package:psico_app/app/core/languages/en_CA/en_ca.dart';
import 'package:psico_app/app/core/languages/pt_BR/pt_br.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_CA': enCa,
    'pt_BR': ptBr
  };
}