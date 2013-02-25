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
  autogenerated.Element __e51, __e53, __e55;
  autogenerated.InputElement __e47, __e48, __e49;
  autogenerated.Template __t;

  PaginaGaleria.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="pesquisa">
          <input type="text" placeholder="Pesquisar" id="__e-47">
          <input type="checkbox" id="__e-48"><span>Imagens</span>
          <input type="checkbox" id="__e-49"><span>Video</span>          
        </div>
        <div class="divClearBoth"></div>
        <template id="__e-51"></template>
        <template id="__e-53"></template>
        <div class="galeriaFolders"> 
          <template id="__e-55"></template>
          <div class="divClearBoth"></div>
        </div>
      ''';
    __e47 = _root.query('#__e-47');
    __t.listen(__e47.onInput, ($event) { pesquisa = __e47.value; });
    __t.oneWayBind(() => pesquisa, (e) { __e47.value = e; }, false, false);
    __e48 = _root.query('#__e-48');
    __t.listen(__e48.onChange, ($event) { imagens = __e48.checked; });
    __t.oneWayBind(() => imagens, (e) { __e48.checked = e; }, false, false);
    __e49 = _root.query('#__e-49');
    __t.listen(__e49.onChange, ($event) { video = __e49.checked; });
    __t.oneWayBind(() => video, (e) { __e49.checked = e; }, false, false);
    __e51 = _root.query('#__e-51');
    __t.conditional(__e51, () => model.galeria.length==0, (__t) {
      var __e50;
      __e50 = new autogenerated.Element.tag('x-loading');
      new Loading.forElement(__e50);
      __t.component(__e50);
    __t.addAll([new autogenerated.Text('\n          '),
        __e50,
        new autogenerated.Text('\n        ')]);
    });

    __e53 = _root.query('#__e-53');
    __t.conditional(__e53, () => galeriaEscolhido!=null, (__t) {
      var __e52;
      __e52 = new autogenerated.Element.tag('x-galeria');
      __t.oneWayBind(() => galeriaEscolhido, (e) { __e52.xtag.galeria = e; }, false, false);
      new Galeria.forElement(__e52);
      __t.component(__e52);
    __t.addAll([new autogenerated.Text('\n          '),
        __e52,
        new autogenerated.Text('\n        ')]);
    });

    __e55 = _root.query('#__e-55');
    __t.loop(__e55, () => resultados, (galeria, __t) {
      var __e54;
      __e54 = new autogenerated.Element.tag('x-galeria-folder');
      __t.oneWayBind(() => galeria, (e) { __e54.xtag.galeria = e; }, false, false);
      new GaleriaFolder.forElement(__e54);
      __t.component(__e54);
    __t.addAll([new autogenerated.Text('\n            '),
        __e54,
        new autogenerated.Text('\n          ')]);
    });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e47 = __e48 = __e49 = __e51 = __e53 = __e55 = null;
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
      if(res.isEmpty)
        return null;
      return res.first;
    }
    return null;
  }
}
//@ sourceMappingURL=x-pagina-galeria.dart.map