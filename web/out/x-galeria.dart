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
  autogenerated.AnchorElement __e112, __e119, __e120;
  autogenerated.Element __e115, __e118;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e113;

  Galeria.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="disabled">
          <div class="galeriaFotoFrame">
            <a class="closeWindow" id="__e-112">X</a>
            <x-share class="galeriaFotoShare" descricao="Galeria do Clube de Praticantes FEAR" id="__e-113"></x-share>
            <template id="__e-115"></template>
            <template id="__e-118"></template>
             <a class="galeriaFotoPrevious" id="__e-119"></a>
             <a class="galeriaFotoNext" id="__e-120"></a>
          </div>          
        </div>
      ''';
    __e112 = _root.query('#__e-112');
    __t.listen(__e112.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e112.href = e; }, false, true);
    __e113 = _root.query('#__e-113');
    __t.bind(() => null,  (__e) { __e113.xtag.descricao = 'Galeria do Clube de Praticantes FEAR'; }, true);
    __t.oneWayBind(() => imagemUrl, (e) { __e113.xtag.imagem = e; }, false, false);
    __t.bind(() => galeria['nomeCompleto'],  (__e) { __e113.xtag.titulo = 'Galeria ${__e.newValue}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { __e113.xtag.url = e; }, false, false);
    new Share.forElement(__e113);
    __t.component(__e113);
    __e115 = _root.query('#__e-115');
    __t.conditional(__e115, () => item['imagem'], (__t) {
      var __e114;
      __e114 = new autogenerated.Element.html('<img class="galeriaFotoImagem">');
      __t.oneWayBind(() => imagemUrl, (e) { __e114.src = e; }, false, true);
    __t.addAll([new autogenerated.Text('\n              '),
        __e114,
        new autogenerated.Text('\n            ')]);
    });

    __e118 = _root.query('#__e-118');
    __t.conditional(__e118, () => item['video'], (__t) {
      var __e116, __e117;
      __e116 = new autogenerated.Element.tag('template');
      __t.conditional(__e116, () => item['youtubeId']!='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

      __e117 = new autogenerated.Element.tag('template');
      __t.conditional(__e117, () => item['youtubeId']=='', (__t) {
      __t.add(new autogenerated.Text('\n              \n              '));
      });

    __t.addAll([new autogenerated.Text('\n              '),
        __e116,
        new autogenerated.Text('\n              '),
        __e117,
        new autogenerated.Text('\n            ')]);
    });

    __e119 = _root.query('#__e-119');
    __t.listen(__e119.onClick, ($event) { clickPrevious(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e119.href = e; }, false, true);
    __e120 = _root.query('#__e-120');
    __t.listen(__e120.onClick, ($event) { clickNext(); });
    __t.oneWayBind(() => NavLink.Galeria.link, (e) { __e120.href = e; }, false, true);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e112 = __e113 = __e115 = __e118 = __e119 = __e120 = null;
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