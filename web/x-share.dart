import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'dart:uri';
import 'model.dart';

class Share extends WebComponent {
  String url = "";
  String imagem = "";
  String titulo = "";
  String descricao = "";
  String get encodedUrl{
    if(emptyUrl)
      return encodeUri(model.mainPage);
    else 
      if (relativeUrl)
        return encodeUri("${model.mainPage}${url}");
      else
        return encodeUri(url);
  }  
  String get encodedImagem{
    if(imagem.length==0)
      return encodeUri("${model.mainPage}/../logo_fear_150x150.png");
    else
      return encodeUri(imagem);
  }
  String get encodedTitulo{
    return encodeUri(titulo);
  }
  String get encodedDescricao{
    return encodeUri(descricao);
  }
  bool get relativeUrl{
    return url.startsWith("#/");
  }
  bool get emptyUrl{
    return url.length==0;
  }
  String get facebookShareUrl{
    return "https://www.facebook.com/dialog/feed?app_id=150298198459974&link=${encodedUrl}&picture=${encodedImagem}&name=${encodedTitulo}&caption=${encodedTitulo}&description=${encodedDescricao}&redirect_uri=${encodedUrl}";
  }
}
