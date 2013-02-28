// Auto-generated from x-member-item.html.
// DO NOT EDIT.

library x_member_item;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';
import 'x-membro-emblema.dart';



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
          <a id="__e-136"><img class="item-foto" id="__e-135"></a>
          <img class="item-patente" id="__e-137">
          <img class="item-equipa" id="__e-138">
          <template id="__e-140"></template>
          <template id="__e-142"></template>         
          <img class="item-memberActive" id="__e-143">
          <div class="item-nome">
            <a id="__e-146"></a>
          </div>
        </div>
      ''');
  autogenerated.AnchorElement __e136, __e146;
  autogenerated.Element __e140, __e142;
  autogenerated.ImageElement __e135, __e137, __e138, __e143;
  autogenerated.Template __t;

  MemberItem.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e136 = _root.query('#__e-136');
    __e135 = __e136.query('#__e-135');
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e135.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Fotos/100x100/${__e.newValue[1]}.jpg'); }, false);
    __t.listen(__e136.onClick, ($event) { click(); });
    __t.bind(() => membro['socio'],  (__e) { __e136.href = autogenerated.sanitizeUri('#/membros/${__e.newValue}'); }, false);
    __e137 = _root.query('#__e-137');
    __t.bind(() => membro['level'],  (__e) { __e137.src = autogenerated.sanitizeUri('../patentes/${__e.newValue}.png'); }, false);
    __t.oneWayBind(() => membro['rank'], (e) { __e137.title = e; }, false, false);
    __e138 = _root.query('#__e-138');
    __t.bind(() => [Model.endpoint_imagens, membro['teamName']],  (__e) { __e138.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Equipas/150x150/${__e.newValue[1]}.png'); }, false);
    __t.oneWayBind(() => membro['teamName'], (e) { __e138.title = e; }, false, false);
    __e140 = _root.query('#__e-140');
    __t.conditional(__e140, () => membro['achievementsGun'][0]['stars'] > 0, (__t) {
      var __e139;
      __e139 = __html1.clone(true);
      __t.oneWayBind(() => membro['achievementsGun'][0], (e) { __e139.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e139.xtag.classe = 'item-emblema1'; }, true);
      __t.bind(() => membro['achievementsGun'][0]['name'],  (__e) { __e139.xtag.titulo = 'Arma preferida: ${__e.newValue}'; }, false);
      new MembroEmblema.forElement(__e139);
      __t.component(__e139);
    __t.addAll([new autogenerated.Text('             \n            '),
        __e139,
        new autogenerated.Text('\n          ')]);
    });

    __e142 = _root.query('#__e-142');
    __t.conditional(__e142, () => membro['achievementsRole'][0]['stars'] > 0, (__t) {
      var __e141;
      __e141 = __html2.clone(true);
      __t.oneWayBind(() => membro['achievementsRole'][0], (e) { __e141.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e141.xtag.classe = 'item-emblema2'; }, true);
      __t.bind(() => membro['achievementsRole'][0]['name'],  (__e) { __e141.xtag.titulo = 'Papel preferido: ${__e.newValue}'; }, false);
      new MembroEmblema.forElement(__e141);
      __t.component(__e141);
    __t.addAll([new autogenerated.Text('\n            '),
        __e141,
        new autogenerated.Text('\n          ')]);
    });

    __e143 = _root.query('#__e-143');
    __t.bind(() => activoImg,  (__e) { __e143.src = autogenerated.sanitizeUri('../${__e.newValue}'); }, false);
    __t.oneWayBind(() => activoStr, (e) { __e143.title = e; }, false, false);
    __e146 = _root.query('#__e-146');
    var __binding144 = __t.contentBind(() => membro['rank'], false);
    var __binding145 = __t.contentBind(() => membro['name'], false);
    __e146.nodes.addAll([__binding144,
        new autogenerated.Text(' '),
        __binding145]);
    __t.listen(__e146.onClick, ($event) { click(); });
    __t.bind(() => membro['socio'],  (__e) { __e146.href = autogenerated.sanitizeUri('#/membros/${__e.newValue}'); }, false);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e136 = __e135 = __e137 = __e138 = __e140 = __e142 = __e143 = __e146 = null;
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