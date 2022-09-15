import 'package:flutter/material.dart';
import 'package:travel_app_ankara_flutter/core/constants/images_manager.dart';

class FavoritesPageConstants {
  static const String MUSEUM = "MÜZE";
  static const String PARK = "PARK";
  static const String PICNIC_AREA = "PİKNİK ALANI";
  static const String RIVER = "NEHİR";
  static const String MOUNTAIN = "DAĞ";
  static const String CASTLE = "KALE";
  static const String LAKE = "GÖL";
  static const String FOREST = "ORMAN";
}

List area = [
    FavoritesPageConstants.CASTLE,
    FavoritesPageConstants.FOREST,
    FavoritesPageConstants.LAKE,
    FavoritesPageConstants.MOUNTAIN,
    FavoritesPageConstants.MUSEUM,
    FavoritesPageConstants.PARK,
    FavoritesPageConstants.PICNIC_AREA,
    FavoritesPageConstants.RIVER,
  ];

  List imagesList = [
    Image.asset(ImageManager.instance.castle),
    Image.asset(ImageManager.instance.forest),
    Image.asset(ImageManager.instance.lake),
    Image.asset(ImageManager.instance.mountain),
    Image.asset(ImageManager.instance.museum),
    Image.asset(ImageManager.instance.park),
    Image.asset(ImageManager.instance.picnic_area),
    Image.asset(ImageManager.instance.river),
  ];