// Auto-generated from x-widget.html.
// DO NOT EDIT.

library x_widget;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';



class Widget extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.DivElement __e98;
  autogenerated.HeadingElement __e97;
  autogenerated.Template __t;

  Widget.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <div class="widget " id="__e-98">
          <div class="widget-title"><h3 id="__e-97"></h3></div>
          <div class="widget-content"><content></content></div>
        </div>
      ''';
    __e98 = _root.query('#__e-98');
    __e97 = __e98.query('#__e-97');
    var __binding96 = __t.contentBind(() => titulo, false);
    __e97.nodes.add(__binding96);
    __t.bindClass(__e98, () => cssClass, false);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e98 = __e97 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  String tamanho;
  String titulo;
  
  String get cssClass => "widget-".concat(tamanho);
}

//@ sourceMappingURL=x-widget.dart.map