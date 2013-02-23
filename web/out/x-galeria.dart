// Auto-generated from x-galeria.html.
// DO NOT EDIT.

library x_galeria;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import '../model.dart';
import 'x-share.dart';



class Galeria extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.AnchorElement __e149, __e156, __e157;
  autogenerated.Element __e152, __e155;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e150;

  Galeria.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="disabled">
          <div class="galeriaFotoFrame">
            <a class="closeWindow" id="__e-149">X</a>
            <x-share class="galeriaFotoShare" descricao="Galeria do Clube de Praticantes FEAR" id="__e-150"></x-share>
            <template id="__e-152"></template>
            <template id="__e-155"></template>
             <a class="galeriaFotoPrevious" id="__e-156"></a>
             <a class="galeriaFotoNext" id="__e-157"></a>
          </div>          
        </div>
      ''';
    __e149 = _root.query('#__e-149');
    __t.listen(__e149.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e149.href = e; }, false, true);
    __e150 = _root.query('#__e-150');
    __t.bind(() => null,  (__e) { __e150.xtag.descricao = 'Galeria do Clube de Praticantes FEAR'; }, true);
    __t.oneWayBind(() => imagemUrl, (e) { __e150.xtag.imagem = e; }, false, false);
    __t.bind(() => galeria['nomeCompleto'],  (__e) { __e150.xtag.titulo = 'Galeria ${__e.newValue}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { __e150.xtag.url = e; }, false, false);
    new Share.forElement(__e150);
    __t.component(__e150);
    __e152 = _root.query('#__e-152');
    __t.conditional(__e152, () => item['imagem'], (__t) {
      var __e151;
      __e151 = new autogenerated.Element.html('<img class="galeriaFotoImagem">');
      __t.oneWayBind(() => imagemUrl, (e) { __e151.src = e; }, false, true);
    __t.addAll([new autogenerated.Text('\n              '),
        __e151,
        new autogenerated.Text('\n            ')]);
    });

    __e155 = _root.query('#__e-155');
    __t.conditional(__e155, () => item['video'], (__t) {
      var __e153, __e154;
      __e153 = new autogenerated.Element.tag('template');
      __t.conditional(__e153, () => item['youtubeId']!='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

      __e154 = new autogenerated.Element.tag('template');
      __t.conditional(__e154, () => item['youtubeId']=='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

    __t.addAll([new autogenerated.Text('\n              '),
        __e153,
        new autogenerated.Text('\n              '),
        __e154,
        new autogenerated.Text('\n            ')]);
    });

    __e156 = _root.query('#__e-156');
    __t.listen(__e156.onClick, ($event) { clickPrevious(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e156.href = e; }, false, true);
    __e157 = _root.query('#__e-157');
    __t.listen(__e157.onClick, ($event) { clickNext(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e157.href = e; }, false, true);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e149 = __e150 = __e152 = __e155 = __e156 = __e157 = null;
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
    if(_index>=galeria["itens"].length-1)
      _index=0;
    else
      _index++;
  }
  clickPrevious(){
    if(_index<=0)
      _index=galeria["itens"].length-1;
    else
      _index--;
  }
  clickClose(){
    model.changePage("${NavLink.Galeria.link}");
  }
}
//@ sourceMappingURL=x-galeria.dart.map