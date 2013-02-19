import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class MembroEmblema extends WebComponent {
  Map achievement;
  String titulo="";
  String classe="";
  
  void clickLegenda(){
    model.emblemaSeleccionado = achievement['name'];
  }
}