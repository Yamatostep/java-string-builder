import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '/screens/string_builder_screen.dart';
import '/screens/string_builder_to_string_screen.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageStateScreen();
}

class _MyHomePageStateScreen extends State<MyHomePageScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Java String Builder',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        leading: Icon(
          Icons.edit_note,
          color: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        // centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              showHamburger: false,
              hoverColor: Theme.of(context).colorScheme.background,
              selectedHoverColor: Theme.of(context).colorScheme.background,
              selectedColor: Theme.of(context).colorScheme.background,
              selectedTitleTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
              selectedIconColor: Theme.of(context).colorScheme.primary,
              unselectedTitleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              unselectedIconColor: Theme.of(context).colorScheme.onSecondary,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            title: Column(
              children: [
                // const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/pexels-negative-space-97077.jpg',
                  ),
                ),
                Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  color: Theme.of(context).colorScheme.background,
                ),
              ],
            ),
            items: [
              SideMenuItem(
                title: 'String -> StringBuilder',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.looks_one),
              ),
              SideMenuItem(
                title: 'StringBuilder -> String',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.looks_two),
              ),
              // SideMenuItem(
              //   title: 'Files',
              //   onTap: (index, _) {
              //     sideMenu.changePage(index);
              //   },
              //   icon: const Icon(Icons.file_copy_rounded),
              //   trailing: Container(
              //       decoration: const BoxDecoration(
              //           color: Colors.amber,
              //           borderRadius: BorderRadius.all(Radius.circular(6))),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 6.0, vertical: 3),
              //         child: Text(
              //           'New',
              //           style: TextStyle(fontSize: 11, color: Colors.grey[800]),
              //         ),
              //       )),
              // ),
              // SideMenuItem(
              //   builder: (context, displayMode) {
              //     return const Divider(
              //       endIndent: 8,
              //       indent: 8,
              //     );
              //   },
              // ),
            ],
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    'Power By Yamatos',
                    style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                StringBuilderScreen(
                  title: 'String -> StringBuilder',
                ),
                StringBuilderToStringScreen(
                  title: 'StringBuilder -> String',
                ),

                // this is for SideMenuItem with builder (divider)
                // const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
