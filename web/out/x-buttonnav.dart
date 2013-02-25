// Auto-generated from x-buttonnav.html.
// DO NOT EDIT.

library x_buttonnav;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';



class ButtonNav extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.AnchorElement __e100;
  autogenerated.Template __t;

  ButtonNav.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <a class="navlink" id="__e-100"></a>
      ''';
    __e100 = _root.query('#__e-100');
    var __binding99 = __t.contentBind(() => navlink.name, false);
    __e100.nodes.add(__binding99);
    __t.listen(__e100.onClick, ($event) { click(); });
    __t.oneWayBind(() => navlink.link, (e) { __e100.href = e; }, false, true);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e100 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

  NavLink navlink;
  
  void click(){
    model.changePage(navlink.link);
  }
}

//@ sourceMappingURL=x-buttonnav.dart.map