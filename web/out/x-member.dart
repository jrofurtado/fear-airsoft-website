// Auto-generated from x-member.html.
// DO NOT EDIT.

library x_member;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-xp.dart';
import 'x-membro-emblema.dart';
import 'x-share.dart';
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';



class Member extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-148"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-149">\n              </div>'), __html2 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-152"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-153">\n              </div>'), __html3 = new autogenerated.Element.html('<div class="membro-divEmblema">\n                <x-membro-emblema classe="membro-emblema" id="__e-156"></x-membro-emblema>\n                <img class="membro-estrela" id="__e-157">\n              </div>'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="disabled">
        <div class="membro fadeInRightBig animated">
          <a class="closeWindow" id="__e-139">X</a>
          <img class="membro-foto" id="__e-140">
          <img class="membro-memberActive" id="__e-141">
          <img class="membro-patente" id="__e-142">
          <img class="membro-equipa" id="__e-143">
          <x-xp id="__e-144"></x-xp>
          <div class="membro-nome"><p id="__e-147"></p></div>
          <div class="membro-emblemas">
            <template id="__e-151"></template>
          </div>
          <div class="membro-emblemas">
            <template id="__e-155"></template>
          </div>
          <div class="membro-emblemas">
            <template id="__e-159"></template>
          </div>
          <div class="divClearBoth"></div>
          <x-share id="__e-160"></x-share>          
        </div>
        </div>
      ''');
  autogenerated.AnchorElement __e139;
  autogenerated.Element __e151, __e155, __e159;
  autogenerated.ImageElement __e140, __e141, __e142, __e143;
  autogenerated.ParagraphElement __e147;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e144, __e160;

  Member.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e139 = _root.query('#__e-139');
    __t.listen(__e139.onClick, ($event) { clickClose(); });
    __t.oneWayBind(() => NavLink.Membros.link, (e) { __e139.href = e; }, false, true);
    __e140 = _root.query('#__e-140');
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e140.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Fotos/384x418/${__e.newValue[1]}.jpg'); }, false);
    __e141 = _root.query('#__e-141');
    __t.bind(() => activoImg,  (__e) { __e141.src = autogenerated.sanitizeUri('../${__e.newValue}'); }, false);
    __t.oneWayBind(() => activoStr, (e) { __e141.title = e; }, false, false);
    __e142 = _root.query('#__e-142');
    __t.bind(() => membro['level'],  (__e) { __e142.src = autogenerated.sanitizeUri('../patentes/${__e.newValue}.png'); }, false);
    __t.oneWayBind(() => membro['rank'], (e) { __e142.title = e; }, false, false);
    __e143 = _root.query('#__e-143');
    __t.bind(() => [Model.endpoint_imagens, membro['teamName']],  (__e) { __e143.src = autogenerated.sanitizeUri('${__e.newValue[0]}/Equipas/150x150/${__e.newValue[1]}.png'); }, false);
    __t.oneWayBind(() => membro['teamName'], (e) { __e143.title = e; }, false, false);
    __e144 = _root.query('#__e-144');
    __t.oneWayBind(() => membro, (e) { __e144.xtag.membro = e; }, false, false);
    __t.component(new Xp.forElement(__e144));
    __e147 = _root.query('#__e-147');
    var __binding145 = __t.contentBind(() => membro['rank'], false);
    var __binding146 = __t.contentBind(() => membro['name'], false);
    __e147.nodes.addAll([__binding145,
        new autogenerated.Text(' '),
        __binding146]);
    __e151 = _root.query('#__e-151');
    __t.loop(__e151, () => membro['achievementsGun'], (achievement, __t) {
      var __e148, __e149, __e150;
      __e150 = __html1.clone(true);
      __e148 = __e150.query('#__e-148');
      __t.oneWayBind(() => achievement, (e) { __e148.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e148.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e148.xtag.titulo = e; }, false, false);
      __t.component(new MembroEmblema.forElement(__e148));
      __e149 = __e150.query('#__e-149');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e149.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e149.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e150,
        new autogenerated.Text('\n            ')]);
    });
    __e155 = _root.query('#__e-155');
    __t.loop(__e155, () => membro['achievementsRole'], (achievement, __t) {
      var __e152, __e153, __e154;
      __e154 = __html2.clone(true);
      __e152 = __e154.query('#__e-152');
      __t.oneWayBind(() => achievement, (e) { __e152.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e152.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e152.xtag.titulo = e; }, false, false);
      __t.component(new MembroEmblema.forElement(__e152));
      __e153 = __e154.query('#__e-153');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e153.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e153.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e154,
        new autogenerated.Text('\n            ')]);
    });
    __e159 = _root.query('#__e-159');
    __t.loop(__e159, () => membro['achievementsSpecial'], (achievement, __t) {
      var __e156, __e157, __e158;
      __e158 = __html3.clone(true);
      __e156 = __e158.query('#__e-156');
      __t.oneWayBind(() => achievement, (e) { __e156.xtag.achievement = e; }, false, false);
      __t.bind(() => null,  (__e) { __e156.xtag.classe = 'membro-emblema'; }, true);
      __t.oneWayBind(() => achievement['name'], (e) { __e156.xtag.titulo = e; }, false, false);
      __t.component(new MembroEmblema.forElement(__e156));
      __e157 = __e158.query('#__e-157');
      __t.bind(() => achievement['stars'].toInt(),  (__e) { __e157.src = autogenerated.sanitizeUri('../estrelas/${__e.newValue}s.png'); }, false);
      __t.oneWayBind(() => achievement['name'], (e) { __e157.attributes['titulo'] = e; }, false, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e158,
        new autogenerated.Text('\n            ')]);
    });
    __e160 = _root.query('#__e-160');
    __t.oneWayBind(() => descricaoShare, (e) { __e160.xtag.descricao = e; }, false, false);
    __t.bind(() => [Model.endpoint_imagens, membro['socio']],  (__e) { __e160.xtag.imagem = '${__e.newValue[0]}/Fotos/384x418/${__e.newValue[1]}.jpg'; }, false);
    __t.bind(() => [membro['rank'], membro['name']],  (__e) { __e160.xtag.titulo = '${__e.newValue[0]} ${__e.newValue[1]}'; }, false);
    __t.oneWayBind(() => model.hash, (e) { __e160.xtag.url = e; }, false, false);
    __t.component(new Share.forElement(__e160));
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e139 = __e140 = __e141 = __e142 = __e143 = __e144 = __e147 = __e151 = __e155 = __e159 = __e160 = null;
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