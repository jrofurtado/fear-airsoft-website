import 'package:web_ui/web_ui.dart';
import 'dart:html';
import 'model.dart';

class SiteNavigation extends WebComponent {
  Collection<NavLink> get navlinks {
     return model.navlinks; 
  }
  
  var _stopWatcher;

  void inserted() {
    super.inserted();
    var anchors = this.queryAll('a');
    // TODO(jmesserly): this only works because main() registered for
    // popState and hashChanged.
    _stopWatcher = watchAndInvoke(() => window.location.hash, (e) {
      var hash = e.newValue;
      if (hash == '') hash = '#/';
      for (var a in anchors) {
        model.selectednavlink=hash;
        //updateCssClass(a, a.hash == hash, 'selected');
      }
    });
  }

  void removed() {
    _stopWatcher();
    super.removed();
  }
}
