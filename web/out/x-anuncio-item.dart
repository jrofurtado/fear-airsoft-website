// Auto-generated from x-anuncio-item.html.
// DO NOT EDIT.

library x_anuncio_item;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-share.dart';
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';



class AnuncioItem extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a id="__e-72"></a>\n            </div>'), __html2 = new autogenerated.Element.tag('template'), __html3 = new autogenerated.Element.html('<a><img class="anuncio-item-imagem" id="__e-74"></a>'), __html4 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a target="_blank" id="__e-79"></a>\n            </div>'), __html5 = new autogenerated.Element.tag('template'), __html6 = new autogenerated.Element.html('<a target="_blank"><img class="anuncio-item-imagem" id="__e-81"></a>'), __html7 = new autogenerated.Element.html('<div class="anuncio-item-title"></div>'), __html8 = new autogenerated.Element.tag('template'), __html9 = new autogenerated.Element.html('<img class="anuncio-item-imagem">'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="anuncio-item">
          <div class="anuncio-item-data" id="__e-70"></div>         
          <template id="__e-77"></template>
          <template id="__e-84"></template>
          <template id="__e-89"></template>
          <div class="anuncio-item-texto"><p id="__e-91"></p></div>
          <x-share id="__e-92"></x-share>         
        </div>
        <div class="divClearBoth"></div>
      ''');
  autogenerated.DivElement __e70;
  autogenerated.Element __e77, __e84, __e89;
  autogenerated.ParagraphElement __e91;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e92;

  AnuncioItem.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e70 = _root.query('#__e-70');
    var __binding67 = __t.contentBind(() => anuncio['dia'], false);
    var __binding68 = __t.contentBind(() => anuncio['mes'], false);
    var __binding69 = __t.contentBind(() => anuncio['ano'], false);
    __e70.nodes.addAll([__binding67,
        new autogenerated.Text('/'),
        __binding68,
        new autogenerated.Text('/'),
        __binding69]);
    __e77 = _root.query('#__e-77');
    __t.conditional(__e77, () => relativeUrl, (__t) {
      var __e72, __e73, __e76;
      __e73 = __html1.clone(true);
      __e72 = __e73.query('#__e-72');
      var __binding71 = __t.contentBind(() => anuncio['titulo'], false);
      __e72.nodes.add(__binding71);
      __t.listen(__e72.onClick, ($event) { clickUrl(); });
      __t.oneWayBind(() => anuncio['url'], (e) { __e72.href = e; }, false, true);
      __e76 = __html2.clone(true);
      __t.conditional(__e76, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e74, __e75;
        __e75 = __html3.clone(true);
        __e74 = __e75.query('#__e-74');
        __t.oneWayBind(() => imagemUrl, (e) { __e74.src = e; }, false, true);
        __t.listen(__e75.onClick, ($event) { clickUrl(); });
        __t.oneWayBind(() => anuncio['url'], (e) { __e75.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e75,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e73,
        new autogenerated.Text('\n            '),
        __e76,
        new autogenerated.Text('         \n          ')]);
    });

    __e84 = _root.query('#__e-84');
    __t.conditional(__e84, () => absoluteUrl, (__t) {
      var __e79, __e80, __e83;
      __e80 = __html4.clone(true);
      __e79 = __e80.query('#__e-79');
      var __binding78 = __t.contentBind(() => anuncio['titulo'], false);
      __e79.nodes.add(__binding78);
      __t.oneWayBind(() => anuncio['url'], (e) { __e79.href = e; }, false, true);
      __e83 = __html5.clone(true);
      __t.conditional(__e83, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e81, __e82;
        __e82 = __html6.clone(true);
        __e81 = __e82.query('#__e-81');
        __t.oneWayBind(() => imagemUrl, (e) { __e81.src = e; }, false, true);
        __t.oneWayBind(() => anuncio['url'], (e) { __e82.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e82,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e80,
        new autogenerated.Text('\n            '),
        __e83,
        new autogenerated.Text('            \n          ')]);
    });

    __e89 = _root.query('#__e-89');
    __t.conditional(__e89, () => emptyUrl, (__t) {
      var __e86, __e88;
      __e86 = __html7.clone(true);
      var __binding85 = __t.contentBind(() => anuncio['titulo'], false);
      __e86.nodes.add(__binding85);
      __e88 = __html8.clone(true);
      __t.conditional(__e88, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e87;
        __e87 = __html9.clone(true);
        __t.oneWayBind(() => imagemUrl, (e) { __e87.src = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e87,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e86,
        new autogenerated.Text('\n            '),
        __e88,
        new autogenerated.Text('\n          ')]);
    });

    __e91 = _root.query('#__e-91');
    var __binding90 = __t.contentBind(() => anuncio['texto'], false);
    __e91.nodes.add(__binding90);
    __e92 = _root.query('#__e-92');
    __t.oneWayBind(() => anuncio['texto'], (e) { __e92.xtag.descricao = e; }, false, false);
    __t.oneWayBind(() => imagemUrl, (e) { __e92.xtag.imagem = e; }, false, false);
    __t.oneWayBind(() => anuncio['titulo'], (e) { __e92.xtag.titulo = e; }, false, false);
    __t.oneWayBind(() => anuncio['url'], (e) { __e92.xtag.url = e; }, false, false);
    __t.component(new Share.forElement(__e92));
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e70 = __e77 = __e84 = __e89 = __e91 = __e92 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Map anuncio;
  String get imagemUrl{
    if(anuncio["imagemExterna"]) {
      return anuncio["imagemUrl"];
    } else {
      return Model.endpoint_imagens.concat(anuncio["imagemUrl"]);
    }
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