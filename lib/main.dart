import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:posta_medica_huancayo/src/pages/chat/chat_page.dart';
import 'package:posta_medica_huancayo/src/pages/data/data_page.dart';
import 'package:posta_medica_huancayo/src/pages/date/date_page.dart';
import 'package:posta_medica_huancayo/src/pages/date/successDate.dart';
import 'package:posta_medica_huancayo/src/pages/info/info_page.dart';
import 'package:posta_medica_huancayo/src/pages/login/login_page.dart';
import 'package:posta_medica_huancayo/src/pages/main/main_page.dart';

var validacion = GetStorage().read("success");

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("VALIDAICON INICIAL: ${validacion}");
    return GetMaterialApp(
      title: 'POSTA MEDICA HUANCAYO',
      debugShowCheckedModeBanner: false,
      initialRoute: validacion==true?'/main':'/',
      getPages: [
        GetPage(name: '/', page: ()=> LoginPage()),
        GetPage(name: '/main', page: ()=>MainPage()),
        GetPage(name: '/info', page: ()=>InfoPage()),
        GetPage(name: '/data', page: ()=>DataPage()),
        GetPage(name: '/date', page: ()=>DatePage()),
        GetPage(name: '/chat', page: ()=>ChatPage()),
        GetPage(name: '/success', page: ()=>AppointmentSuccessScreen()),
      ],
      navigatorKey: Get.key,
    );
  }
}
