import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:posta_medica_huancayo/src/models/user.dart';
import 'package:posta_medica_huancayo/src/providers/users_provider.dart';

import '../../models/response_api.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    //Get.snackbar('Email', email);
    //Get.snackbar('Clave', password);A

    ResponseApi responseApi = await usersProvider.login(email,password);
    print('Response API: ${responseApi.toJson()}');

    if(responseApi.success == true) {
      GetStorage().write('success', true);
      Get.snackbar("LOGIN EXITOSO", "Ingresaste correctamente!");
      Get.toNamed('/main');
    }else{
      Get.snackbar("LOGIN FALLIDO!!!!!!!!", "USUARIO Y/O CLAVES INCORRECTOS!");
    }

  }
}