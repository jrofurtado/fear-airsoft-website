// Auto-generated from x-galeria.html.
// DO NOT EDIT.

library x_galeria;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-share.dart';
import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import 'model.dart';



class Galeria extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<img class="galeriaFotoImagem">'), __html2 = new autogenerated.Element.tag('template'), __html3 = new autogenerated.Element.tag('template'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="disabled">
          <div class="galeriaFotoFrame">
            <a class="closeWindow" id="__e-186">X</a>
            <x-share class="galeriaFotoShare" descricao="Galeria do Clube de Praticantes FEAR" id="__e-187"></x-share>
            <template id="__e-189"></template>
            <template id="__e-192"></template>
             <a class="galeriaFotoPrevious" id="__e-193"></a>
             <a class="galeriaFotoNext" id="__e-194"></a>
          </div>          
        </div>
      ''');
  autogenerated.AnchorElement __e186, __e193, __e194;
  autogenerated.Element __e189, __e192;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e187;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e186 = _root.query('#__e-186');
    __t.listen(__e186.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { if (__e186.href != e) __e186.href = e; }, false, true);
    __e187 = _root.query('#__e-187');
    __t.bind(() => null,  (__e) { __e187.xtag.descricao = 'Galeria do Clube de Praticantes FEAR'; }, true);
    __t.oneWayBind(() => imagemUrl, (e) { if (__e187.xtag.imagem != e) __e187.xtag.imagem = e; }, false, false);
    __t.bind(() => galeria['nomeCompleto'],  (__e) { __e187.xtag.titulo = 'Galeria ${__e.newValue}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { if (__e187.xtag.url != e) __e187.xtag.url = e; }, false, false);
    __t.component(new Share()..host = __e187);
    __e189 = _root.query('#__e-189');
    __t.conditional(__e189, () => item['imagem'], (__t) {
      var __e188;
      __e188 = __html1.clone(true);
      __t.oneWayBind(() => imagemUrl, (e) { if (__e188.src != e) __e188.src = e; }, false, true);
    __t.addAll([new autogenerated.Text('\n              '),
        __e188,
        new autogenerated.Text('\n            ')]);
    });

    __e192 = _root.query('#__e-192');
    __t.conditional(__e192, () => item['video'], (__t) {
      var __e190, __e191;
      __e190 = __html2.clone(true);
      __t.conditional(__e190, () => item['youtubeId']!='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

      __e191 = __html3.clone(true);
      __t.conditional(__e191, () => item['youtubeId']=='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

    __t.addAll([new autogenerated.Text('\n              '),
        __e190,
        new autogenerated.Text('\n              '),
        __e191,
        new autogenerated.Text('\n            ')]);
    });

    __e193 = _root.query('#__e-193');
    __t.listen(__e193.onClick, ($event) { clickPrevious(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { if (__e193.href != e) __e193.href = e; }, false, true);
    __e194 = _root.query('#__e-194');
    __t.listen(__e194.onClick, ($event) { clickNext(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { if (__e194.href != e) __e194.href = e; }, false, true);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e186 = __e187 = __e189 = __e192 = __e193 = __e194 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Map galeria;
  int _index=0;
  Map get item => galeria["itens"].elementAt(_index);
  String get imagemUrl => "${Model.endpoint_imagens}Galeria/${galeria['ano']}/${galeria['folder']}/${item['nome']}";

  clickNext(){
    if(_index>=galeria["itens"].length-1) {
      _index=0;
    } else {
      _index++;
    }
  }
  clickPrevious(){
    if(_index<=0) {
      _index=galeria["itens"].length-1;
    } else {
      _index--;
    }
  }
  clickClose(){
    model.changePage("${NavLink.Galeria.link}");
  }
}
//@ sourceMappingURL=x-galeria.dart.map