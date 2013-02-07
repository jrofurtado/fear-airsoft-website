import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class PaginaGaleria extends WebComponent {
  String pesquisa="";
  bool imagens = true;
  bool video = true;
  
  List<Map> get resultados{
    String lpesquisa = pesquisa.toLowerCase();
    var res = model.galeria.where((galeria) => ((video&&galeria["video"])||(imagens&&galeria["imagem"]))&&galeria["nomeEvento"].toLowerCase().contains(lpesquisa));
    return res.toList();
  }
  Map get galeriaEscolhido{
    List<String> params = model.hash.split("/");
    if(params.length>=3){
      var res = model.galeria.where((galeria) => galeria["folder"] == params.elementAt(2));
      if(res.isEmpty)
        return null;
      return res.first;
    }
    return null;
  }
}