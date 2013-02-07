import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class LegendaEmblema extends WebComponent {
  String nome;
  Map get emblema{
    if(nome!=null){
      var res = model.emblemas['emblemas'].where((emblema) => emblema["nome"] == nome);
      if(res.isEmpty)
        return null;
      return res.first;
    }
    return null;
  }
  void clickClose(){
    model.emblemaSeleccionado = null;
  }
}