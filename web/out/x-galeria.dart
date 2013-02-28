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
  static final __html1 = new autogenerated.Element.html('<img class="galeriaFotoImagem">'), __html2 = new autogenerated.Element.tag('template'), __html3 = new autogenerated.Element.tag('template'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="disabled">
          <div class="galeriaFotoFrame">
            <a class="closeWindow" id="__e-115">X</a>
            <x-share class="galeriaFotoShare" descricao="Galeria do Clube de Praticantes FEAR" id="__e-116"></x-share>
            <template id="__e-118"></template>
            <template id="__e-121"></template>
             <a class="galeriaFotoPrevious" id="__e-122"></a>
             <a class="galeriaFotoNext" id="__e-123"></a>
          </div>          
        </div>
      ''');
  autogenerated.AnchorElement __e115, __e122, __e123;
  autogenerated.Element __e118, __e121;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e116;

  Galeria.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e115 = _root.query('#__e-115');
    __t.listen(__e115.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e115.href = e; }, false, true);
    __e116 = _root.query('#__e-116');
    __t.bind(() => null,  (__e) { __e116.xtag.descricao = 'Galeria do Clube de Praticantes FEAR'; }, true);
    __t.oneWayBind(() => imagemUrl, (e) { __e116.xtag.imagem = e; }, false, false);
    __t.bind(() => galeria['nomeCompleto'],  (__e) { __e116.xtag.titulo = 'Galeria ${__e.newValue}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { __e116.xtag.url = e; }, false, false);
    new Share.forElement(__e116);
    __t.component(__e116);
    __e118 = _root.query('#__e-118');
    __t.conditional(__e118, () => item['imagem'], (__t) {
      var __e117;
      __e117 = __html1.clone(true);
      __t.oneWayBind(() => imagemUrl, (e) { __e117.src = e; }, false, true);
    __t.addAll([new autogenerated.Text('\n              '),
        __e117,
        new autogenerated.Text('\n            ')]);
    });

    __e121 = _root.query('#__e-121');
    __t.conditional(__e121, () => item['video'], (__t) {
      var __e119, __e120;
      __e119 = __html2.clone(true);
      __t.conditional(__e119, () => item['youtubeId']!='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

      __e120 = __html3.clone(true);
      __t.conditional(__e120, () => item['youtubeId']=='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

    __t.addAll([new autogenerated.Text('\n              '),
        __e119,
        new autogenerated.Text('\n              '),
        __e120,
        new autogenerated.Text('\n            ')]);
    });

    __e122 = _root.query('#__e-122');
    __t.listen(__e122.onClick, ($event) { clickPrevious(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e122.href = e; }, false, true);
    __e123 = _root.query('#__e-123');
    __t.listen(__e123.onClick, ($event) { clickNext(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e123.href = e; }, false, true);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e115 = __e116 = __e118 = __e121 = __e122 = __e123 = null;
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