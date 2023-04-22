import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:get/get.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';
import 'app/services/graphqlConf.dart';
import 'app/routes/app_pages.dart';
import 'dart:async';

ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();

  const instanceID = "da8584b0-6fab-4b32-b29f-3640bd6def43";
  await PusherBeams.instance.start(instanceID);

  ApiClients query = Get.put(ApiClients());

  if (variables.fullscreen == true) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    variables.userid = prefs.getString('userid').toString() ?? '';
    if (variables.userid != "") {
      await query.getuser();
    }
    variables.name = prefs.getString('name').toString() ?? '';
    variables.email = prefs.getString('email').toString() ?? '';
    variables.profilepic = prefs.getString('profilepic').toString() ?? '';
    variables.phone = prefs.getString('phone').toString() ?? '';
    print(variables.profilepic);
  } else {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: themeGradientColorStart));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    variables.userid = prefs.getString('userid').toString() ?? "null";
    if (variables.userid != "") {
      await query.getuser();
    }
    variables.name = prefs.getString('name').toString() ?? '';
    variables.email = prefs.getString('email').toString() ?? '';
    variables.profilepic = prefs.getString('profilepic').toString() ?? '';
    variables.phone = prefs.getString('phone').toString() ?? '';
    print(variables.profilepic);
  }
  ;
  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GraphQLProvider(
        client: client,
        child: GetMaterialApp(
          title: "Style Club",
          debugShowCheckedModeBanner: false,
          initialRoute:
              //Routes.CONGRATS,
              variables.userid == null ? AppPages.INITIAL : Routes.MAIN_PAGE,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                  primarySwatch:
                      MaterialColor(themeGradientColorEnd.value, mapcolor)),
              appBarTheme: const AppBarTheme(
                  color: Vx.white,
                  systemOverlayStyle: SystemUiOverlayStyle.light),
              fontFamily: 'ave',
              scaffoldBackgroundColor: Vx.white),
          getPages: AppPages.routes,
        ),
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
