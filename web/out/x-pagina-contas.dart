// Auto-generated from x-pagina-contas.html.
// DO NOT EDIT.

library x_pagina_contas;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;



class PaginaContas extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __shadowTemplate = new autogenerated.DocumentFragment.html('''
        
      ''');
  autogenerated.Template __t;

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

}


//@ sourceMappingURL=x-pagina-contas.dart.map