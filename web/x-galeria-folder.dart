import 'package:web_ui/web_ui.dart';
import 'dart:uri';
import 'dart:html';
import 'dart:math';
import 'model.dart';

class GaleriaFolder extends WebComponent {
  Map galeria;
  int get hash5_1 {
    int hash = galeria['folder'].hashCode;
    int result = (hash%10)~/2;
    return result;
  }
  int get hash5_2 {
    int hash = galeria['folder'].hashCode;
    int result = ((hash~/10)%10)~/2;
    return result;
  }
  int get hash5_3 {
    int hash = galeria['folder'].hashCode;
    int result = ((hash~/100)%10)~/2;
    return result;
  }
  String get galeriaFolderFrameRotRandom1 => "galeriaFolderFrameRot${hash5_1}";
  String get galeriaFolderFrameRotRandom2 => "galeriaFolderFrameRot${hash5_2}";
  String get galeriaFolderFrameRotRandom3 => "galeriaFolderFrameRot${hash5_3}";
  String get galeriaFolderFramePosRandom1 => "galeriaFolderFramePos${hash5_2}";
  String get galeriaFolderFramePosRandom2 => "galeriaFolderFramePos${hash5_3}";
  String get galeriaFolderFramePosRandom3 => "galeriaFolderFramePos${hash5_1}";
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
  String get encodedNomeCompleto => encodeUriComponent(galeria["nomeCompleto"]);
  clickFolder(){
    model.changePage("${NavLink.Galeria.link}/${encodedNomeCompleto}");
  }
}