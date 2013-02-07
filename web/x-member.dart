import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class Member extends WebComponent {
  Map membro;
  
  String get activoStr{
    return membro['quota']?"No activo":"Inactivo";
  }
  String get activoImg{
    return membro['quota']?"member_active.png":"member_inactive.png";
  }
  void clickClose(){
    model.changePage("${NavLink.Membros.link}");
  }
}