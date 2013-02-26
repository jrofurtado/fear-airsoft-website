// Auto-generated from x-sitenavigation.html.
// DO NOT EDIT.

library x_sitenavigation;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/web_ui.dart';
import 'dart:html';
import '../model.dart';
import 'x-buttonnav.dart';



class SiteNavigation extends WebComponent{
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  autogenerated.Element __e24;
  autogenerated.Template __t;

  SiteNavigation.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.innerHtml = '''
        <ul class="sitenavigation">
        <template id="__e-24"></template>
        </ul>
      ''';
    __e24 = _root.query('#__e-24');
    __t.loop(__e24, () => model.navlinks, (navlink, __t) {
      var __e23;
      __e23 = new autogenerated.Element.tag('x-buttonnav');
      __t.oneWayBind(() => navlink, (e) { __e23.xtag.navlink = e; }, false, false);
      new ButtonNav.forElement(__e23);
      __t.component(__e23);
    __t.addAll([new autogenerated.Text('\n          '),
        __e23,
        new autogenerated.Text('\n        ')]);
    });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e24 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

}

//@ sourceMappingURL=x-sitenavigation.dart.map