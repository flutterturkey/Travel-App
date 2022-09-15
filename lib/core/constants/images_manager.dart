import 'package:travel_app_ankara_flutter/core/constants/image_constants.dart';

class ImageManager {
  static ImageManager? _instance;
  static ImageManager get instance => _instance ??= ImageManager._init();
  ImageManager._init();
  String get castle => toJpg(ImageConstants.CASTLE);
  String get forest => toJpg(ImageConstants.FOREST);
  String get lake => toJpg(ImageConstants.LAKE);
  String get mountain => toJpg(ImageConstants.MOUNTAIN);
  String get museum => toJpg(ImageConstants.MUSEUM);
  String get park => toJpg(ImageConstants.PARK);
  String get picnic_area => toJpg(ImageConstants.PICNIC_AREA);
  String get river => toJpg(ImageConstants.RIVER);

  String toJpg(String name) => 'assets/images/$name.jpg';
}
