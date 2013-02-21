import 'dart:html';
import 'package:unittest/unittest.dart';
import "dart:html";
import "../web/model.dart";
import "../web/x-galeria-folder.dart";
import "../web/x-galeria.dart";

main() {
  galeriaFolderUnitTests();
  galeriaUnitTests();
}

void galeriaFolderUnitTests(){
  group("Testes Unitarios GaleriaFolder:", (){
    GaleriaFolder galeriaFolder;
    setUp((){
      galeriaFolder = new GaleriaFolder();
      galeriaFolder.galeria={"folder":"2012-12-30","imagem":true,"nomeEvento":"","nomeCompleto":"30/12/2012 ","mes":12,"ano":2012,"dia":30,"itens":[{"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (1)_600x800.jpg","youtubeId":"","video":false},{"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (10)_600x800.jpg","youtubeId":"","video":false}],"thumb":"thumb.jpg.jpg","video":false};
    });
    tearDown((){
      galeriaFolder = null;
    });
    test('hash5_1 inteiro entre 0 e 4', (){expect(galeriaFolder.hash5_1, inInclusiveRange(0, 4));});
    test('hash5_2 inteiro entre 0 e 4', (){expect(galeriaFolder.hash5_2, inInclusiveRange(0, 4));});
    test('hash5_3 inteiro entre 0 e 4', (){expect(galeriaFolder.hash5_3, inInclusiveRange(0, 4));});    
  });
}
void galeriaUnitTests(){
  group("Testes Unitarios Galeria:", (){
    Galeria galeria;
    setUp((){
      galeria = new Galeria();
      galeria.galeria={"folder":"2012-12-30","imagem":true,"nomeEvento":"","nomeCompleto":"30/12/2012 ","mes":12,"ano":2012,"dia":30,"itens":[{"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (1)_600x800.jpg","youtubeId":"","video":false},{"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (10)_600x800.jpg","youtubeId":"","video":false}],"thumb":"thumb.jpg.jpg","video":false};
    });
    tearDown((){
      galeria = null;
    });
    test('item é o primeiro', (){
      expect(galeria.item, equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (1)_600x800.jpg","youtubeId":"","video":false}));
      });
    test('item não é o segundo', (){
      expect(galeria.item, isNot(equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (10)_600x800.jpg","youtubeId":"","video":false})));
      });
    test('clickNext() e item é o segundo', (){
      galeria.clickNext();
      expect(galeria.item, equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (10)_600x800.jpg","youtubeId":"","video":false}));
      });
    test('clickNext(),clickNext() e item é o primeiro', (){
      galeria.clickNext();
      galeria.clickNext();
      expect(galeria.item, equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (1)_600x800.jpg","youtubeId":"","video":false}));
      });
    test('clickPrevious() e item é o segundo', (){
      galeria.clickPrevious();
      expect(galeria.item, equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (10)_600x800.jpg","youtubeId":"","video":false}));
      });
    test('clickPrevious(),clickPrevious() e item é o primeiro', (){
      galeria.clickPrevious();
      galeria.clickPrevious();
      expect(galeria.item, equals({"imagem":true,"nome":"Jogo 30 de Dezembro de 2012 (1)_600x800.jpg","youtubeId":"","video":false}));
      });
  });
}