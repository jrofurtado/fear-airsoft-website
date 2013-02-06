import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class Xp extends WebComponent {
  Map membro;
  
  int get larguraXp{
    double amplitudeTotal = (membro["nextLevelXp"] - membro["previousLevelXp"]).toDouble();
    double amplitudeXp = (membro["xp"]-membro["previousLevelXp"]).toDouble();
    return (100*amplitudeXp/amplitudeTotal).toInt();
  }
  int get larguraRestanteXp{
    return 100-larguraXp;
  }
}
