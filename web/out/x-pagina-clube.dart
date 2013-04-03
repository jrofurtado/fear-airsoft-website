// Auto-generated from x-pagina-clube.html.
// DO NOT EDIT.

library x_pagina_clube;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-widget.dart';
import 'x-jogo.dart';
import 'x-loading.html.dart';
import 'x-anuncio-item.dart';
import 'package:web_ui/web_ui.dart';
import 'model.dart';



class PaginaClube extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<x-widget tamanho="large" titulo="Próximo Jogo">\n            Não há jogos marcados\n          </x-widget>'), __html2 = new autogenerated.Element.html('<x-widget tamanho="large">\n            <x-jogo id="__e-28"></x-jogo>\n          </x-widget>'), __html3 = new autogenerated.Element.tag('x-loading'), __html4 = new autogenerated.Element.tag('x-anuncio-item'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <x-widget tamanho="small" titulo="Contacto" id="__e-24">
          <a href="mailto:contacto@fear-airsoft.com">contacto@fear-airsoft.com</a>
          <br>
          <a href="tel:+351965415905">+351 965 415 905</a>
          <br>
          <a href="tel:+351962535853">+351 962 535 853</a>
          <br>
        </x-widget>
        <x-widget tamanho="small" titulo="Redes Sociais" id="__e-25">
          <div class="fb-like" data-href="http://www.fear-airsoft.com" data-send="false" data-width="300" data-show-faces="true" data-font="arial"></div>
          <br><br>
          <div class="g-plusone" data-annotation="inline" data-width="300" data-href="http://www.fear-airsoft.com"></div>          
        </x-widget>
        <template id="__e-27"></template>  
        <template id="__e-30"></template>
        <x-widget tamanho="small" titulo="Anúncios Recentes" id="__e-35">
          <template id="__e-32"></template>
          <template id="__e-34"></template>
        </x-widget>
        <x-widget tamanho="small" titulo="História" id="__e-36">
          <p>
Foi no ano de 2010 que um grupo de amigos teve conhecimento da modalidade airsoft.<br>
Começaram por combinar jogos com outras equipas de praticantes com mais experiência, tendo posteriormente organizado jogos apenas entre amigos.<br>
<br>
Com a experiência acumulada e com o número de elementos a crescer, viu-se a necessidade de ser criada uma equipa de forma a reunir o grupo para de forma organizada participar em jogos e realizar jogos de equipa.<br> 
<br>
Assim nasceu a equipa FEAR - Força Especial de Airsoft Regional.<br> 
<br>
No decorrer do ano de 2011, a equipa FEAR já com um número considerável de elementos e com a participação e realização de jogos semanais tinha marcado posição no panorama do airsoft nos Açores, nomeadamente em São Miguel. Com um estilo próprio de jogo mais orientado para a ação do que o MILSIM (Simulação Realista de Táticas Militares) praticado pela grande maioria das equipas na região, consegue captar mais praticantes para a sua equipa.<br> 
<br>
Com este crescimento a equipa FEAR começou a ponderar a criação de um clube de praticantes de airsoft de forma a facilitar a inscrição dos elementos numa APD (Associação de Promoção Desportiva) e para uma divulgação e aplicação mais cuidada, a todos os seus elementos, da lei existente para a modalidade.<br> 
<br>
Após tratada toda a vertente burocrática da criação do clube este foi oficialmente criado em assembleia – geral a 19 de Outubro de 2011 com a aprovação dos seus estatutos.<br> 
<br>
A 12 de Dezembro de 2011, e após cumpridos todos os passos necessários, o clube FEAR recebe o seu certificado Instituto do Desporto de Portugal, IP, reconhecendo oficialmente o clube de praticantes FEAR.<br> 
<br>
No inicio de 2012, o clube de praticantes FEAR inscreve-se na Associação Lusitana de Airsoft, APD como clube pertencente a esta associação, fazendo com que todos os seus elementos passassem a cumprir o ponto 3, do artigo 11 da Lei 17/2009.<br> 
<br>
O clube de praticantes FEAR tem como principal objetivo a promoção do airsoft na ilha de São Miguel nos Açores, permitindo aos seus associados a prática da modalidade, cumprindo os preceitos legais para o efeito.
          </p>
        </x-widget>    
      ''');
  autogenerated.Element __e27, __e30, __e32, __e34;
  autogenerated.Template __t;
  autogenerated.UnknownElement __e24, __e25, __e35, __e36;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e24 = _root.query('#__e-24');
    __t.bind(() => null,  (__e) { __e24.xtag.tamanho = 'small'; }, true);
    __t.bind(() => null,  (__e) { __e24.xtag.titulo = 'Contacto'; }, true);
    __t.component(new Widget()..host = __e24);
    __e25 = _root.query('#__e-25');
    __t.bind(() => null,  (__e) { __e25.xtag.tamanho = 'small'; }, true);
    __t.bind(() => null,  (__e) { __e25.xtag.titulo = 'Redes Sociais'; }, true);
    __t.component(new Widget()..host = __e25);
    __e27 = _root.query('#__e-27');
    __t.conditional(__e27, () => model.jogo.length==0, (__t) {
      var __e26;
      __e26 = __html1.clone(true);
      __t.bind(() => null,  (__e) { __e26.xtag.tamanho = 'large'; }, true);
      __t.bind(() => null,  (__e) { __e26.xtag.titulo = 'Próximo Jogo'; }, true);
      __t.component(new Widget()..host = __e26);
    __t.addAll([new autogenerated.Text('\n          '),
        __e26,
        new autogenerated.Text('\n        ')]);
    });

    __e30 = _root.query('#__e-30');
    __t.conditional(__e30, () => model.jogo.length>0, (__t) {
      var __e28, __e29;
      __e29 = __html2.clone(true);
      __e28 = __e29.query('#__e-28');
      __t.component(new Jogo()..host = __e28);
      __t.bind(() => null,  (__e) { __e29.xtag.tamanho = 'large'; }, true);
      __t.bind(() => [model.jogo[0]['nome'], model.jogo[0]['dia'], model.jogo[0]['mes'], model.jogo[0]['ano']],  (__e) { __e29.xtag.titulo = '${__e.newValue[0]} ${__e.newValue[1]}/${__e.newValue[2]}/${__e.newValue[3]}'; }, false);
      __t.component(new Widget()..host = __e29);
    __t.addAll([new autogenerated.Text('\n          '),
        __e29,
        new autogenerated.Text('\n        ')]);
    });

    __e35 = _root.query('#__e-35');
    __e32 = __e35.query('#__e-32');
    __t.conditional(__e32, () => anunciosRecentes.length==0, (__t) {
      var __e31;
      __e31 = __html3.clone(true);
      __t.component(new XLoading()..host = __e31);
    __t.addAll([new autogenerated.Text('\n            '),
        __e31,
        new autogenerated.Text('\n          ')]);
    });

    __e34 = __e35.query('#__e-34');
    __t.loop(__e34, () => anunciosRecentes, (anuncio, __t) {
      var __e33;
      __e33 = __html4.clone(true);
      __t.oneWayBind(() => anuncio, (e) { if (__e33.xtag.anuncio != e) __e33.xtag.anuncio = e; }, false, false);
      __t.component(new AnuncioItem()..host = __e33);
    __t.addAll([new autogenerated.Text('\n            '),
        __e33,
        new autogenerated.Text('\n          ')]);
    });
    __t.bind(() => null,  (__e) { __e35.xtag.tamanho = 'small'; }, true);
    __t.bind(() => null,  (__e) { __e35.xtag.titulo = 'Anúncios Recentes'; }, true);
    __t.component(new Widget()..host = __e35);
    __e36 = _root.query('#__e-36');
    __t.bind(() => null,  (__e) { __e36.xtag.tamanho = 'small'; }, true);
    __t.bind(() => null,  (__e) { __e36.xtag.titulo = 'História'; }, true);
    __t.component(new Widget()..host = __e36);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e24 = __e25 = __e27 = __e30 = __e35 = __e32 = __e34 = __e36 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  List<Map> get anunciosRecentes{
    List<Map> result = [];
    int i = 0;
    for(Map a in model.anuncios){
      i++;
      result.add(a);
      if(i==5) {
        break;
      }
    }
    return result;
  }
}
//@ sourceMappingURL=x-pagina-clube.dart.map