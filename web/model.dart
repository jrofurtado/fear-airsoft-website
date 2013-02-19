library model;

import 'dart:html';
import 'dart:json';
import 'dart:async';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:web_ui/watcher.dart' as watchers;
import 'DARTJsonP.dart';

class Model{
  static final String endpoint_imagens = "https://www.googledrive.com/host/0B4Nj2G61OMg-NXI4c3dyLU4wVzA/";
  static final String endpoint_jsonp = "https://www.googledrive.com/host/0B4Nj2G61OMg-OGgtdXdGei1zR2M/";
  static final String endpoint_json ="http://fear-airsoft.appspot.com/json/publishedData/";
  static final String endpoint_weather_json="http://free.worldweatheronline.com/feed/weather.ashx?q=37.77,-25.58&format=json&num_of_days=5&key=795c730da3133229131502";
  static final String endpoint_weather_jsonp="http://free.worldweatheronline.com/feed/weather.ashx?q=37.77,-25.58&format=json&num_of_days=5&key=795c730da3133229131502";
  static final useJsonP=false;
  static final useWeatherJsonP=true;
  
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
  Map _weather;
  Map get weather {
    if(_weather==null){
      _weather={'data':{'weather':[]}};
      if(!useWeatherJsonP)
        HttpRequest.request("${endpoint_weather_json}").then((req){model._weather=parse(req.responseText);watchers.dispatch();});
      else  
        new JsonpCallback("weatherFunction").doCallback("${endpoint_weather_jsonp}&callback=weatherFunction").then((var data){model._weather=data;watchers.dispatch();});
    }
    return _weather;
  }
  List<Map> _membros;
  List<Map> get membros {
    if(_membros==null){
      _membros=[];
      if(!useJsonP)
        HttpRequest.request("${endpoint_json}membros").then((req){model._membros=parse(req.responseText);watchers.dispatch();});
      else  
        new JsonpCallback("membrosFunction").doCallback("${endpoint_jsonp}membrosP?callback=membrosFunction").then((var data){model._membros=data;watchers.dispatch();});
    }
    return _membros;
  }
  List<List> _equipes;
  List<List> get equipes {
    if(equipes==null){
      _equipes=[];
      if(!useJsonP)
        HttpRequest.request("${endpoint_json}equipes").then((req){model._equipes=parse(req.responseText);watchers.dispatch();});
      else  
        new JsonpCallback("equipesFunction").doCallback("${endpoint_jsonp}equipesP?callback=equipesFunction").then((var data){model._equipes=data;watchers.dispatch();});
    }
    return _equipes;
  }
  Map _emblemas;
  Map get emblemas {
    if(_emblemas==null){
      _emblemas={"emblemas":[],"patentes":[]};
      if(!useJsonP)
        HttpRequest.request("${endpoint_json}emblemas").then((req){model._emblemas=parse(req.responseText);watchers.dispatch();});
      else
        new JsonpCallback("emblemasFunction").doCallback("${endpoint_jsonp}emblemasP?callback=emblemasFunction").then((var data){model._emblemas=data;watchers.dispatch();});
    }
    return _emblemas;
  }
  List<Map> _galeria;
  List<Map> get galeria {
    if(_galeria==null){
      _galeria=[];
      if(!useJsonP)
        HttpRequest.request("${endpoint_json}galeria").then((req){model._galeria=parse(req.responseText);watchers.dispatch();});
      else  
        new JsonpCallback("galeriaFunction").doCallback("${endpoint_jsonp}galeriaP?callback=galeriaFunction").then((var data){model._galeria=data;watchers.dispatch();});
    }
    return _galeria;
  }
  List<Map> _anuncios;
  List<Map> get anuncios {
    if(_anuncios==null){
      _anuncios=[];
      if(!useJsonP)
        HttpRequest.request("${endpoint_json}anuncios").then((req){model._anuncios=parse(req.responseText);watchers.dispatch();});
      else  
        new JsonpCallback("anunciosFunction").doCallback("${endpoint_jsonp}anunciosP?callback=anunciosFunction").then((var data){model._anuncios=data;watchers.dispatch();});
    }
    return _anuncios;
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