import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;
import 'package:google_maps/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';
import 'package:google_calendar_v3_api/calendar_v3_api_browser.dart' as calendarclient;
import 'dart:html';
import 'dart:async';
import 'model.dart';

class Jogo extends WebComponent {
  String get temperaturaClass{
    if(double.parse(model.tempo[0]["tempMinC"])<5)
      return "red";
    if(double.parse(model.tempo[0]["tempMaxC"])>=35)
      return "red";
    if(double.parse(model.tempo[0]["tempMinC"])<10)
      return "yellow";
    if(double.parse(model.tempo[0]["tempMaxC"])>=30)
      return "yellow";
    return "";
  }
  String get precipitacaoClass{
    if(double.parse(model.tempo[0]["precipMM"])>=4) //Chuva intensa (http://wiki.sandaysoft.com/a/Rain_measurement#Standard_.28graduated_cylinder.29Rain_Gauge)
        return "red";
    if(double.parse(model.tempo[0]["precipMM"])>=1) //Chuva moderada
      return "yellow";
    return "";
  }
  String get ventoClass{
    if(double.parse(model.tempo[0]["windspeedKmph"])>=45) //Vento intenso (http://library.thinkquest.org/C003603/english/hurricanes/hurricanewind.shtml)
        return "red";
    if(double.parse(model.tempo[0]["windspeedKmph"])>=25) //Vento moderado
      return "yellow";
    return "";
  }  
  List<calendarclient.EventAttendee> get participantesSim{
    var res = model.participantes.where((participante) => (participante.responseStatus=="accepted"));
    return res.toList();
  }
  List<calendarclient.EventAttendee> get participantesNao{
    var res = model.participantes.where((participante) => (participante.responseStatus=="declined"));
    return res.toList();
  }
  List<calendarclient.EventAttendee> get participantesTalvez{
    var res = model.participantes.where((participante) => (participante.responseStatus=="tentative"));
    return res.toList();
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