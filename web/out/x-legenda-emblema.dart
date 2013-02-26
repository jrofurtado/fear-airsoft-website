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
  autogenerated.AnchorElement __e121;
  autogenerated.Element __e123, __e134;
  autogenerated.Template __t;

  LegendaEmblema.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="disabled">
        <div class="legenda fadeInRightBig animated">
          <a class="closeWindow" id="__e-121">X</a>          
          <template id="__e-123"></template>
          <template id="__e-134"></template>
          <div class="divClearBoth"></div>
        </div>
        </div>
      ''';
    __e121 = _root.query('#__e-121');
    __t.listen(__e121.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => model.href, (e) { __e121.href = e; }, false, true);
    __e123 = _root.query('#__e-123');
    __t.conditional(__e123, () => emblema==null, (__t) {
      var __e122;
      __e122 = new autogenerated.Element.tag('x-loading');
      new Loading.forElement(__e122);
      __t.component(__e122);
    __t.addAll([new autogenerated.Text('\n            '),
        __e122,
        new autogenerated.Text('\n          ')]);
    });

    __e134 = _root.query('#__e-134');
    __t.conditional(__e134, () => emblema!=null, (__t) {
      var __e124, __e125, __e127, __e129, __e131, __e133;
      __e125 = new autogenerated.Element.html('<div><img class="membro-emblema" id="__e-124"></div>');
      __e124 = __e125.query('#__e-124');
      __t.bind(() => emblema['imageName'],  (__e) { __e124.src = autogenerated.sanitizeUri('../emblemas/${__e.newValue}.png'); }, false);
      __t.oneWayBind(() => emblema['nome'], (e) { __e124.attributes['titulo'] = e; }, false, false);
      __e127 = new autogenerated.DivElement();
      var __binding126 = __t.contentBind(() => emblema['nome'], false);
      __e127.nodes.addAll([new autogenerated.Element.html('<strong>Nome:</strong>'),
          new autogenerated.Text(' '),
          __binding126]);
      __e129 = new autogenerated.DivElement();
      var __binding128 = __t.contentBind(() => emblema['tipo'], false);
      __e129.nodes.addAll([new autogenerated.Element.html('<strong>Tipo:</strong>'),
          new autogenerated.Text(' '),
          __binding128]);
      __e131 = new autogenerated.DivElement();
      var __binding130 = __t.contentBind(() => emblema['custoEstrela'], false);
      __e131.nodes.addAll([new autogenerated.Element.html('<strong>Custo por estela:</strong>'),
          new autogenerated.Text(' '),
          __binding130]);
      __e133 = new autogenerated.DivElement();
      var __binding132 = __t.contentBind(() => emblema['descricao'], false);
      __e133.nodes.addAll([new autogenerated.Element.html('<strong>Descrição:</strong>'),
          new autogenerated.Text(' '),
          __binding132]);
    __t.addAll([new autogenerated.Text('\n            '),
        __e125,
        new autogenerated.Text('\n            '),
        __e127,
        new autogenerated.Text('\n            '),
        __e129,
        new autogenerated.Text('\n            '),
        __e131,
        new autogenerated.Text('\n            '),
        __e133,
        new autogenerated.Text('\n          ')]);
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e121 = __e123 = __e134 = null;
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