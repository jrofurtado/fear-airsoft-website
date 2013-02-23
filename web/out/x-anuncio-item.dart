// Auto-generated from x-anuncio-item.html.
// DO NOT EDIT.

library x_anuncio_item;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';
import 'x-share.dart';



class AnuncioItem extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.DivElement __e78;
  autogenerated.Element __e85, __e92, __e97;
  autogenerated.ParagraphElement __e99;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e100;

  AnuncioItem.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="anuncio-item">
          <div class="anuncio-item-data" id="__e-78"></div>         
          <template id="__e-85"></template>
          <template id="__e-92"></template>
          <template id="__e-97"></template>
          <div class="anuncio-item-texto"><p id="__e-99"></p></div>
          <x-share id="__e-100"></x-share>         
        </div>
        <div class="divClearBoth"></div>
      ''';
    __e78 = _root.query('#__e-78');
    var __binding75 = __t.contentBind(() => anuncio['dia'], false);
    var __binding76 = __t.contentBind(() => anuncio['mes'], false);
    var __binding77 = __t.contentBind(() => anuncio['ano'], false);
    __e78.nodes.addAll([__binding75,
        new autogenerated.Text('/'),
        __binding76,
        new autogenerated.Text('/'),
        __binding77]);
    __e85 = _root.query('#__e-85');
    __t.conditional(__e85, () => relativeUrl, (__t) {
      var __e80, __e81, __e84;
      __e81 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a id="__e-80"></a>\n            </div>');
      __e80 = __e81.query('#__e-80');
      var __binding79 = __t.contentBind(() => anuncio['titulo'], false);
      __e80.nodes.add(__binding79);
      __t.listen(__e80.onClick, ($event) { clickUrl(); });
      __t.oneWayBind(() => anuncio['url'], (e) { __e80.href = e; }, false, true);
      __e84 = new autogenerated.Element.tag('template');
      __t.conditional(__e84, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e82, __e83;
        __e83 = new autogenerated.Element.html('<a><img class="anuncio-item-imagem" id="__e-82"></a>');
        __e82 = __e83.query('#__e-82');
        __t.oneWayBind(() => imagemUrl, (e) { __e82.src = e; }, false, true);
        __t.listen(__e83.onClick, ($event) { clickUrl(); });
        __t.oneWayBind(() => anuncio['url'], (e) { __e83.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e83,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e81,
        new autogenerated.Text('\n            '),
        __e84,
        new autogenerated.Text('         \n          ')]);
    });

    __e92 = _root.query('#__e-92');
    __t.conditional(__e92, () => absoluteUrl, (__t) {
      var __e87, __e88, __e91;
      __e88 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a target="_blank" id="__e-87"></a>\n            </div>');
      __e87 = __e88.query('#__e-87');
      var __binding86 = __t.contentBind(() => anuncio['titulo'], false);
      __e87.nodes.add(__binding86);
      __t.oneWayBind(() => anuncio['url'], (e) { __e87.href = e; }, false, true);
      __e91 = new autogenerated.Element.tag('template');
      __t.conditional(__e91, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e89, __e90;
        __e90 = new autogenerated.Element.html('<a target="_blank"><img class="anuncio-item-imagem" id="__e-89"></a>');
        __e89 = __e90.query('#__e-89');
        __t.oneWayBind(() => imagemUrl, (e) { __e89.src = e; }, false, true);
        __t.oneWayBind(() => anuncio['url'], (e) { __e90.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e90,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e88,
        new autogenerated.Text('\n            '),
        __e91,
        new autogenerated.Text('            \n          ')]);
    });

    __e97 = _root.query('#__e-97');
    __t.conditional(__e97, () => emptyUrl, (__t) {
      var __e94, __e96;
      __e94 = new autogenerated.Element.html('<div class="anuncio-item-title"></div>');
      var __binding93 = __t.contentBind(() => anuncio['titulo'], false);
      __e94.nodes.add(__binding93);
      __e96 = new autogenerated.Element.tag('template');
      __t.conditional(__e96, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e95;
        __e95 = new autogenerated.Element.html('<img class="anuncio-item-imagem">');
        __t.oneWayBind(() => imagemUrl, (e) { __e95.src = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e95,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e94,
        new autogenerated.Text('\n            '),
        __e96,
        new autogenerated.Text('\n          ')]);
    });

    __e99 = _root.query('#__e-99');
    var __binding98 = __t.contentBind(() => anuncio['texto'], false);
    __e99.nodes.add(__binding98);
    __e100 = _root.query('#__e-100');
    __t.oneWayBind(() => anuncio['texto'], (e) { __e100.xtag.descricao = e; }, false, false);
    __t.oneWayBind(() => imagemUrl, (e) { __e100.xtag.imagem = e; }, false, false);
    __t.oneWayBind(() => anuncio['titulo'], (e) { __e100.xtag.titulo = e; }, false, false);
    __t.oneWayBind(() => anuncio['url'], (e) { __e100.xtag.url = e; }, false, false);
    new Share.forElement(__e100);
    __t.component(__e100);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e78 = __e85 = __e92 = __e97 = __e99 = __e100 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Map anuncio;
  String get imagemUrl{
    if(anuncio["imagemExterna"])
      return anuncio["imagemUrl"];
    else
      return Model.endpoint_imagens.concat(anuncio["imagemUrl"]);
  }
  bool get relativeUrl{
    return anuncio["url"].startsWith("#/");
  }
  bool get absoluteUrl{
    return !emptyUrl&&!relativeUrl;
  }
  bool get emptyUrl{
    return anuncio["url"].length==0;
  }
  void clickUrl(){
    model.changePage(anuncio["url"]);
  }
}

//@ sourceMappingURL=x-anuncio-item.dart.map