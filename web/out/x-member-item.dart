// Auto-generated from x-member-item.html.
// DO NOT EDIT.

library x_member_item;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-membro-emblema.dart';
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';



class MemberItem extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<x-membro-emblema classe="item-emblema1"></x-membro-emblema>'), __html2 = new autogenerated.Element.html('<x-membro-emblema classe="item-emblema2"></x-membro-emblema>'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="item">
          <a id="__e-128"><img class="item-foto" id="__e-127"></a>
          <img class="item-patente" id="__e-129">
          <img class="item-equipa" id="__e-130">
          <template id="__e-132"></template>
          <template id="__e-134"></template>         
          <img class="item-memberActive" id="__e-135">
          <div class="item-nome">
            <a id="__e-138"></a>
          </div>
        </div>
      ''');
  autogenerated.AnchorElement __e128, __e138;
  autogenerated.Element __e132, __e134;
  autogenerated.ImageElement __e127, __e129, __e130, __e135;
  autogenerated.Template __t;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e128 = _root.query('#__e-128');
    __e127 = __e128.query('#__e-127');
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e127.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Fotos/100x100/${__e.newValue[1]}.jpg'); }, false);
    __t.listen(__e128.onClick, ($event) { click(); });
    __t.bind(() => membro['socio'],  (__e) { __e128.href = autogenerated.sanitizeUri('#/membros/${__e.newValue}'); }, false);
    __e129 = _root.query('#__e-129');
    __t.bind(() => membro['level'],  (__e) { __e129.src = autogenerated.sanitizeUri('../patentes/${__e.newValue}.png'); }, false);
    __t.oneWayBind(() => membro['rank'], (e) { if (__e129.title != e) __e129.title = e; }, false, false);
    __e130 = _root.query('#__e-130');
    __t.bind(() => [Model.endpoint_imagens, membro['teamName']],  (__e) { __e130.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Equipas/150x150/${__e.newValue[1]}.png'); }, false);
    __t.oneWayBind(() => membro['teamName'], (e) { if (__e130.title != e) __e130.title = e; }, false, false);
    __e132 = _root.query('#__e-132');
    __t.conditional(__e132, () => membro['achievementsGun'][0]['stars'] > 0, (__t) {
      var __e131;
      __e131 = __html1.clone(true);
      __t.oneWayBind(() => membro['achievementsGun'][0], (e) { if (__e131.xtag.achievement != e) __e131.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e131.xtag.classe = 'item-emblema1'; }, true);
      __t.bind(() => membro['achievementsGun'][0]['name'],  (__e) { __e131.xtag.titulo = 'Arma preferida: ${__e.newValue}'; }, false);
      __t.component(new MembroEmblema()..host = __e131);
    __t.addAll([new autogenerated.Text('             \n            '),
        __e131,
        new autogenerated.Text('\n          ')]);
    });

    __e134 = _root.query('#__e-134');
    __t.conditional(__e134, () => membro['achievementsRole'][0]['stars'] > 0, (__t) {
      var __e133;
      __e133 = __html2.clone(true);
      __t.oneWayBind(() => membro['achievementsRole'][0], (e) { if (__e133.xtag.achievement != e) __e133.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e133.xtag.classe = 'item-emblema2'; }, true);
      __t.bind(() => membro['achievementsRole'][0]['name'],  (__e) { __e133.xtag.titulo = 'Papel preferido: ${__e.newValue}'; }, false);
      __t.component(new MembroEmblema()..host = __e133);
    __t.addAll([new autogenerated.Text('\n            '),
        __e133,
        new autogenerated.Text('\n          ')]);
    });

    __e135 = _root.query('#__e-135');
    __t.bind(() => activoImg,  (__e) { __e135.src = autogenerated.sanitizeUri('../${__e.newValue}'); }, false);
    __t.oneWayBind(() => activoStr, (e) { if (__e135.title != e) __e135.title = e; }, false, false);
    __e138 = _root.query('#__e-138');
    var __binding136 = __t.contentBind(() => membro['rank'], false);
    var __binding137 = __t.contentBind(() => membro['name'], false);
    __e138.nodes.addAll([__binding136,
        new autogenerated.Text(' '),
        __binding137]);
    __t.listen(__e138.onClick, ($event) { click(); });
    __t.bind(() => membro['socio'],  (__e) { __e138.href = autogenerated.sanitizeUri('#/membros/${__e.newValue}'); }, false);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e128 = __e127 = __e129 = __e130 = __e132 = __e134 = __e135 = __e138 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Map membro;
  String get firstAndLastName{
    List<String> names = membro["name"].split(' ');
    return "${names[0]} ${names[names.length-1]}";
  }
  String get activoStr{
    return membro['quota']?"No activo":"Inactivo";
  }
  String get activoImg{
    return membro['quota']?"member_active.png":"member_inactive.png";
  }

  void click(){
    model.changePage("${NavLink.Membros.link}/${membro["socio"]}");
  }
}

//@ sourceMappingURL=x-member-item.dart.map