import 'dart:html';
import 'package:unittest/unittest.dart';
import "dart:html";
import "../web/model.dart";

main() {
  integrationTests();
}

integrationTests(){
  group("Testes Integração:", (){
    Model model;
    _setup(){
      model = new Model();
    }
    _tearDown(){
      model = null;
    }
    setUp(_setup);
    tearDown(_tearDown);
    test('JSON membros', (){
      List membros = model.membros;
      expect(membros, isNull);
    });
  });
}