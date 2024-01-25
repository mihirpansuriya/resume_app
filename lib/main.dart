import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_app/utils/resume_model.dart';

import 'Screen/Routes/screen_routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getExternalStorageDirectory();
  Hive.init(directory?.path);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes");
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.onBoardingScreen,
    );
  }
}

