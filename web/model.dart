library model;

import 'dart:html';
import 'dart:json';
import 'dart:async';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:web_ui/watcher.dart' as watchers;

class Model{
  static final String endpoint_imagens = "https://www.googledrive.com/host/0B4Nj2G61OMg-NXI4c3dyLU4wVzA/";
  static final String endpoint_json ="http://json.fear-airsoft.com/";

  Collection<NavLink> navlinks = [
                         NavLink.Clube,
                         NavLink.Anuncios,
                         NavLink.Jogos,
                         NavLink.Membros,
                         NavLink.Equipas,
                         NavLink.Galeria,
                         NavLink.Forum,
                         NavLink.Inscricoes,
                         NavLink.Documentos,
                         NavLink.Contas
                         ];
  String hash = window.location.hash;
  String href = window.location.href;
  String mainPage = window.location.protocol.concat("//").concat(window.location.host).concat(window.location.pathname);
  String emblemaSeleccionado;  
  List<Map> _membros;
  List<Map> get membros {
    if(_membros==null){
      _membros=[];
      HttpRequest.request("${endpoint_json}publicado/membros").then((req){model._membros=parse(req.responseText);watchers.dispatch();});
    }
    return _membros;
  }
  List<List> _equipes;
  List<List> get equipes {
    if(equipes==null){
      _equipes=[];
      HttpRequest.request("${endpoint_json}publicado/equipes").then((req){model._equipes=parse(req.responseText);watchers.dispatch();});
    }
    return _equipes;
  }
  Map _emblemas;
  Map get emblemas {
    if(_emblemas==null){
      _emblemas={"emblemas":[],"patentes":[]};
      HttpRequest.request("${endpoint_json}publicado/emblemas").then((req){model._emblemas=parse(req.responseText);watchers.dispatch();});
    }
    return _emblemas;
  }
  List<Map> _galeria;
  List<Map> get galeria {
    if(_galeria==null){
      _galeria=[];
      HttpRequest.request("${endpoint_json}publicado/galeria").then((req){model._galeria=parse(req.responseText);watchers.dispatch();});
    }
    return _galeria;
  }
  List<Map> _anuncios;
  List<Map> get anuncios {
    if(_anuncios==null){
      _anuncios=[];
      HttpRequest.request("${endpoint_json}publicado/anuncios").then((req){model._anuncios=parse(req.responseText);watchers.dispatch();});
    }
    return _anuncios;
  }
  List<Map> _campos;
  List<Map> get campos {
    if(_campos==null){
      _campos=[];
      HttpRequest.request("${endpoint_json}publicado/campos").then((req){model._campos=parse(req.responseText);watchers.dispatch();});
    }
    return _campos;
  }
  List<Map> _jogo;
  List<Map> get jogo {
    if(membros.length==0)
      return [];
    else{
      if(_jogo==null){
        _jogo=[];
        HttpRequest.request("${endpoint_json}jogo").then((req){
          List<Map> tmpJogo =parse(req.responseText);
          if(tmpJogo.length>0){
            DateTime dataFimJogo = new DateTime(tmpJogo[0]['ano'],tmpJogo[0]['mes'],tmpJogo[0]['dia'],tmpJogo[0]['horaFim'],tmpJogo[0]['minutosFim'],0);
            if(tmpJogo.length>0 && !dataFimJogo.isBefore(new DateTime.now())){
              for(Map participante in tmpJogo[0]["participantes"]){
                var res = model.membros.where((membro) => (membro["email"]==participante["email"]));
                if(res.length>0) {
                  participante["foto"] = "${Model.endpoint_imagens}/Fotos/100x100/${res.first["socio"]}.jpg";
                  participante["displayName"] = res.first["name"];
                } else {
                  participante["foto"] = "${Model.endpoint_imagens}/Fotos/no_photo_100x100.jpg";
                  participante["displayName"] = "convidado";
                }
              }
              model._jogo = tmpJogo;
              watchers.dispatch();
            }
          }
        });
      }
    }
    return _jogo;
  }

  changePage(String link) {
    model.mainPage=window.location.protocol.concat("//").concat(window.location.host).concat(window.location.pathname);
    model.href=mainPage.concat(link);
    model.hash=link;
  }
}

Model model = new Model();

class NavLink {
  static final NavLink Clube = new NavLink("Clube","#/clube");
  static final NavLink Anuncios = new NavLink("Anuncios","#/anuncios");
  static final NavLink Jogos = new NavLink("Jogos", "#/jogos");
  static final NavLink Membros = new NavLink("Membros", "#/membros");
  static final NavLink Equipas = new NavLink("Equipas", "#/equipas");
  static final NavLink Galeria = new NavLink("Galeria", "#/galeria");
  static final NavLink Forum = new NavLink("Fórum", "#/forum.html");
  static final NavLink Inscricoes = new NavLink("Inscrições", "#/inscricoes");
  static final NavLink Documentos = new NavLink("Links", "#/documentos");
  static final NavLink Contas = new NavLink("Contas", "#/contas");
  String name;
  String link;

  NavLink(this.name, this.link);
}

void main() {
//  useShadowDom = true; // to enable use of experimental Shadow DOM in the browser
  updateFilters(e) {
    model.mainPage=window.location.protocol.concat("//").concat(window.location.host).concat(window.location.pathname);
    model.hash=window.location.hash;
    model.href=window.location.href;
    watchers.dispatch();
  }
  window.onHashChange.listen(updateFilters);
  window.onPopState.listen(updateFilters);
}
