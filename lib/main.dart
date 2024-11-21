import 'package:anime_app/bindings/authentication_binding.dart';
import 'package:anime_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'features/my_list/controller/my_list_controller.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(MyListController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime App',
        initialRoute: AppRoutes.WELCOME,
        initialBinding: AuthenticationBinding(),
        // home: const WelcomeScreen(),
        getPages: AppPages.pages,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
