import 'package:flutter/material.dart';
import 'package:travel_app_ankara_flutter/core/constants/images_manager.dart';
import 'package:travel_app_ankara_flutter/core/init/theme/travel_app_theme.dart';
import 'package:travel_app_ankara_flutter/core/style.dart';
import 'package:travel_app_ankara_flutter/view/favorites/constants.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TravelAppTheme.defaultTheme.colorScheme.primary,
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
        child: Column(children: [
          GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => detailSheet());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: TravelAppTheme.defaultTheme.colorScheme.primary,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          /* Container(
                              width: 40,
                              height: 40,
                              color: Colors.amber,
                              child: Image.network(
                                "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_92x30dp.png",
                                color: Colors.red,
                              )), */
                          imagesList[index],
                          ListTile(
                            title: Text(
                              area[index],
                              style: bold18,
                            ),
                            subtitle: Text(
                              "data",
                              style: normal16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}



Widget detailSheet() => Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: TravelAppTheme.defaultTheme.colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Stack(
              children: [
                imagesList[0],
                          ListTile(
                            title: Text(
                              area[0],
                              style: bold18,
                            ),
                            subtitle: Text(
                              "data",
                              style: normal16,
                            ),
                          )
              ],
            ),
          ),
        ),
      ],
    );
