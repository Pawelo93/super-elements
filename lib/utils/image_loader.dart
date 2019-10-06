import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

class ImageLoader {

  Future <Map<String, ui.Image>> init(List<String> assets) async {
    var map = Map<String, ui.Image>();

    for (var asset in assets) {
      final ByteData data = await rootBundle.load('assets/$asset');
      var image = await loadImage(new Uint8List.view(data.buffer));
      map[asset.split('.')[0]] = image;
    }

    return map;
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}