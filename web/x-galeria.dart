import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import 'model.dart';

class Galeria extends WebComponent {
  Map galeria;
  int _index=0;
  Map get item => galeria["itens"].elementAt(_index);
  String get imagemUrl => "${Model.endpoint_imagens}Galeria/${galeria['ano']}/${galeria['folder']}/${item['nome']}";

  clickNext(){
    if(_index>=galeria["itens"].length-1) {
      _index=0;
    } else {
      _index++;
    }
  }
  clickPrevious(){
    if(_index<=0) {
      _index=galeria["itens"].length-1;
    } else {
      _index--;
    }
  }
  clickClose(){
    model.changePage("${NavLink.Galeria.link}");
  }
}