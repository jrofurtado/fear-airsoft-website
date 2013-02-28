import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class PaginaMembros extends WebComponent {
  String pesquisa="";
  List<Map> get resultados{
    String lpesquisa = pesquisa.toLowerCase();
    var res = model.membros.where((member) => member["name"].toLowerCase().contains(lpesquisa));
    return res.toList();
  }
  Map get membroEscolhido{
    List<String> params = model.hash.split("/");
    if(params.length>=3){
      var res = model.membros.where((member) => member["socio"].toString() == params.elementAt(2));
      if(res.isEmpty) {
        return null;
      }
      return res.first;
    }
    return null;
  }
}