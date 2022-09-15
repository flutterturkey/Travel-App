import 'package:flutter/material.dart';
import 'package:travel_app_ankara_flutter/product/product_colors.dart';
import 'countrys.dart';

class ProjectMaterials {
  InputDecoration searchDecoration(TextEditingController controller) {
    return InputDecoration(
        filled: true,
        fillColor: ProductColors.whiteCustom,
        hintText: "Search a country...",
        contentPadding: EdgeInsets.all(10),
        hoverColor: ProductColors.secondary,
        focusColor: ProductColors.secondary,
        suffixIcon: InkWell(
          child: searchIcon(),
          onTap: () {},
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ProductColors.secondary ?? Colors.black)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ProductColors.secondary ?? Colors.black)));
  }

  Container searchIcon() {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.search,
            color: ProductColors.secondary,
          )),
      decoration: BoxDecoration(color: ProductColors.primary, borderRadius: BorderRadius.circular(20)),
    );
  }

  SizedBox customSpace() {
    return const SizedBox(
      height: 40,
    );
  }
}
