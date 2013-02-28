import 'package:web_ui/web_ui.dart';

class Widget extends WebComponent {
  String tamanho;
  String titulo;

  String get cssClass => "widget-".concat(tamanho);
}
