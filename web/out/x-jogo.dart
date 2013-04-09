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
  static final __html1 = new autogenerated.Element.html('<div class="clearBoth"></div>'), __html10 = new autogenerated.Element.html('<span class="fakeLink">expandir descrição</span>'), __html2 = new autogenerated.Element.html('<div><img></div>'), __html3 = new autogenerated.Element.html('<div>\n                <span class=""></span>\n                <br>\n                <span class=""></span>\n                <br>\n                <span class=""></span>\n                <br>\n                <span class="copyrightReference">Powered by <a href="http://www.worldweatheronline.com/" title="Free local weather content provider" target="_blank">World Weather Online</a></span>        \n              </div>'), __html4 = new autogenerated.Element.html('<div>              \n                <template></template>  \n              </div>'), __html5 = new autogenerated.Element.html('<div is="x-participante"></div>'), __html6 = new autogenerated.Element.html('<div>              \n                <template></template>  \n              </div>'), __html7 = new autogenerated.Element.html('<div is="x-participante"></div>'), __html8 = new autogenerated.Element.html('<div>              \n                <template></template>\n              </div>'), __html9 = new autogenerated.Element.html('<div is="x-participante"></div>'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div class="proximoJogo">
          <div>
            <div id="map_canvas" class="mapSmall"></div>
            <div><a target="_blank">Obter direcções para o local de estacionamento</a></div>
          </div>
          <div class="weather">
            <template></template>
          </div>
          <div class="participantes">
            <template></template>
            <template></template>
            <template></template>
          </div>
          <span style="white-space: pre-wrap"></span>
          <template></template>
        </div>
      ''');
  autogenerated.AnchorElement __e96;
  autogenerated.Element __e107, __e112, __e117, __e122, __e126;
  autogenerated.SpanElement __e124;
  autogenerated.Template __t;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e96 = _root.nodes[1].nodes[1].nodes[3].nodes[0];
    __t.bind(() => [model.jogo[0]['campo']['estacionamentoLat'], model.jogo[0]['campo']['estacionamentoLng']],  (__e) { __e96.href = autogenerated.sanitizeUri('https://maps.google.com/maps?daddr=${__e.newValue[0]},${__e.newValue[1]}'); }, false);
    __e107 = _root.nodes[1].nodes[3].nodes[1];
    __t.conditional(__e107, () => model.jogo[0]['tempo']!=null, (__t) {
      var __e101, __e103, __e105, __e106, __e97, __e98;
      __e98 = __html2.clone(true);
      __e97 = __e98.nodes[0];
      __t.oneWayBind(() => model.jogo[0]['tempo']['weatherIconUrl'][0]['value'], (e) { if (__e97.src != e) __e97.src = e; }, false, true);
      __e106 = __html3.clone(true);
      __e101 = __e106.nodes[1];
      var __binding99 = __t.contentBind(() => model.jogo[0]['tempo']['tempMinC'], false);
      var __binding100 = __t.contentBind(() => model.jogo[0]['tempo']['tempMaxC'], false);
      __e101.nodes.addAll([__binding99,
          new autogenerated.Text('º C - '),
          __binding100,
          new autogenerated.Text('º C')]);
      __t.bindClass(__e101, () => temperaturaClass, false);
      __e103 = __e106.nodes[5];
      var __binding102 = __t.contentBind(() => model.jogo[0]['tempo']['precipMM'], false);
      __e103.nodes.addAll([new autogenerated.Text('Precipitação: '),
          __binding102,
          new autogenerated.Text(' mm')]);
      __t.bindClass(__e103, () => precipitacaoClass, false);
      __e105 = __e106.nodes[9];
      var __binding104 = __t.contentBind(() => model.jogo[0]['tempo']['windspeedKmph'], false);
      __e105.nodes.addAll([new autogenerated.Text('Vento (Km/h): '),
          __binding104,
          new autogenerated.Text(' Km/h')]);
      __t.bindClass(__e105, () => ventoClass, false);
    __t.addAll([new autogenerated.Text('\n              '),
        __e98,
        new autogenerated.Text('\n              '),
        __e106,
        new autogenerated.Text('\n              '),
        __html1.clone(true),
        new autogenerated.Text('\n            ')]);
    });

    __e112 = _root.nodes[1].nodes[5].nodes[1];
    __t.conditional(__e112, () => participantesSimNumero>0, (__t) {
      var __e110, __e111;
      var __binding108 = __t.contentBind(() => participantesSimNumero, false);
      __e111 = __html4.clone(true);
      __e110 = __e111.nodes[1];
      __t.loop(__e110, () => participantesSim, (participante, __t) {
        var __e109;
        __e109 = __html5.clone(true);
        __t.oneWayBind(() => participante, (e) { if (__e109.xtag.participante != e) __e109.xtag.participante = e; }, false, false);
        __t.component(new Participante()..host = __e109);
      __t.addAll([new autogenerated.Text('\n                  '),
          __e109,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('  \n              Presentes: '),
        __binding108,
        new autogenerated.Text('\n              '),
        __e111,
        new autogenerated.Text('\n            ')]);
    });

    __e117 = _root.nodes[1].nodes[5].nodes[3];
    __t.conditional(__e117, () => participantesNao.length>0, (__t) {
      var __e115, __e116;
      var __binding113 = __t.contentBind(() => participantesNao.length, false);
      __e116 = __html6.clone(true);
      __e115 = __e116.nodes[1];
      __t.loop(__e115, () => participantesNao, (participante, __t) {
        var __e114;
        __e114 = __html7.clone(true);
        __t.oneWayBind(() => participante, (e) { if (__e114.xtag.participante != e) __e114.xtag.participante = e; }, false, false);
        __t.component(new Participante()..host = __e114);
      __t.addAll([new autogenerated.Text('\n                  '),
          __e114,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('\n              Ausentes: '),
        __binding113,
        new autogenerated.Text('\n              '),
        __e116,
        new autogenerated.Text('\n            ')]);
    });

    __e122 = _root.nodes[1].nodes[5].nodes[5];
    __t.conditional(__e122, () => participantesTalvez.length>0, (__t) {
      var __e120, __e121;
      var __binding118 = __t.contentBind(() => participantesTalvez.length, false);
      __e121 = __html8.clone(true);
      __e120 = __e121.nodes[1];
      __t.loop(__e120, () => participantesTalvez, (participante, __t) {
        var __e119;
        __e119 = __html9.clone(true);
        __t.oneWayBind(() => participante, (e) { if (__e119.xtag.participante != e) __e119.xtag.participante = e; }, false, false);
        __t.component(new Participante()..host = __e119);
      __t.addAll([new autogenerated.Text('\n                  '),
          __e119,
          new autogenerated.Text('\n                ')]);
      });
    __t.addAll([new autogenerated.Text('\n              Talvez: '),
        __binding118,
        new autogenerated.Text('\n              '),
        __e121,
        new autogenerated.Text('\n            ')]);
    });

    __e124 = _root.nodes[1].nodes[7];
    var __binding123 = __t.contentBind(() => descricaoJogo, false);
    __e124.nodes.add(__binding123);
    __e126 = _root.nodes[1].nodes[9];
    __t.conditional(__e126, () => descricaoExpansivel, (__t) {
      var __e125;
      __e125 = __html10.clone(true);
      __t.listen(__e125.onClick, ($event) { clickExpandirDescricao(); });
    __t.addAll([new autogenerated.Text('\n            '),
        __e125,
        new autogenerated.Text('\n          ')]);
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e96 = __e107 = __e112 = __e117 = __e122 = __e124 = __e126 = null;
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