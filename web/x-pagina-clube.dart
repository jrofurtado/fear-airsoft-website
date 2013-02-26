import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/js_wrap.dart' as jsw;
import 'package:google_maps/google_maps.dart';
import 'model.dart';

class PaginaClube extends WebComponent {
  var script;
  
  List<Map> get anunciosRecentes{
    List<Map> result = [];
    int i = 0;
    for(Map a in model.anuncios){      
      i++;
      result.add(a);
      if(i==5)
        break;
    }
    return result;
  }
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
  
  void inserted() {
    js.scoped(() {
      final mapOptions = new MapOptions()
        ..zoom = 12
        ..center = new LatLng(37.766163,-25.580971)
        ..mapTypeId = MapTypeId.ROADMAP;
      var canvas= query("#map_canvas");
      final map = new GMap(canvas, mapOptions);
      final estacionamentoMarker = new Marker(new MarkerOptions()
      ..title = "Estacionamento"
      ..zIndex = 1
      ..position = new LatLng(37.766143,-25.580941)
      ..map = map
      ..icon = '../estacionamento.png');
      final flagMarker = new Marker(new MarkerOptions()
      ..title = "Campo"
      ..zIndex = 2
      ..position = new LatLng(37.766163,-25.580971)
      ..map = map
      ..icon = '../flag.png');    
    });
  }
}
