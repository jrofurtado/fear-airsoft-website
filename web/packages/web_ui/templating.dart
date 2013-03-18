// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** Common utility functions used by code generated by the dwc compiler. */
library templating;

import 'dart:async';
import 'dart:collection';
import 'dart:html';
import 'dart:uri';
import 'package:web_ui/safe_html.dart';
import 'package:web_ui/observe.dart';
import 'package:web_ui/watcher.dart';
import 'package:web_ui/web_ui.dart' show WebComponent;

/**
 * Take the value of a bound expression and creates an HTML node with its value.
 * Normally bindings are associated with text nodes, unless [binding] has the
 * [SafeHtml] type, in which case an html element is created for it.
 */
Node nodeForBinding(binding) => binding is SafeHtml
    ? new Element.html(binding.toString()) : new Text(binding.toString());

/**
 * Updates a data-bound [node] to a new [value]. If the new value is not
 * [SafeHtml] and the node is a [Text] node, then we update the node in place.
 * Otherwise, the node is replaced in the DOM tree and the new node is returned.
 * [stringValue] should be equivalent to `value.toString()` and can be passed
 * here if it has already been computed.
 */
Node updateBinding(value, Node node, [String stringValue]) {
  var isSafeHtml = value is SafeHtml;
  if (stringValue == null) {
    stringValue = value.toString();
  }

  if (!isSafeHtml && node is Text) {
    node.text = stringValue;
  } else {
    var old = node;
    node = isSafeHtml ? new Element.html(stringValue) : new Text(stringValue);
    old.replaceWith(node);
  }
  return node;
}

/**
 * Adds CSS [classes] if [addClasses] is true, otherwise removes them.
 * This is useful to keep one or more CSS classes in sync with a boolean
 * property.
 *
 * The classes parameter can be either a [String] or [List<String>].
 * If it is a single string, it may contain spaces and several class names.
 * If it is a list of strings, null and empty strings are ignored.
 * Any other type except null will throw an [ArgumentError].
 *
 * For example:
 *
 *     updateCssClass(node, item.isDone, 'item-checked item-completed');
 *
 * It can also be used with a watcher:
 *
 *     watch(() => item.isDone, (e) {
 *       updateCssClass(node, e.newValue, 'item-checked item-completed');
 *     });
 *
 * If the set of classes is changing dynamically, it is better to use
 * [bindCssClasses].
 */
void updateCssClass(Element elem, bool addClasses, classes) {
  if (classes == '' || classes == null) return;
  if (addClasses) {
    // Add classess
    if (classes is String) {
      if (classes.contains(' ')) {
        elem.classes.addAll(classes.split(' '));
      } else {
        elem.classes.add(classes);
      }
    } else if (classes is List<String>) {
      elem.classes.addAll(classes.where((e) => e != null && e != ''));
    } else {
      throw new ArgumentError('classes must be a String or List<String>.');
    }
  } else {
    // Remove classes
    if (classes is String) {
      if (classes.contains(' ')) {
        elem.classes.removeAll(classes.split(' '));
      } else {
        elem.classes.remove(classes);
      }
    } else if (classes is List<String>) {
      elem.classes.removeAll(classes.where((e) => e != null && e != ''));
    } else {
      throw new ArgumentError('classes must be a String or List<String>.');
    }
  }
}

/**
 * Updates the CSS classes based on the [changes] that were made to an
 * [ObservableList].
 */
void changeCssClasses(elem, ChangeRecord change) {
  if (change.oldValue != null) elem.classes.remove(change.oldValue);
  if (change.newValue != null) elem.classes.add(change.newValue);
}

/**
 * Bind the result of [exp] to the class attribute in [elem]. [exp] is a closure
 * that can return a string, a list of strings, an string with spaces, or null.
 *
 * You can bind a single class attribute by binding a getter to the property
 * defining your class.  For example,
 *
 *     var class1 = 'pretty';
 *     bindCssClasses(e, () => class1);
 *
 * In this example, if you update class1 to null or an empty string, the
 * previous value ('pretty') is removed from the element.
 *
 * You can bind multiple class attributes in several ways: by returning a list
 * of values in [exp], by returning in [exp] a string with multiple classes
 * separated by spaces, or by calling this function several times. For example,
 * suppose you want to bind 2 classes on an element,
 *
 *     var class1 = 'pretty';
 *     var class2 = 'selected';
 *
 * and you want to independently change class1 and class2. For instance, If you
 * set `class1` to null, you'd like `pretty` will be removed from `e.classes`,
 * but `selected` to be kept.  The tree alternatives mentioned earlier look as
 * follows:
 *
 *   * binding classes with a list:
 *
 *         bindCssClasses(e, () => [class1, class2]);
 *
 *   * binding classes with a string:
 *
 *         bindCssClasses(e, () => "${class1 != null ? class1 : ''} "
 *                                 "${class2 != null ? class2 : ''}");
 *
 *   * binding classes separately:
 *
 *         bindCssClasses(e, () => class1);
 *         bindCssClasses(e, () => class2);
 */
ChangeUnobserver bindCssClasses(Element elem, dynamic exp()) {
  return watchAndInvoke(exp, (e) {
    if (e.changes != null) {
      for (var change in e.changes) changeCssClasses(elem, change);
    } else {
      updateCssClass(elem, false, e.oldValue);
      updateCssClass(elem, true, e.newValue);
    }
  }, 'css-class-bind');
}

/** Bind the result of [exp] to the style attribute in [elem]. */
ChangeUnobserver bindStyle(Element elem, Map<String, String> exp()) {
  return watchAndInvoke(exp, (e) => updateStyle(elem, e.oldValue, e.newValue),
      'css-style-bind');
}

/**
 * Changes the style properties from [oldValue] to [newValue]. A runtime error
 * is reported if [newValue] is not a `Map<String, String>`.
 */
void updateStyle(Element elem, oldValue, newValue) {
  if (oldValue is Map<String, String>) {
    var props = newValue is Map<String, String> ? newValue : const {};
    for (var property in oldValue.keys) {
      if (!props.containsKey(property)) {
        // Value will not be overwritten with new setting. Remove.
        elem.style.removeProperty(property);
      }
    }
  }
  if (newValue is! Map<String, String>) {
    throw new DataBindingError("Expected Map<String, String> value "
      "to data-style binding.");
  }
  newValue.forEach(elem.style.setProperty);
}

/**
 * Ensure that [usiString] is a safe URI. Otherwise, return a '#' URL.
 *
 * The logic in this method was based on the GWT implementation located at:
 * http://code.google.com/p/google-web-toolkit/source/browse/trunk/user/src/com/google/gwt/safehtml/shared/UriUtils.java
 */
String sanitizeUri(uri) {
  if (uri is SafeUri) return uri.toString();
  uri = uri.toString();
  return _isSafeUri(uri) ? uri : '#';
}

const _SAFE_SCHEMES = const ["http", "https", "ftp", "mailto"];

bool _isSafeUri(String uri) {
  var scheme = new Uri(uri).scheme;
  if (scheme == '') return true;

  // There are two checks for mailto to correctly handle the Turkish locale.
  //   i -> to upper in Turkish locale -> İ
  //   I -> to lower in Turkish locale -> ı
  // For details, see: http://www.i18nguy.com/unicode/turkish-i18n.html
  return _SAFE_SCHEMES.contains(scheme.toLowerCase()) ||
      "MAILTO" == scheme.toUpperCase();
}

/** An error thrown when data bindings are set up with incorrect data. */
class DataBindingError implements Error {
  final message;
  DataBindingError(this.message);
  toString() => "Data binding error: $message";
}

/**
 * An item that is part of a template and hence will have the same lifetime as
 * other elements in the template.
 */
abstract class TemplateItem {
  /** Invoked when the template contents are created. */
  void create() {}

  /** Invoked when the template contents are inserted to the document. */
  void insert();

  /** Invoked when the template is removed (undoes created and inserted). */
  void remove();
}

/** Represents an event listener within a template. */
class Listener extends TemplateItem {
  final Stream<Event> eventStream;
  StreamSubscription<Event> _subscription;
  final EventListener listener;

  Listener(this.eventStream, this.listener);

  void insert() {
    _subscription = eventStream.listen(listener);
  }

  void remove() {
    _subscription.cancel();
    _subscription = null;
  }
}

/** Represents a generic data binding and a corresponding action. */
class Binding extends TemplateItem {
  final exp;
  final ChangeObserver action;
  final bool isFinal;
  ChangeUnobserver stopper;

  Binding(this.exp, this.action, this.isFinal);

  void insert() {
    if (isFinal) {
      action(new ChangeNotification(null, exp()));
    } else if (stopper != null) {
      throw new StateError('binding already attached');
    } else {
      stopper = watchAndInvoke(exp, action, 'generic-binding');
    }
  }

  void remove() {
    if (!isFinal) {
      stopper();
      stopper = null;
    }
  }
}

/** Represents a binding to a style attribute. */
class StyleAttrBinding extends TemplateItem {
  final exp;
  final Element elem;
  final bool isFinal;
  ChangeUnobserver stopper;

  StyleAttrBinding(this.elem, this.exp, this.isFinal);

  void insert() {
    if (isFinal) {
      updateStyle(elem, null, exp());
    } else if (stopper != null) {
      throw new StateError('style binding already attached');
    } else {
      stopper = bindStyle(elem, exp);
    }
  }

  void remove() {
    if (!isFinal) {
      stopper();
      stopper = null;
    }
  }
}

/** Represents a binding to a class attribute. */
class ClassAttrBinding extends TemplateItem {
  final Element elem;
  final exp;
  final bool isFinal;
  ChangeUnobserver stopper;

  ClassAttrBinding(this.elem, this.exp, this.isFinal);

  void insert() {
    if (isFinal) {
      updateCssClass(elem, true, exp());
    } else if (stopper != null) {
      throw new StateError('class binding already attached');
    } else {
      stopper = bindCssClasses(elem, exp);
    }
  }

  void remove() {
    if (!isFinal) {
      stopper();
      stopper = null;
    }
  }
}

/**
 * Represents a one-way binding between a dart getter expression and a DOM
 * property, or conversely between a DOM property value and a dart property.
 */
class DomPropertyBinding extends TemplateItem {
  /** Value updated by this binding. */
  final Setter setter;

  /**
   * Getter that reads the value of the binding, either from a Dart expression
   * or from a DOM property (which is internally also a Dart expression).
   */
  final Getter getter;

  /**
   * Whether this is a binding that assigns a DOM attribute accepting URL
   * values. If so, the value assigned to the attribute needs to be sanitized.
   */
  final bool isUrl;

  final bool isFinal;

  ChangeUnobserver stopper;

  DomPropertyBinding(this.getter, this.setter, this.isUrl, this.isFinal);

  void _safeSetter(value) {
    setter(isUrl ? sanitizeUri(value) : value);
  }

  void insert() {
    if (isFinal) {
      _safeSetter(getter());
    } else if (stopper != null) {
      throw new StateError('data binding already attached.');
    } else {
      stopper = watchAndInvoke(getter, (e) => _safeSetter(e.newValue),
          'dom-property-binding');
    }
  }

  void remove() {
    if (!isFinal) {
      stopper();
      stopper = null;
    }
  }
}

/** Represents a component added within a template. */
class ComponentItem extends TemplateItem {
  /** An autogenerated component. */
  final component;

  ComponentItem(this.component);

  void create() {
    component..created_autogenerated()..created()..composeChildren();
  }

  void insert() {
    component..inserted()..inserted_autogenerated();
  }

  void remove() {
    component..removed_autogenerated()..removed();
  }
}

/** A template, which can contain template items and DOM nodes. */
class Template extends TemplateItem {
  /** Root of the template. */
  final Node node;

  /** Children template items. */
  final List<TemplateItem> children = [];

  /** Nodes that this template will insert/remove programatically. */
  // TODO(sigmund): consider moving this down to PlaceholderTemplate.
  final List<Node> nodes = [];

  Template(this.node);

  /** Associate the event listener while this template is visible.  */
  void listen(Stream<Event> stream, EventListener listener) {
    children.add(new Listener(stream, (e) { listener(e); dispatch(); }));
  }

  /** Run [action] when [exp] changes (while this template is visible).  */
  void bind(exp, ChangeObserver action, bool isFinal) {
    children.add(new Binding(exp, action, isFinal));
  }

  /** Create and bind a [Node] to [exp] while this template is visible. */
  Node contentBind(Function exp, isFinal) {
    var bindNode = new Text('');
    children.add(new Binding(() => '${exp()}', (e) {
      bindNode = updateBinding(exp(), bindNode, e.newValue);
    }, isFinal));
    return bindNode;
  }

  /** Bind [exp] to `elem.class` while this template is visible.  */
  void bindClass(elem, exp, isFinal) {
    children.add(new ClassAttrBinding(elem, exp, isFinal));
  }

  /** Bind [exp] to `elem.style` while this template is visible.  */
  void bindStyle(elem, exp, isFinal) {
    children.add(new StyleAttrBinding(elem, exp, isFinal));
  }

  /** Bind [exp] to [setter] while this template is visible.  */
  void oneWayBind(exp, setter, isFinal, [isUrl = false]) {
    children.add(new DomPropertyBinding(exp, setter, isUrl, isFinal));
  }

  /** Watch [exp] and render a conditional while this template is visible. */
  void conditional(Node template, exp, bodySetup) {
    children.add(new ConditionalTemplate(template, exp, bodySetup));
  }

  /** Watch [exp] and render a loop while this template is visible. */
  void loop(Node template, exp, iterSetup, {isTemplateElement: true}) {
    children.add(
        isTemplateElement ?  new LoopTemplate(template, exp, iterSetup)
        : new LoopTemplateInAttribute(template, exp, iterSetup));
  }

  /** Bind the lifecycle of the component with this template's lifecycle. */
  void component(WebComponent component) {
    children.add(new ComponentItem(component));
  }

  // TODO(sigmund): consider changing emitter to accept compact arguments here
  // for instance:
  //   __t.add(string) => add(new Text(string))
  //   __t.addHtml(s) => add(new Element.html(s));

  /** Ensure [n] is inserted in the tree when this template gets inserted. */
  void add(Node n) => nodes.add(n);

  /** Inserts every node in [list] when this template gets inserted. */
  void addAll(List<Node> list) => nodes.addAll(list);

  /** Create this template and its children (templates are [TemplateItem]s). */
  void create() {
    for (var i = 0, len = children.length; i < len; i++) {
      children[i].create();
    }
  }

  /** Insert this template and its children. */
  void insert() {
    for (var i = 0, len = children.length; i < len; i++) {
      children[i].insert();
    }
  }

  /** Remove this template and its children. */
  void remove() {
    for (var i = children.length - 1; i >= 0; i--) {
      children[i].remove();
    }
    children.clear();
  }
}

/**
 * A template to represent conditionals and loops of the form:
 *
 *     <template instantiate="if test">
 *     <template iterate="x in list">
 *     <td template instantiate="if test">
 *
 * For a template element, we leave the (childless) template element in the
 * tree and use it as a reference point for child insertion. This matches
 * native MDV behavior.
 *
 * For a template attribute, we leave the (childless) element in the tree as
 * a marker, hidden with 'display:none', and use it as a reference point for
 * insertion.
 */
// TODO(jmesserly): is this good enough for template attributes? we need
// *something* for this case:
// <tr>
//   <td>some stuff</td>
//   <td>other stuff</td>
//   <td template instantiate="if test">maybe this stuff</td>
//   <td template instantiate="if test2">maybe other stuff</td>
//   <td>more random stuff</td>
// </tr>
//
// We can't necessarily rely on child position because of possible mutation,
// unless we're willing to say that "if" requires a fixed number of children.
// If that's the case, we need a way to check for this error case and alert the
// developer.
abstract class PlaceholderTemplate extends Template {
  /** Expression watch by this template (condition or loop expression). */
  final exp;

  ChangeUnobserver stopper;

  PlaceholderTemplate(Node reference, this.exp)
      : super(reference);

  // Delay creating the template body until this is inserted.
  void create() {}

  void insert() {
    super.create();
    if (nodes.length > 0) {
      var parent = node.parentNode;
      var reference = node.nextNode;
      for (var i = 0, len = nodes.length; i < len; i++) {
        parent.insertBefore(nodes[i], reference);
      }
    }
    super.insert();
  }

  void remove() {
    super.remove();
    for (var i = nodes.length - 1; i >= 0; i--) {
      nodes[i].remove();
    }
    nodes.clear();
  }
}

/** Function to set up the contents of a conditional template. */
typedef void ConditionalBodySetup(ConditionalTemplate template);

/**
 * A template conditional like `<template instantiate="if test">` or
 * `<td template instantiate="if test">`.
 */
class ConditionalTemplate extends PlaceholderTemplate {
  bool isVisible = false;
  final ConditionalBodySetup bodySetup;

  ConditionalTemplate(Node reference, exp, this.bodySetup)
      : super(reference, exp);

  void insert() {
    stopper = watchAndInvoke(exp, (e) {
      if (!isVisible && e.newValue) {
        // only create children when they'll be visible
        bodySetup(this);
        super.insert();
        isVisible = true;
      } else if (isVisible && !e.newValue) {
        super.remove();
        isVisible = false;
      }
    }, 'conditional-binding');
  }

  void remove() {
    super.remove();
    stopper();
    stopper = null;
  }
}

/** Function to set up the contents of a loop template. */
typedef void LoopIterationSetup(loopVariable, Template template);

/** A template loop of the form `<template iterate="x in list ">`. */
class LoopTemplate extends PlaceholderTemplate {
  final LoopIterationSetup iterSetup;

  LoopTemplate(Node reference, exp, this.iterSetup) : super(reference, exp);

  void insert() {
    stopper = watchAndInvoke(exp, (e) {
      super.remove();
      for (var x in e.newValue) {
        iterSetup(x, this);
      }
      super.insert();
    }, 'loop-binding');
  }

  void remove() {
    super.remove();
    stopper();
    stopper = null;
  }
}

/**
 * A template loop of the form `<td template iterate="x in list">`. Unlike
 * [LoopTemplate], here we insert children directly then node annotated with the
 * template attribute.
 */
class LoopTemplateInAttribute extends Template {
  final LoopIterationSetup iterSetup;
  final exp;
  ChangeUnobserver stopper;

  LoopTemplateInAttribute(Node node, this.exp, this.iterSetup) : super(node);

  // Delay creating the template body until this is inserted.
  void create() {}

  void insert() {
    stopper = watchAndInvoke(exp, (e) {
      _removeInternal();
      for (var x in e.newValue) {
        iterSetup(x, this);
      }
      super.create();
      node.nodes.addAll(nodes);
      super.insert();
    }, 'loop-attribute-binding');
  }

  void _removeInternal() {
    super.remove();
    node.nodes.clear();
    nodes.clear();
  }

  void remove() {
    _removeInternal();
    stopper();
    stopper = null;
  }
}
