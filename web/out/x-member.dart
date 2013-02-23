// Auto-generated from x-member.html.
// DO NOT EDIT.

library x_member;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';
import 'x-xp.dart';
import 'x-membro-emblema.dart';
import 'x-share.dart';



class Member extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.AnchorElement __e127;
  autogenerated.Element __e139, __e143, __e147;
  autogenerated.ImageElement __e128, __e129, __e130, __e131;
  autogenerated.ParagraphElement __e135;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e132, __e148;

  Member.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="disabled">
        <div class="membro fadeInRightBig animated">
          <a class="closeWindow" id="__e-127">X</a>
          <img class="membro-foto" id="__e-128">
          <img class="membro-memberActive" id="__e-129">
          <img class="membro-patente" id="__e-130">
          <img class="membro-equipa" id="__e-131">
          <x-xp id="__e-132"></x-xp>
          <div class="membro-nome"><p id="__e-135"></p></div>
          <div class="membro-emblemas">
            <template id="__e-139"></template>
          </div>
          <div class="membro-emblemas">
            <template id="__e-143"></template>
          </div>
          <div class="membro-emblemas">
            <template id="__e-147"></template>
          </div>
          <div class="divClearBoth"></div>
          <x-share id="__e-148"></x-share>          
        </div>
        </div>
      ''';
    __e127 = _root.query('#__e-127');
    __t.listen(__e127.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Membros.link, (e) { __e127.href = e; }, false, true);
    __e128 = _root.query('#__e-128');
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e128.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Fotos/384x418/${__e.newValue[1]}.jpg'); }, false);
    __e129 = _root.query('#__e-129');
    __t.bind(() => activoImg,  (__e) { __e129.src = autogenerated.sanitizeUri('../${__e.newValue}'); }, false);
    __t.oneWayBind(() => activoStr, (e) { __e129.title = e; }, false, false);
    __e130 = _root.query('#__e-130');
    __t.bind(() => membro['level'],  (__e) { __e130.src = autogenerated.sanitizeUri('../patentes/${__e.newValue}.png'); }, false);
    __t.oneWayBind(() => membro['rank'], (e) { __e130.title = e; }, false, false);
    __e131 = _root.query('#__e-131');
    __t.bind(() => [Model.endpoint_imagens, membro['teamName']],  (__e) { __e131.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Equipas/150x150/${__e.newValue[1]}.png'); }, false);
    __t.oneWayBind(() => membro['teamName'], (e) { __e131.title = e; }, false, false);
    __e132 = _root.query('#__e-132');
    __t.oneWayBind(() => membro, (e) { __e132.xtag.membro = e; }, false, false);
    new Xp.forElement(__e132);
    __t.component(__e132);
    __e135 = _root.query('#__e-135');
    var __binding133 = __t.contentBind(() => membro['rank'], false);
    var __binding134 = __t.contentBind(() => membro['name'], false);
    __e135.nodes.addAll([__binding133,
        new autogenerated.Text(' '),
        __binding134]);
    __e139 = _root.query('#__e-139');
    __t.loop(__e139, () => membro['achievementsGun'], (achievement, __t) {
      var __e136, __e137, __e138;
      __e138 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-136"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-137">\n              </div>');
      __e136 = __e138.query('#__e-136');
      __t.oneWayBind(() => achievement, (e) { __e136.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e136.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e136.xtag.titulo = e; }, false, false);
      new MembroEmblema.forElement(__e136);
      __t.component(__e136);
      __e137 = __e138.query('#__e-137');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e137.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e137.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e138,
        new autogenerated.Text('\n            ')]);
    });
    __e143 = _root.query('#__e-143');
    __t.loop(__e143, () => membro['achievementsRole'], (achievement, __t) {
      var __e140, __e141, __e142;
      __e142 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-140"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-141">\n              </div>');
      __e140 = __e142.query('#__e-140');
      __t.oneWayBind(() => achievement, (e) { __e140.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e140.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e140.xtag.titulo = e; }, false, false);
      new MembroEmblema.forElement(__e140);
      __t.component(__e140);
      __e141 = __e142.query('#__e-141');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e141.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e141.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e142,
        new autogenerated.Text('\n            ')]);
    });
    __e147 = _root.query('#__e-147');
    __t.loop(__e147, () => membro['achievementsSpecial'], (achievement, __t) {
      var __e144, __e145, __e146;
      __e146 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-144"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-145">\n              </div>');
      __e144 = __e146.query('#__e-144');
      __t.oneWayBind(() => achievement, (e) { __e144.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e144.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e144.xtag.titulo = e; }, false, false);
      new MembroEmblema.forElement(__e144);
      __t.component(__e144);
      __e145 = __e146.query('#__e-145');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e145.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e145.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e146,
        new autogenerated.Text('\n            ')]);
    });
    __e148 = _root.query('#__e-148');
    __t.oneWayBind(() => descricaoShare, (e) { __e148.xtag.descricao = e; }, false, false);
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e148.xtag.imagem = '${__e.newValue[0]}/Fotos/384x418/${__e.newValue[1]}.jpg'; }, false);
    __t.bind(() => [membro['rank'], membro['name']],  (__e) { __e148.xtag.titulo = '${__e.newValue[0]} ${__e.newValue[1]}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { __e148.xtag.url = e; }, false, false);
    new Share.forElement(__e148);
    __t.component(__e148);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e127 = __e128 = __e129 = __e130 = __e131 = __e132 = __e135 = __e139 = __e143 = __e147 = __e148 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  Map membro;
  
  String get activoStr{
    return membro['quota']?"No activo":"Inactivo";
  }
  String get activoImg{
    return membro['quota']?"member_active.png":"member_inactive.png";
  }
  String get descricaoShare{
    String emblemasTxt="";
    for(Map a in membro['achievementsGun']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    for(Map a in membro['achievementsRole']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    for(Map a in membro['achievementsSpecial']){
      emblemasTxt="${emblemasTxt}\n${a['name']}: ${a['stars'].toInt()}/5";
    }
    return "Nivel: ${membro['level']}\nPatente: ${membro['rank']}\nEquipe: ${membro['teamName']}\nExperiencia: ${membro['xp']}/${membro['nextLevelXp']}${emblemasTxt}";
  }
  void clickClose(){
    model.changePage("${NavLink.Membros.link}");
  }
}
//@ sourceMappingURL=x-member.dart.map