// Auto-generated from index.html.
// DO NOT EDIT.

library model;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-siteheader.dart';
import 'x-sitenavigation.dart';
import 'x-pagina-clube.dart';
import 'x-pagina-anuncios.dart';
import 'x-pagina-jogos.html.dart';
import 'x-pagina-membros.dart';
import 'x-pagina-equipas.html.dart';
import 'x-pagina-galeria.dart';
import 'x-pagina-forum.html.dart';
import 'x-pagina-inscricoes.html.dart';
import 'x-pagina-documentos.html.dart';
import 'x-pagina-contas.dart';
import 'dart:html';
import 'dart:json';
import 'dart:async';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:web_ui/watcher.dart' as watchers;


// Original code


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

// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  final __html0 = new autogenerated.Element.tag('x-pagina-clube'), __html1 = new autogenerated.Element.tag('x-pagina-anuncios'), __html2 = new autogenerated.Element.tag('x-pagina-jogos'), __html3 = new autogenerated.Element.tag('x-pagina-membros'), __html4 = new autogenerated.Element.tag('x-pagina-equipas'), __html5 = new autogenerated.Element.tag('x-pagina-galeria'), __html6 = new autogenerated.Element.tag('x-pagina-forum'), __html7 = new autogenerated.Element.tag('x-pagina-inscricoes'), __html8 = new autogenerated.Element.tag('x-pagina-documentos'), __html9 = new autogenerated.Element.tag('x-pagina-contas');
  var __e0, __e1, __e11, __e13, __e15, __e17, __e19, __e21, __e3, __e5, __e7, __e9;
  var __t = new autogenerated.Template(_root);
  __e0 = _root.query('#__e-0');
  __t.component(new SiteHeader.forElement(__e0));
  __e1 = _root.query('#__e-1');
  __t.component(new SiteNavigation.forElement(__e1));
  __e3 = _root.query('#__e-3');
  __t.conditional(__e3, () => model.hash==''||model.hash.startsWith(NavLink.Clube.link), (__t) {
    var __e2;
    __e2 = __html0.clone(true);
    __t.component(new PaginaClube.forElement(__e2));
  __t.add(__e2);
  });

  __e5 = _root.query('#__e-5');
  __t.conditional(__e5, () => model.hash.startsWith(NavLink.Anuncios.link), (__t) {
    var __e4;
    __e4 = __html1.clone(true);
    __t.component(new PaginaAnuncios.forElement(__e4));
  __t.add(__e4);
  });

  __e7 = _root.query('#__e-7');
  __t.conditional(__e7, () => model.hash.startsWith(NavLink.Jogos.link), (__t) {
    var __e6;
    __e6 = __html2.clone(true);
    __t.component(new XPaginaJogos.forElement(__e6));
  __t.add(__e6);
  });

  __e9 = _root.query('#__e-9');
  __t.conditional(__e9, () => model.hash.startsWith(NavLink.Membros.link), (__t) {
    var __e8;
    __e8 = __html3.clone(true);
    __t.component(new PaginaMembros.forElement(__e8));
  __t.add(__e8);
  });

  __e11 = _root.query('#__e-11');
  __t.conditional(__e11, () => model.hash.startsWith(NavLink.Equipas.link), (__t) {
    var __e10;
    __e10 = __html4.clone(true);
    __t.component(new XPaginaEquipas.forElement(__e10));
  __t.add(__e10);
  });

  __e13 = _root.query('#__e-13');
  __t.conditional(__e13, () => model.hash.startsWith(NavLink.Galeria.link), (__t) {
    var __e12;
    __e12 = __html5.clone(true);
    __t.component(new PaginaGaleria.forElement(__e12));
  __t.add(__e12);
  });

  __e15 = _root.query('#__e-15');
  __t.conditional(__e15, () => model.hash.startsWith(NavLink.Forum.link), (__t) {
    var __e14;
    __e14 = __html6.clone(true);
    __t.component(new XPaginaForum.forElement(__e14));
  __t.add(__e14);
  });

  __e17 = _root.query('#__e-17');
  __t.conditional(__e17, () => model.hash.startsWith(NavLink.Inscricoes.link), (__t) {
    var __e16;
    __e16 = __html7.clone(true);
    __t.component(new XPaginaInscricoes.forElement(__e16));
  __t.add(__e16);
  });

  __e19 = _root.query('#__e-19');
  __t.conditional(__e19, () => model.hash.startsWith(NavLink.Documentos.link), (__t) {
    var __e18;
    __e18 = __html8.clone(true);
    __t.component(new XPaginaDocumentos.forElement(__e18));
  __t.add(__e18);
  });

  __e21 = _root.query('#__e-21');
  __t.conditional(__e21, () => model.hash.startsWith(NavLink.Contas.link), (__t) {
    var __e20;
    __e20 = __html9.clone(true);
    __t.component(new PaginaContas.forElement(__e20));
  __t.add(__e20);
  });

  __t.create();
  __t.insert();
}

//@ sourceMappingURL=model.dart.map