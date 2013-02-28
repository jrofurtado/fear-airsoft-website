// Auto-generated from x-pagina-galeria.html.
// DO NOT EDIT.

library x_pagina_galeria;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import '../model.dart';
import 'x-loading.html.dart';
import 'x-galeria.dart';
import 'x-galeria-folder.dart';



class PaginaGaleria extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.tag('x-loading'), __html2 = new autogenerated.Element.tag('x-galeria'), __html3 = new autogenerated.Element.tag('x-galeria-folder'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="pesquisa">
          <input type="text" placeholder="Pesquisar" id="__e-40">
          <input type="checkbox" id="__e-41"><span>Imagens</span>
          <input type="checkbox" id="__e-42"><span>Video</span>          
        </div>
        <div class="divClearBoth"></div>
        <template id="__e-44"></template>
        <template id="__e-46"></template>
        <div class="galeriaFolders"> 
          <template id="__e-48"></template>
          <div class="divClearBoth"></div>
        </div>
      ''');
  autogenerated.Element __e44, __e46, __e48;
  autogenerated.InputElement __e40, __e41, __e42;
  autogenerated.Template __t;

  PaginaGaleria.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e40 = _root.query('#__e-40');
    __t.listen(__e40.onInput, ($event) { pesquisa = __e40.value; });
    __t.oneWayBind(() => pesquisa, (e) { __e40.value = e; }, false, false);
    __e41 = _root.query('#__e-41');
    __t.listen(__e41.onChange, ($event) { imagens = __e41.checked; });
    __t.oneWayBind(() => imagens, (e) { __e41.checked = e; }, false, false);
    __e42 = _root.query('#__e-42');
    __t.listen(__e42.onChange, ($event) { video = __e42.checked; });
    __t.oneWayBind(() => video, (e) { __e42.checked = e; }, false, false);
    __e44 = _root.query('#__e-44');
    __t.conditional(__e44, () => model.galeria.length==0, (__t) {
      var __e43;
      __e43 = __html1.clone(true);
      new Loading.forElement(__e43);
      __t.component(__e43);
    __t.addAll([new autogenerated.Text('\n          '),
        __e43,
        new autogenerated.Text('\n        ')]);
    });

    __e46 = _root.query('#__e-46');
    __t.conditional(__e46, () => galeriaEscolhido!=null, (__t) {
      var __e45;
      __e45 = __html2.clone(true);
      __t.oneWayBind(() => galeriaEscolhido, (e) { __e45.xtag.galeria = e; }, false, false);
      new Galeria.forElement(__e45);
      __t.component(__e45);
    __t.addAll([new autogenerated.Text('\n          '),
        __e45,
        new autogenerated.Text('\n        ')]);
    });

    __e48 = _root.query('#__e-48');
    __t.loop(__e48, () => resultados, (galeria, __t) {
      var __e47;
      __e47 = __html3.clone(true);
      __t.oneWayBind(() => galeria, (e) { __e47.xtag.galeria = e; }, false, false);
      new GaleriaFolder.forElement(__e47);
      __t.component(__e47);
    __t.addAll([new autogenerated.Text('\n            '),
        __e47,
        new autogenerated.Text('\n          ')]);
    });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e40 = __e41 = __e42 = __e44 = __e46 = __e48 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  String pesquisa="";
  bool imagens = true;
  bool video = true;

  List<Map> get resultados{
    String lpesquisa = pesquisa.toLowerCase();
    var res = model.galeria.where((galeria) => ((video&&galeria["video"])||(imagens&&galeria["imagem"]))&&galeria["nomeCompleto"].toLowerCase().contains(lpesquisa));
    return res.toList();
  }
  Map get galeriaEscolhido{
    List<String> params = model.hash.split("/");
    if(params.length>=3){
      String decoded = decodeUriComponent(params.elementAt(2));
      var res = model.galeria.where((galeria) => galeria["nomeCompleto"] == decoded);
      if(res.isEmpty) {
        return null;
      }
      return res.first;
    }
    return null;
  }
}
//@ sourceMappingURL=x-pagina-galeria.dart.map