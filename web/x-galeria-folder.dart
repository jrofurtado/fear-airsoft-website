import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class GaleriaFolder extends WebComponent {
  Map galeria;
  String get thumbnailUrl{
    if(galeria['thumb']!=""){
      return "${Model.endpoint_imagens}Galeria/${galeria['ano']}/${galeria['folder']}/${galeria['thumb']}";
    }else{
      Map item=galeria['itens'][0];
      if(item['youtubeId']!=""){
        return "../youtube.png";
      }else{
        return "../video.png";
      }
    }
  }
}