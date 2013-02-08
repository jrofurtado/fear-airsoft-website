import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class AnuncioItem extends WebComponent {
  Map anuncio;
  String get imagemUrl{
    if(anuncio["imagemExterna"])
      return anuncio["imagemUrl"];
    else
      return Model.endpoint_imagens.concat(anuncio["imagemUrl"]);
  }
  bool get relativeUrl{
    return anuncio["url"].startsWith("#/");
  }
  bool get absoluteUrl{
    return !emptyUrl&&!relativeUrl;
  }
  bool get emptyUrl{
    return anuncio["url"].length==0;
  }
  void clickUrl(){
    model.changePage(anuncio["url"]);
  }
}
