import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class ButtonNav extends WebComponent {
  NavLink navlink;
  
  void click(){
    model.changePage(navlink.link);
  }
}
