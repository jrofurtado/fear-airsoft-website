library model;

import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;

class Model{
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
  String selectednavlink;
}

final Model model = new Model();

void main() {
//  useShadowDom = true; // to enable use of experimental Shadow DOM in the browser
  updateFilters(e) {
    //viewModel.showIncomplete = window.location.hash != '#/completed';
    //viewModel.showDone = window.location.hash != '#/active';
    model.selectednavlink=window.location.hash;
    dispatch();
  }
  window.onHashChange.listen(updateFilters);
  window.onPopState.listen(updateFilters);
}

class NavLink {
  static final NavLink Clube = new NavLink("Clube","#/clube");
  static final NavLink Anuncios = new NavLink("Anuncios","#/anuncios");
  static final NavLink Jogos = new NavLink("Jogos", "#/jogos");
  static final NavLink Membros = new NavLink("Membros", "#/membros");
  static final NavLink Equipas = new NavLink("Equipas", "#/equipas");
  static final NavLink Galeria = new NavLink("Galeria", "#/galeria");
  static final NavLink Forum = new NavLink("Fórum", "#/forum.html");
  static final NavLink Inscricoes = new NavLink("Inscrições", "#/inscricoes");
  static final NavLink Documentos = new NavLink("Documentos", "#/documentos");
  static final NavLink Contas = new NavLink("Contas", "#/contas");
  String name;
  String link;
  
  NavLink(this.name, this.link);
}