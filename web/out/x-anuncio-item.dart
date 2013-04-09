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
  static final __html1 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a></a>\n            </div>'), __html2 = new autogenerated.Element.tag('template'), __html3 = new autogenerated.Element.html('<a><img class="anuncio-item-imagem"></a>'), __html4 = new autogenerated.Element.html('<div class="anuncio-item-title">\n              <a target="_blank"></a>\n            </div>'), __html5 = new autogenerated.Element.tag('template'), __html6 = new autogenerated.Element.html('<a target="_blank"><img class="anuncio-item-imagem"></a>'), __html7 = new autogenerated.Element.html('<div class="anuncio-item-title"></div>'), __html8 = new autogenerated.Element.tag('template'), __html9 = new autogenerated.Element.html('<img class="anuncio-item-imagem">'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="anuncio-item">
          <div class="anuncio-item-data"></div>         
          <template></template>
          <template></template>
          <template></template>
          <div class="anuncio-item-texto"><p></p></div>
          <div is="x-share"></div>         
        </div>
        <div class="divClearBoth"></div>
      ''');
  autogenerated.DivElement __e73, __e95;
  autogenerated.Element __e80, __e87, __e92;
  autogenerated.ParagraphElement __e94;
  autogenerated.Template __t;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e73 = _root.nodes[1].nodes[1];
    var __binding70 = __t.contentBind(() => anuncio['dia'], false);
    var __binding71 = __t.contentBind(() => anuncio['mes'], false);
    var __binding72 = __t.contentBind(() => anuncio['ano'], false);
    __e73.nodes.addAll([__binding70,
        new autogenerated.Text('/'),
        __binding71,
        new autogenerated.Text('/'),
        __binding72]);
    __e80 = _root.nodes[1].nodes[3];
    __t.conditional(__e80, () => relativeUrl, (__t) {
      var __e75, __e76, __e79;
      __e76 = __html1.clone(true);
      __e75 = __e76.nodes[1];
      var __binding74 = __t.contentBind(() => anuncio['titulo'], false);
      __e75.nodes.add(__binding74);
      __t.listen(__e75.onClick, ($event) { clickUrl(); });
      __t.oneWayBind(() => anuncio['url'], (e) { if (__e75.href != e) __e75.href = e; }, false, true);
      __e79 = __html2.clone(true);
      __t.conditional(__e79, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e77, __e78;
        __e78 = __html3.clone(true);
        __e77 = __e78.nodes[0];
        __t.oneWayBind(() => imagemUrl, (e) { if (__e77.src != e) __e77.src = e; }, false, true);
        __t.listen(__e78.onClick, ($event) { clickUrl(); });
        __t.oneWayBind(() => anuncio['url'], (e) { if (__e78.href != e) __e78.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e78,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e76,
        new autogenerated.Text('\n            '),
        __e79,
        new autogenerated.Text('         \n          ')]);
    });

    __e87 = _root.nodes[1].nodes[5];
    __t.conditional(__e87, () => absoluteUrl, (__t) {
      var __e82, __e83, __e86;
      __e83 = __html4.clone(true);
      __e82 = __e83.nodes[1];
      var __binding81 = __t.contentBind(() => anuncio['titulo'], false);
      __e82.nodes.add(__binding81);
      __t.oneWayBind(() => anuncio['url'], (e) { if (__e82.href != e) __e82.href = e; }, false, true);
      __e86 = __html5.clone(true);
      __t.conditional(__e86, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e84, __e85;
        __e85 = __html6.clone(true);
        __e84 = __e85.nodes[0];
        __t.oneWayBind(() => imagemUrl, (e) { if (__e84.src != e) __e84.src = e; }, false, true);
        __t.oneWayBind(() => anuncio['url'], (e) { if (__e85.href != e) __e85.href = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e85,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e83,
        new autogenerated.Text('\n            '),
        __e86,
        new autogenerated.Text('            \n          ')]);
    });

    __e92 = _root.nodes[1].nodes[7];
    __t.conditional(__e92, () => emptyUrl, (__t) {
      var __e89, __e91;
      __e89 = __html7.clone(true);
      var __binding88 = __t.contentBind(() => anuncio['titulo'], false);
      __e89.nodes.add(__binding88);
      __e91 = __html8.clone(true);
      __t.conditional(__e91, () => anuncio['imagemUrl'].length>0, (__t) {
        var __e90;
        __e90 = __html9.clone(true);
        __t.oneWayBind(() => imagemUrl, (e) { if (__e90.src != e) __e90.src = e; }, false, true);
      __t.addAll([new autogenerated.Text('\n              '),
          __e90,
          new autogenerated.Text('\n            ')]);
      });

    __t.addAll([new autogenerated.Text('\n            '),
        __e89,
        new autogenerated.Text('\n            '),
        __e91,
        new autogenerated.Text('\n          ')]);
    });

    __e94 = _root.nodes[1].nodes[9].nodes[0];
    var __binding93 = __t.contentBind(() => anuncio['texto'], false);
    __e94.nodes.add(__binding93);
    __e95 = _root.nodes[1].nodes[11];
    __t.oneWayBind(() => anuncio['texto'], (e) { if (__e95.xtag.descricao != e) __e95.xtag.descricao = e; }, false, false);
    __t.oneWayBind(() => imagemUrl, (e) { if (__e95.xtag.imagem != e) __e95.xtag.imagem = e; }, false, false);
    __t.oneWayBind(() => anuncio['titulo'], (e) { if (__e95.xtag.titulo != e) __e95.xtag.titulo = e; }, false, false);
    __t.oneWayBind(() => anuncio['url'], (e) { if (__e95.xtag.url != e) __e95.xtag.url = e; }, false, false);
    __t.component(new Share()..host = __e95);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e73 = __e80 = __e87 = __e92 = __e94 = __e95 = null;
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