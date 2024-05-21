import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class db {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/candidats.txt');
  }

  Future<List> read(String fichier) async {
    try {
      final path = await _localPath;
      final file = await File('$path/$fichier');

      var contents = jsonDecode(file.readAsStringSync()) as List;

      return contents;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> write(Map<String, dynamic> row, String fichier) async {
    try {
      final path = await _localPath;
      var file = await File('$path/$fichier');

      if (!file.existsSync()) {
        String cont = jsonEncode([row]);
        file.writeAsString(cont);
      } else {
        var contents = await read(fichier);

        List newContents = [];
        newContents.add(row);

        for (var line in contents) {
          newContents.add(line);
        }

        file.writeAsStringSync(jsonEncode(newContents), flush: false);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteAll(String fichier) async {
    try {
      final path = await _localPath;
      final file = await File('$path/$fichier');

      file.deleteSync();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(Map<String, dynamic> row, String fichier) async {
    try {
      final path = await _localPath;
      var file = await File('$path/$fichier');

      if (!file.existsSync()) {
        return true;
      } else {
        var contents = await read(fichier);

        if (contents.length > 0) {
          var rowToDelete;
          for (var line in contents) {
            if(line["nomComplet"] == row["nomComplet"] ){
              rowToDelete = line;
            } 
          }
          contents.remove(rowToDelete);
          file.writeAsStringSync(jsonEncode(contents), flush: false);
        }
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

void main() {
  db bd = new db();
  print(bd._localPath);
}
