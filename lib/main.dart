import 'package:administrator/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'helpers/app_configure.dart'
    if (dart.library.html) 'helpers/app_configure_web.dart';
import 'helpers/app_constants.dart';
import 'ui/layouts/main_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administrator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) => MenuController(),
        ),
      ], child: const MainLayout()),
    );
  }
}
