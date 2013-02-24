// Auto-generated from x-legenda-emblema.html.
// DO NOT EDIT.

library x_legenda_emblema;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';
import 'x-loading.html.dart';



class LegendaEmblema extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.AnchorElement __e155;
  autogenerated.Element __e157, __e168;
  autogenerated.Template __t;

  LegendaEmblema.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="disabled">
        <div class="legenda fadeInRightBig animated">
          <a class="closeWindow" id="__e-155">X</a>          
          <template id="__e-157"></template>
          <template id="__e-168"></template>
          <div class="divClearBoth"></div>
        </div>
        </div>
      ''';
    __e155 = _root.query('#__e-155');
    __t.listen(__e155.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => model.href, (e) { __e155.href = e; }, false, true);
    __e157 = _root.query('#__e-157');
    __t.conditional(__e157, () => emblema==null, (__t) {
      var __e156;
      __e156 = new autogenerated.Element.tag('x-loading');
      new Loading.forElement(__e156);
      __t.component(__e156);
    __t.addAll([new autogenerated.Text('\n            '),
        __e156,
        new autogenerated.Text('\n          ')]);
    });

    __e168 = _root.query('#__e-168');
    __t.conditional(__e168, () => emblema!=null, (__t) {
      var __e158, __e159, __e161, __e163, __e165, __e167;
      __e159 = new autogenerated.Element.html('<div><img class="membro-emblema" id="__e-158"></div>');
      __e158 = __e159.query('#__e-158');
      __t.bind(() => emblema['imageName'],  (__e) { __e158.src = autogenerated.sanitizeUri('../emblemas/${__e.newValue}.png'); }, false);
      __t.oneWayBind(() => emblema['nome'], (e) { __e158.attributes['titulo'] = e; }, false, false);
      __e161 = new autogenerated.DivElement();
      var __binding160 = __t.contentBind(() => emblema['nome'], false);
      __e161.nodes.addAll([new autogenerated.Element.html('<strong>Nome:</strong>'),
          new autogenerated.Text(' '),
          __binding160]);
      __e163 = new autogenerated.DivElement();
      var __binding162 = __t.contentBind(() => emblema['tipo'], false);
      __e163.nodes.addAll([new autogenerated.Element.html('<strong>Tipo:</strong>'),
          new autogenerated.Text(' '),
          __binding162]);
      __e165 = new autogenerated.DivElement();
      var __binding164 = __t.contentBind(() => emblema['custoEstrela'], false);
      __e165.nodes.addAll([new autogenerated.Element.html('<strong>Custo por estela:</strong>'),
          new autogenerated.Text(' '),
          __binding164]);
      __e167 = new autogenerated.DivElement();
      var __binding166 = __t.contentBind(() => emblema['descricao'], false);
      __e167.nodes.addAll([new autogenerated.Element.html('<strong>Descrição:</strong>'),
          new autogenerated.Text(' '),
          __binding166]);
    __t.addAll([new autogenerated.Text('\n            '),
        __e159,
        new autogenerated.Text('\n            '),
        __e161,
        new autogenerated.Text('\n            '),
        __e163,
        new autogenerated.Text('\n            '),
        __e165,
        new autogenerated.Text('\n            '),
        __e167,
        new autogenerated.Text('\n          ')]);
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e155 = __e157 = __e168 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  String nome;
  Map get emblema{
    if(nome!=null){
      var res = model.emblemas['emblemas'].where((emblema) => emblema["nome"] == nome);
      if(res.isEmpty)
        return null;
      return res.first;
    }
    return null;
  }
  void clickClose(){
    model.emblemaSeleccionado = null;
  }
}
//@ sourceMappingURL=x-legenda-emblema.dart.map