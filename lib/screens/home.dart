import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_feature/screens/map_screen.dart';
import 'package:multi_feature/screens/webview_screen.dart';
import '../controller/Themecontroller.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String ThemeMode = "Light Mode";

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi-Feature"),
        centerTitle: true,
        actions: [
          InkWell(
            onTapDown: (details) {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  details.globalPosition.dx,
                  details.globalPosition.dy,
                  0,
                  0,
                ),
                items: [
                  PopupMenuItem(
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, setState2) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ThemeMode,
                              style: TextStyle(
                                color: !_themeController.isDark.value
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),

                            Switch(
                              value: _themeController.isDark.value,
                              onChanged: (value) {
                                setState2(() {
                                  ThemeMode == "Light Mode"
                                      ? ThemeMode = "Dark Mode"
                                      : ThemeMode = "Light Mode";
                                  _themeController.updateTheme();
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(MapScreen());
              },
              child: Text("Go To Google Map"),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Get.to(WebviewScreen());
              },
              child: Text("Go To Web View"),
            ),
          ],
        ),
      ),
    );
  }
}
