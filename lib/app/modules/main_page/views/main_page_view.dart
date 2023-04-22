import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/modules/chat_page/views/chat_page_view.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/modules/create_digital_identity/views/create_digital_identity_view.dart';
import 'package:styleclub/app/modules/deals_page/views/deals_page_view.dart';
import 'package:styleclub/app/modules/home_page/views/home_page_view.dart';
import 'package:styleclub/app/modules/influence_page/views/influence_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../services/queryQuery.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);
  CreateDigitalIdentityController createDigitalIdentityController =
      Get.put(CreateDigitalIdentityController());
  ApiClients query = Get.put(ApiClients());
  List<Widget> _buildScreen() {
    return [
      HomePageView(),
      const InfluencePageView(),
      const DealsPageView(),
      ChatPageView()
    ];
  }

  Drawer drawer() {
    return Drawer(
        backgroundColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 20),

                // Center(
                //   child: CircleAvatar(
                //     radius: 30,
                //     backgroundImage: AssetImage('assets/img.jpg'),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: SizedBox(
                          child: Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/entypo_cross.png'))
                      .onTap(() {}),
                ),
                // Center(),
              ],
            ),

            // SizedBox(child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 72.png'))
            //     .onTap(() {
            //   Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
            // }),
            Padding(
              padding: EdgeInsets.only(left: 50, top: 20),
              child: Row(
                children: [
                  Container(
                      child: Row(
                    children: [
                      variables.profilepic == null ||
                              variables.profilepic == null
                          ? Image.network(
                              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/uploaded.png")
                          : CircleAvatar(
                              foregroundImage:
                                  NetworkImage(variables.profilepic),
                              radius: 25,
                            )
                    ],
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      "hello ${variables.name}!"
                          .text
                          .fontFamily('ave')
                          .size(14)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .color(Colors.white)
                          .make()
                          .pOnly(bottom: 10),
                      "activate style club"
                          .text
                          .fontFamily('ave')
                          .size(12)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .color(Colors.red)
                          .make()
                    ],
                  ),
                ],
              ).onTap(() {
                query.user!.user.digitalProfile == ""
                    ? Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY)
                    : Get.toNamed(Routes.SEE_PROFILE);
              }),
            ),
            SizedBox(
                child: Image.network(
                    'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 146.png')),
            Padding(
              padding: EdgeInsets.only(bottom: 40, right: 100),
              child: SizedBox(
                      child: Image.network(
                          'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 143.png'))
                  .onTap(() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                //Remove String
                prefs.remove("userid");

                Get.offAllNamed(Routes.SIGNUP_PAGE);
              }),
            ),

            //     const Divider(
            //         thickness: .06, color: Color.fromARGB(255, 30, 29, 29)),
            //     ListTile(
            //       iconColor: Colors.white,
            //       leading: const Icon(Icons.person),
            //       title: const Text('My Profile',
            //           style: TextStyle(color: Colors.white)),
            //       onTap: () {
            //         // Add Navigation logic here
            //       },
            //     ),
            //     ListTile(
            //       iconColor: Colors.white,
            //       leading: const Icon(Icons.book),
            //       title: const Text('My Course',
            //           style: TextStyle(color: Colors.white)),
            //       onTap: () {
            //         // Add Navigation logic here
            //       },
            //     ),
            //     ListTile(
            //       iconColor: Colors.white,
            //       leading: const Icon(Icons.subscriptions),
            //       title: const Text('Go Premium',
            //           style: TextStyle(color: Colors.white)),
            //       onTap: () {
            //         // Add Navigation logic here
            //       },
            //     ),
          ],
        ));
  }

  List<PersistentBottomNavBarItem> _navBarsItem() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.network(
            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/home.svg",
            color: Vx.white,
          ),
          title: "home",
          activeColorPrimary: Vx.white,
          inactiveColorPrimary: Vx.gray400),
      PersistentBottomNavBarItem(
          icon: SvgPicture.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Influence.svg"),
          title: "influence",
          activeColorPrimary: Vx.white,
          inactiveColorPrimary: Vx.gray400),
      PersistentBottomNavBarItem(
          icon: SvgPicture.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bxs_offer.svg"),
          title: "deals",
          activeColorPrimary: Vx.white,
          inactiveColorPrimary: Vx.gray400),
      PersistentBottomNavBarItem(
          icon: SvgPicture.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/chat-bubble.svg"),
          title: "chat",
          activeColorPrimary: Vx.white,
          inactiveColorPrimary: Vx.gray400),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            backgroundColor: const Color.fromARGB(
              255,
              52,
              65,
              83,
            ),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),

                    // Center(
                    //   child: CircleAvatar(
                    //     radius: 30,
                    //     backgroundImage: AssetImage('assets/img.jpg'),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: SizedBox(
                              child: Image.network(
                                  'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/entypo_cross.png'))
                          .onTap(() {
                        Navigator.pop(context);
                      }),
                    ),
                    // Center(),
                  ],
                ),

                // SizedBox(child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 72.png'))
                //     .onTap(() {
                //   Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
                // }),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          variables.profilepic == null ||
                                  variables.profilepic == null
                              ? Image.network(
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/uploaded.png")
                              : CircleAvatar(
                                  foregroundImage:
                                      NetworkImage(variables.profilepic),
                                  radius: 55,
                                )
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          "hello ${variables.name}!"
                              .text
                              .fontFamily('ave')
                              .size(14)
                              .fontFamily('dmsans')
                              .fontWeight(FontWeight.w800)
                              .bold
                              .color(Colors.white)
                              .make()
                              .pOnly(bottom: 5),
                          "activate style club"
                              .text
                              .fontFamily('ave')
                              .size(12)
                              .fontFamily('dmsans')
                              .fontWeight(FontWeight.w800)
                              .bold
                              .color(Colors.red)
                              .make()
                        ],
                      ),
                    ],
                  ).onTap(() async {
                    await query.getuser();
                    query.user!.user.digitalProfile == null
                        ? Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY)
                        : Get.toNamed(Routes.SEE_PROFILE);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 25),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            Get.to(Scaffold(body: ChatPageView()));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr1.png",
                                scale: 4,
                              ),
                              Text(
                                "  Your Lifestyle Expert",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await query.getuser();

                            query.user!.user.digitalProfile == null
                                ? Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY)
                                : Get.toNamed(Routes.SEE_PROFILE);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr2.png",
                                scale: 4,
                              ),
                              Text(
                                "  Digital Identity",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.SHOP_PAGE),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr3.png",
                                scale: 4,
                              ),
                              Text(
                                "  Shopping",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.GROOMING_PAGE),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr4.png",
                                scale: 4,
                              ),
                              Text(
                                "  Gromming",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.STYLING_PAGE),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr5.png",
                                scale: 4,
                              ),
                              Text(
                                "  Styling",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PRIVILEGE_PAGE);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dr6.png",
                                scale: 4,
                              ),
                              Text(
                                "  Club Brands",
                                style: TextStyle(
                                    fontFamily: "ave",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),

                        // Row(
                        //     children: [
                        //       Image.asset("assets/dr7.png", scale: 4,),
                        //       Text("  Events & parties",
                        //       style: TextStyle(
                        //         fontFamily: "ave",
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w800,
                        //         fontSize: 16
                        //       ),)
                        //     ],
                        //   ),

                        // Row(
                        //     children: [
                        //       Image.asset("assets/dr8.png", scale: 4,),
                        //       Text("  Club Card",
                        //       style: TextStyle(
                        //         fontFamily: "ave",
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w800,
                        //         fontSize: 16
                        //       ),)
                        //     ],
                        //   ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   child: Image.network(
                //       'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 146.png'),
                //   height: 450,
                // ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: 40, right: 100, left: 25, top: 40),
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        //Remove String
                        prefs.remove("userid");
                        await PusherBeams.instance
                            .removeDeviceInterest(variables.userid);

                        Get.offAllNamed(Routes.SIGNUP_PAGE);
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/dr9.png",
                              scale: 4,
                            ),
                            Text(
                              "  Logged In/Out",
                              style: TextStyle(
                                  fontFamily: "ave",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        //mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 143.png'))
                      ),
                    )),

                //     const Divider(
                //         thickness: .06, color: Color.fromARGB(255, 30, 29, 29)),
                //     ListTile(
                //       iconColor: Colors.white,
                //       leading: const Icon(Icons.person),
                //       title: const Text('My Profile',
                //           style: TextStyle(color: Colors.white)),
                //       onTap: () {
                //         // Add Navigation logic here
                //       },
                //     ),
                //     ListTile(
                //       iconColor: Colors.white,
                //       leading: const Icon(Icons.book),
                //       title: const Text('My Course',
                //           style: TextStyle(color: Colors.white)),
                //       onTap: () {
                //         // Add Navigation logic here
                //       },
                //     ),
                //     ListTile(
                //       iconColor: Colors.white,
                //       leading: const Icon(Icons.subscriptions),
                //       title: const Text('Go Premium',
                //           style: TextStyle(color: Colors.white)),
                //       onTap: () {
                //         // Add Navigation logic here
                //       },
                //     ),
              ],
            )),
        body: PersistentTabView(
          context,
          controller: controller.persistentTabController,
          screens: _buildScreen(),
          items: _navBarsItem(),
          navBarHeight: 80,
          backgroundColor: themeGradientColorEnd,
          confineInSafeArea: true, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .simple, // Choose the nav bar style with this property.
        ));
  }
}
