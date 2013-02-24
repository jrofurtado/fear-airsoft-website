// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** Collects common snippets of generated code. */
library codegen;

import 'file_system/path.dart';
import 'info.dart';
import 'utils.dart';

/**
 * Header with common imports, used in every generated .dart file.  If path is
 * null then there is no file associated with the template (used by testing
 * so we'll display <MEMORY> for file name.
 */
String header(Path path, String libraryName) {
  var library = libraryName != null ? '\nlibrary $libraryName;\n' : '';
  return """
// Auto-generated from ${path != null ? path.filename : "<MEMORY>"}.
// DO NOT EDIT.
$library
import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
""";
}

/**
 * The code that will be used to bootstrap the application, this is inlined in
 * the main.html.html output file.
 */
String bootstrapCode(Path userMainImport, bool useObservers) => """
library bootstrap;

import 'package:web_ui/watcher.dart' as watcher;
import '$userMainImport' as userMain;

main() {
  watcher.useObservers = $useObservers;
  userMain.main();
  userMain.init_autogenerated();
}
""";
