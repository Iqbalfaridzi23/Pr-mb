import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = Provider((_) => Counter());

Future<void> _deleteCacheDir() async {
  var tempDir = await getTemporaryDirectory();
  var appDir = (await getTemporaryDirectory()).path + '/<package_name>';
  new Directory(appDir).delete(recursive: true);

  if (tempDir.existsSync()) {
    tempDir.deleteSync(recursive: true);
  }
}

getTemporaryDirectory() {}

Future<void> _deleteAppDir() async {
  var appDocDir = await getApplicationDocumentsDirectory();
  var appDir = (await getTemporaryDirectory()).path + '/<package_name>';
  new Directory(appDir).delete(recursive: true);
  if (appDocDir.existsSync()) {
    appDocDir.deleteSync(recursive: true);
  }
}

getApplicationDocumentsDirectory() {}

class Counter {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
  }

  int getCounter() {
    return _counter;
  }

  void resetCounter() {
    _counter = 0;
  }
}
