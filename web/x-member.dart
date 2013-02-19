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
  String get descricaoShare{
    String emblemasTxt="";
    for(Map a in membro['achievementsGun']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    for(Map a in membro['achievementsRole']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    for(Map a in membro['achievementsSpecial']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    return "Nivel: ${membro['level']}\nPatente: ${membro['rank']}\nEquipe: ${membro['teamName']}\nExperiencia: ${membro['xp']}/${membro['nextLevelXp']}${emblemasTxt}";
  }
  void clickClose(){
    model.changePage("${NavLink.Membros.link}");
  }
}