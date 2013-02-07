library model;

import 'dart:html';
import 'dart:uri';
import 'dart:json';
import 'dart:async';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:web_ui/watcher.dart' as watchers;
import 'DARTJsonP.dart';

class Model{
  static final String endpoint_imagens = "https://www.googledrive.com/host/0B4Nj2G61OMg-NXI4c3dyLU4wVzA/";
  static final String endpoint_json = "https://www.googledrive.com/host/0B4Nj2G61OMg-OGgtdXdGei1zR2M/";
  
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
  String titulo = "";
  String descricao = "";
  String imagem = "";
  String encoded_href = "";
  String encoded_titulo = "";
  String encoded_descricao = "";
  String encoded_imagem = "";
  String emblemaSeleccionado;
  List<Map> _membros;
  List<Map> get membros {
    if(_membros==null){
      _membros=[];
      new JsonpCallback("membrosFunction").doCallback("${endpoint_json}membros?callback=membrosFunction").then((var data){model._membros=data;watchers.dispatch();});
    }
    return _membros;
  }
  List<List> _equipes;
  List<List> get equipes {
    if(equipes==null){
      _equipes=[];
      new JsonpCallback("equipesFunction").doCallback("${endpoint_json}equipes?callback=equipesFunction").then((var data){model._equipes=data;watchers.dispatch();});
    }
    return _equipes;
  }
  Map _emblemas;
  Map get emblemas {
    if(_emblemas==null){
      _emblemas={"emblemas":[],"patentes":[]};
      new JsonpCallback("emblemasFunction").doCallback("${endpoint_json}emblemas?callback=emblemasFunction").then((var data){model._emblemas=data;watchers.dispatch();});
    }
    return _emblemas;
  }
  List<Map> _galeria;
  List<Map> get galeria {
    if(_galeria==null){
      _galeria=[];
      new JsonpCallback("galeriaFunction").doCallback("${endpoint_json}galeria?callback=galeriaFunction").then((var data){model._galeria=data;watchers.dispatch();});
    }
    return _galeria;
  }
  List<Map> _anuncios;
  List<Map> get anuncios {
    if(_anuncios==null){
      _anuncios=[];
      new JsonpCallback("anunciosFunction").doCallback("${endpoint_json}anuncios?callback=anunciosFunction").then((var data){model._anuncios=data;watchers.dispatch();});
    }
    return _anuncios;
  }
  
  Model(){
    encode();
  }
  
  void encode(){
    encoded_href = encodeUri(href);
    encoded_titulo = encodeUri(titulo);
    encoded_descricao = encodeUri(descricao);
    encoded_imagem = encodeUri(imagem);
  }

  changePage(String link) {
    model.href=window.location.protocol.concat("//").concat(window.location.host).concat(window.location.pathname).concat(link);
    model.hash=link;
    model.encode();
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
    model.hash=window.location.hash;
    model.href=window.location.href;
    model.encode();
    watchers.dispatch();
  }
  window.onHashChange.listen(updateFilters);
  window.onPopState.listen(updateFilters);
}