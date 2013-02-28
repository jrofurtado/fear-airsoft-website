import 'package:web_ui/web_ui.dart';
import 'model.dart';

class PaginaClube extends WebComponent {
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