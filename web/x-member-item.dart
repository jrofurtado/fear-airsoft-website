import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class MemberItem extends WebComponent {
  Map membro;
  String get firstAndLastName{
    List<String> names = membro["name"].split(' ');
    return "${names[0]} ${names[names.length-1]}";
  }
  String get activoStr{
    return membro['quota']?"No activo":"Inactivo";
  }
  String get activoImg{
    return membro['quota']?"member_active.png":"member_inactive.png";
  }
  
  void click(){
    model.changePage("${NavLink.Membros.link}/${membro["socio"]}");
  }
}
