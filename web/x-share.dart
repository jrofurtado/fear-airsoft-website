import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'dart:uri';
import 'model.dart';

class Share extends WebComponent {
  String url = "";
  String imagem = "";
  String titulo = "";
  String descricao = "";
  String get redirectUrl{
    return encodeUriComponent(model.href);
  }
  String get encodedUrl{
    if(emptyUrl) {
      return encodeUriComponent(model.mainPage);
    } else
      if (relativeUrl) {
        return encodeUriComponent("${model.mainPage}${url}");
      } else {
        return encodeUriComponent(url);
    }
  }
  String get encodedImagem{
    if(imagem.length==0) {
      return encodeUriComponent("${model.mainPage}/../logo_fear_150x150.png");
    } else {
      return encodeUriComponent(imagem);
    }
  }
  String get encodedTitulo{
    return encodeUriComponent(titulo);
  }
  String get encodedDescricao{
    return encodeUriComponent(descricao);
  }
  bool get relativeUrl{
    return url.startsWith("#/");
  }
  bool get emptyUrl{
    return url.length==0;
  }
  String get facebookShareUrl{
    return "https://www.facebook.com/dialog/feed?app_id=150298198459974&link=${encodedUrl}&picture=${encodedImagem}&name=${encodedTitulo}&caption=${encodedTitulo}&description=${encodedDescricao}&redirect_uri=${redirectUrl}";
  }
}
