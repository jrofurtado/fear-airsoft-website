// Auto-generated from x-pagina-galeria.html.
// DO NOT EDIT.

library x_pagina_galeria;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-loading.html.dart';
import 'x-galeria.dart';
import 'x-galeria-folder.dart';
import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import 'model.dart';



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
          <input type="text" placeholder="Pesquisar" id="__e-54">
          <input type="checkbox" id="__e-55"><span>Imagens</span>
          <input type="checkbox" id="__e-56"><span>Video</span>          
        </div>
        <div class="divClearBoth"></div>
        <template id="__e-58"></template>
        <template id="__e-60"></template>
        <div class="galeriaFolders"> 
          <template id="__e-62"></template>
          <div class="divClearBoth"></div>
        </div>
      ''');
  autogenerated.Element __e58, __e60, __e62;
  autogenerated.InputElement __e54, __e55, __e56;
  autogenerated.Template __t;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e54 = _root.query('#__e-54');
    __t.listen(__e54.onInput, ($event) { pesquisa = __e54.value; });
    __t.oneWayBind(() => pesquisa, (e) { if (__e54.value != e) __e54.value = e; }, false, false);
    __e55 = _root.query('#__e-55');
    __t.listen(__e55.onChange, ($event) { imagens = __e55.checked; });
    __t.oneWayBind(() => imagens, (e) { if (__e55.checked != e) __e55.checked = e; }, false, false);
    __e56 = _root.query('#__e-56');
    __t.listen(__e56.onChange, ($event) { video = __e56.checked; });
    __t.oneWayBind(() => video, (e) { if (__e56.checked != e) __e56.checked = e; }, false, false);
    __e58 = _root.query('#__e-58');
    __t.conditional(__e58, () => model.galeria.length==0, (__t) {
      var __e57;
      __e57 = __html1.clone(true);
      __t.component(new XLoading()..host = __e57);
    __t.addAll([new autogenerated.Text('\n          '),
        __e57,
        new autogenerated.Text('\n        ')]);
    });

    __e60 = _root.query('#__e-60');
    __t.conditional(__e60, () => galeriaEscolhido!=null, (__t) {
      var __e59;
      __e59 = __html2.clone(true);
      __t.oneWayBind(() => galeriaEscolhido, (e) { if (__e59.xtag.galeria != e) __e59.xtag.galeria = e; }, false, false);
      __t.component(new Galeria()..host = __e59);
    __t.addAll([new autogenerated.Text('\n          '),
        __e59,
        new autogenerated.Text('\n        ')]);
    });

    __e62 = _root.query('#__e-62');
    __t.loop(__e62, () => resultados, (galeria, __t) {
      var __e61;
      __e61 = __html3.clone(true);
      __t.oneWayBind(() => galeria, (e) { if (__e61.xtag.galeria != e) __e61.xtag.galeria = e; }, false, false);
      __t.component(new GaleriaFolder()..host = __e61);
    __t.addAll([new autogenerated.Text('\n            '),
        __e61,
        new autogenerated.Text('\n          ')]);
    });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e54 = __e55 = __e56 = __e58 = __e60 = __e62 = null;
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