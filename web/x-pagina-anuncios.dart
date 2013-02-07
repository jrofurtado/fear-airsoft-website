import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class PaginaAnuncios extends WebComponent {
  String pesquisa="";
  List<Map> get resultados{
    String lpesquisa = pesquisa.toLowerCase();
    var res = model.anuncios.where((anuncio) => anuncio["titulo"].toLowerCase().contains(lpesquisa)||anuncio["texto"].toLowerCase().contains(lpesquisa));
    return res.toList();
  }
  Map get anuncioEscolhido{
    List<String> params = model.hash.split("/");
    if(params.length>=3){
      var res = model.anuncios.where((anuncio) => anuncio["titulo"].toString() == params.elementAt(2));
      if(res.isEmpty)
        return null;
      return res.first;
    }
    return null;
  }
}