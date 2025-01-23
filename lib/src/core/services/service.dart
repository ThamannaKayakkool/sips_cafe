import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sips_cafe/objectbox.g.dart';

Future<Store> initializeObjectBox() async {
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/objectbox';

  final dbDirectory = Directory(dbPath);
  if (dbDirectory.existsSync()) {
    dbDirectory.deleteSync(recursive: true);
  }

  final store = Store(
    getObjectBoxModel(),
    directory: dbPath,
  );
  return store;
}
