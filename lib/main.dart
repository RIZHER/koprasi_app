import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:koperasi_app/app/data/api.dart';
import 'package:koperasi_app/constant/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: baseUrlSort,
    anonKey: apiKey,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
    ),
  );
}
