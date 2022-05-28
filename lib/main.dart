import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frame_conf/Cuestionario.dart';
import 'package:frame_conf/Hobbies.dart';
import 'package:frame_conf/chatbot.dart';
import 'package:frame_conf/login/home.dart';
import 'package:frame_conf/login/login_page.dart';
import 'package:frame_conf/login/registro_page.dart';
import 'package:frame_conf/splas_screen.dart';
import 'package:frame_conf/src/pages/tabs_page.dart';
import 'package:frame_conf/untils/mycolors.dart';
import 'package:native_notify/native_notify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  NativeNotify.initialize(705, 'hJmlEUsqivv3PgTtcl5ROK', null, null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page configuracion',
      initialRoute: 'Splash',
      routes: {
        'Splash': (BuildContext context) => SplashScreen(),
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegistroPage(),
        'hobbies': (BuildContext context) => Hobbies(),
        'menu': (BuildContext context) => TabsPage(),
        'diario': (BuildContext context) => HomePage(),
        'cuestionario': (BuildContext context) => Cuestionario(),
        'chat': (BuildContext context) => DeimosDialogflowApp()
      },
      theme:
          ThemeData(primaryColor: MyColors.primaryColor, fontFamily: 'Roboto'),
    );
  }
}
