import 'package:web_ui/web_ui.dart';
import 'package:google_calendar_v3_api/calendar_v3_api_browser.dart' as calendarclient;
import 'model.dart';

class Participante extends WebComponent {
  calendarclient.EventAttendee participante;
  String get foto{
    var res = model.membros.where((membro) => (membro["email"]==participante.email));
    if(res.length>0) {
      return "${Model.endpoint_imagens}/Fotos/100x100/${res.first["socio"]}.jpg";
    } else {
      return "${Model.endpoint_imagens}/Fotos/no_photo_100x100.jpg";
    }
  }
}