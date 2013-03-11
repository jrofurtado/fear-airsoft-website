// Auto-generated from x-jogo.html.
// DO NOT EDIT.

library x_jogo;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'x-participante.dart';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:google_maps/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';
import 'dart:html';
import 'dart:async';
import 'model.dart';



class Jogo extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<div class="clearBoth"></div>'), __html10 = new autogenerated.Element.html('<span class="fakeLink">expandir descrição</span>'), __html2 = new autogenerated.Element.html('<div><img id="__e-94"></div>'), __html3 = new autogenerated.Element.html('<div>\n                <span class="" id="__e-98"></span>\n                <br>\n                <span class="" id="__e-100"></span>\n                <br>\n                <span class="" id="__e-102"></span>\n                <br>\n                <span class="copyrightReference">Powered by <a href="http://www.worldweatheronline.com/" title="Free local weather content provider" target="_blank">World Weather Online</a></span>        \n              </div>'), __html4 = new autogenerated.Element.html('<div>              \n                <template id="__e-107"></template>  \n              </div>'), __html5 = new autogenerated.Element.tag('x-participante'), __html6 = new autogenerated.Element.html('<div>              \n                <template id="__e-112"></template>  \n              </div>'), __html7 = new autogenerated.Element.tag('x-participante'), __html8 = new autogenerated.Element.html('<div>              \n                <template id="__e-117"></template>\n              </div>'), __html9 = new autogenerated.Element.tag('x-participante'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="proximoJogo">
          <div>
            <div id="map_canvas" class="mapSmall"></div>
            <div><a target="_blank" id="__e-93">Obter direcções para o local de estacionamento</a></div>
          </div>
          <div class="weather">
            <template id="__e-104"></template>
          </div>
          <div class="participantes">
            <template id="__e-109"></template>
            <template id="__e-114"></template>
            <template id="__e-119"></template>
          </div>
          <span style="white-space: pre-wrap" id="__e-121"></span>
          <template id="__e-123"></template>
        </div>
      ''');
  autogenerated.AnchorElement __e93;
  autogenerated.DivElement __map_canvas;
  autogenerated.Element __e104, __e109, __e114, __e119, __e123;
  autogenerated.SpanElement __e121;
  autogenerated.Template __t;

  Jogo.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __map_canvas = _root.query('#map_canvas');
    __e93 = _root.query('#__e-93');
    __t.bind(() => [model.jogo[0]['campo']['estacionamentoLat'], model.jogo[0]['campo']['estacionamentoLng']],  (__e) { __e93.href = autogenerated.sanitizeUri('https://maps.google.com/maps?daddr=${__e.newValue[0]},${__e.newValue[1]}'); }, false);
    __e104 = _root.query('#__e-104');
    __t.conditional(__e104, () => model.jogo[0]['tempo']!=null, (__t) {
      var __e100, __e102, __e103, __e94, __e95, __e98;
      __e95 = __html2.clone(true);
      __e94 = __e95.query('#__e-94');
      __t.oneWayBind(() => model.jogo[0]['tempo']['weatherIconUrl'][0]['value'], (e) { __e94.src = e; }, false, true);
      __e103 = __html3.clone(true);
      __e98 = __e103.query('#__e-98');
      var __binding96 = __t.contentBind(() => model.jogo[0]['tempo']['tempMinC'], false);
      var __binding97 = __t.contentBind(() => model.jogo[0]['tempo']['tempMaxC'], false);
      __e98.nodes.addAll([__binding96,
          new autogenerated.Text('º C - '),
          __binding97,
          new autogenerated.Text('º C')]);
      __t.bindClass(__e98, () => temperaturaClass, false);
      __e100 = __e103.query('#__e-100');
      var __binding99 = __t.contentBind(() => model.jogo[0]['tempo']['precipMM'], false);
      __e100.nodes.addAll([new autogenerated.Text('Precipitação: '),
          __binding99,
          new autogenerated.Text(' mm')]);
      __t.bindClass(__e100, () => precipitacaoClass, false);
      __e102 = __e103.query('#__e-102');
      var __binding101 = __t.contentBind(() => model.jogo[0]['tempo']['windspeedKmph'], false);
      __e102.nodes.addAll([new autogenerated.Text('Vento (Km/h): '),
          __binding101,
          new autogenerated.Text(' Km/h')]);
      __t.bindClass(__e102, () => ventoClass, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e95,
        new autogenerated.Text('\n              '),
        __e103,
        new autogenerated.Text('\n              '),
        __html1.clone(true),
        new autogenerated.Text('\n            ')]);
    });

    __e109 = _root.query('#__e-109');
    __t.conditional(__e109, () => participantesSimNumero>0, (__t) {
      var __e107, __e108;
      var __binding105 = __t.contentBind(() => participantesSimNumero, false);
      __e108 = __html4.clone(true);
      __e107 = __e108.query('#__e-107');
      __t.loop(__e107, () => participantesSim, (participante, __t) {
        var __e106;
        __e106 = __html5.clone(true);
        __t.oneWayBind(() => participante, (e) { __e106.xtag.participante = e; }, false, false);
        __t.component(new Participante.forElement(__e106));
      __t.addAll([new autogenerated.Text('\n                  '),
          __e106,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('  \n              Presentes: '),
        __binding105,
        new autogenerated.Text('\n              '),
        __e108,
        new autogenerated.Text('\n            ')]);
    });

    __e114 = _root.query('#__e-114');
    __t.conditional(__e114, () => participantesNao.length>0, (__t) {
      var __e112, __e113;
      var __binding110 = __t.contentBind(() => participantesNao.length, false);
      __e113 = __html6.clone(true);
      __e112 = __e113.query('#__e-112');
      __t.loop(__e112, () => participantesNao, (participante, __t) {
        var __e111;
        __e111 = __html7.clone(true);
        __t.oneWayBind(() => participante, (e) { __e111.xtag.participante = e; }, false, false);
        __t.component(new Participante.forElement(__e111));
      __t.addAll([new autogenerated.Text('\n                  '),
          __e111,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('\n              Ausentes: '),
        __binding110,
        new autogenerated.Text('\n              '),
        __e113,
        new autogenerated.Text('\n            ')]);
    });

    __e119 = _root.query('#__e-119');
    __t.conditional(__e119, () => participantesTalvez.length>0, (__t) {
      var __e117, __e118;
      var __binding115 = __t.contentBind(() => participantesTalvez.length, false);
      __e118 = __html8.clone(true);
      __e117 = __e118.query('#__e-117');
      __t.loop(__e117, () => participantesTalvez, (participante, __t) {
        var __e116;
        __e116 = __html9.clone(true);
        __t.oneWayBind(() => participante, (e) { __e116.xtag.participante = e; }, false, false);
        __t.component(new Participante.forElement(__e116));
      __t.addAll([new autogenerated.Text('\n                  '),
          __e116,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('\n              Talvez: '),
        __binding115,
        new autogenerated.Text('\n              '),
        __e118,
        new autogenerated.Text('\n            ')]);
    });

    __e121 = _root.query('#__e-121');
    var __binding120 = __t.contentBind(() => descricaoJogo, false);
    __e121.nodes.add(__binding120);
    __e123 = _root.query('#__e-123');
    __t.conditional(__e123, () => descricaoExpansivel, (__t) {
      var __e122;
      __e122 = __html10.clone(true);
      __t.listen(__e122.onClick, ($event) { clickExpandirDescricao(); });
    __t.addAll([new autogenerated.Text('\n            '),
        __e122,
        new autogenerated.Text('\n          ')]);
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __map_canvas = __e93 = __e104 = __e109 = __e114 = __e119 = __e121 = __e123 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  bool descricaoExpandida=false;
  String get temperaturaClass{
    if(double.parse(model.jogo[0]["tempo"]["tempMinC"])<5) {
      return "red";
    }
    if(double.parse(model.jogo[0]["tempo"]["tempMaxC"])>=35) {
      return "red";
    }
    if(double.parse(model.jogo[0]["tempo"]["tempMinC"])<10) {
      return "yellow";
    }
    if(double.parse(model.jogo[0]["tempo"]["tempMaxC"])>=30) {
      return "yellow";
    }
    return "";
  }
  String get precipitacaoClass{
    if(double.parse(model.jogo[0]["tempo"]["precipMM"])>=4) { //Chuva intensa (http://wiki.sandaysoft.com/a/Rain_measurement#Standard_.28graduated_cylinder.29Rain_Gauge)
        return "red";
    }
    if(double.parse(model.jogo[0]["tempo"]["precipMM"])>=1) { //Chuva moderada
      return "yellow";
    }
    return "";
  }
  String get ventoClass{
    if(double.parse(model.jogo[0]["tempo"]["windspeedKmph"])>=45) { //Vento intenso (http://library.thinkquest.org/C003603/english/hurricanes/hurricanewind.shtml)
        return "red";
    }
    if(double.parse(model.jogo[0]["tempo"]["windspeedKmph"])>=25) { //Vento moderado
      return "yellow";
    }
    return "";
  }
  int get participantesSimNumero{
    int total = 0;
    for(Map participante in participantesSim)
      total += 1 + participante["additionalGuests"];
    return total;
  }
  List<Map> get participantesSim{
    var res = model.jogo[0]["participantes"].where((participante) => (participante["responseStatus"]=="accepted"));
    return res.toList();
    //Map x = model.jogo[0]["participantes"][0];return [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x];
  }
  List<Map> get participantesNao{
    var res = model.jogo[0]["participantes"].where((participante) => (participante["responseStatus"]=="declined"));
    return res.toList();
  }
  List<Map> get participantesTalvez{
    var res = model.jogo[0]["participantes"].where((participante) => (participante["responseStatus"]=="tentative"));
    return res.toList();
  }
  int numCharsDescricaoNaoExpandida = 500;
  bool get descricaoExpansivel{
    return model.jogo[0]['descricao'].length>numCharsDescricaoNaoExpandida&&!descricaoExpandida;
  }
  String get descricaoJogo{
    if(descricaoExpandida)
      return model.jogo[0]['descricao'];
    else
      return model.jogo[0]['descricao'].substring(0, numCharsDescricaoNaoExpandida).concat("...");
  }
  
  void clickExpandirDescricao(){
    descricaoExpandida = true;
  }

  void inserted() {
    if(model.jogo.length>0){
      js.scoped(() {
        final mapOptions = new MapOptions()
          ..zoom = 12
          ..center = new LatLng(model.jogo[0]['campo']['lat'],model.jogo[0]['campo']['lng'])
          ..mapTypeId = MapTypeId.ROADMAP;
        var canvas= query("#map_canvas");
        final map = new GMap(canvas, mapOptions);
        final estacionamentoMarker = new Marker(new MarkerOptions()
          ..title = "Estacionamento"
          ..zIndex = 1
          ..position = new LatLng(model.jogo[0]['campo']['estacionamentoLat'],model.jogo[0]['campo']['estacionamentoLng'])
          ..map = map
          ..icon = '../estacionamento.png');
        final flagMarker = new Marker(new MarkerOptions()
          ..title = "Campo"
          ..zIndex = 2
          ..position = new LatLng(model.jogo[0]['campo']['lat'],model.jogo[0]['campo']['lng'])
          ..map = map
          ..icon = '../flag.png');
      });
    }
  }
}
//@ sourceMappingURL=x-jogo.dart.map