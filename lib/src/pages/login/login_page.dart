import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posta_medica_huancayo/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget{
  LoginController cont = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _imageCover(),
          _textAppName(),
          _formLogin(context)
        ],
      )
    );
  }
  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top:100,bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/logopmh.jpg',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
  Widget _textAppName(){
    return const Text(
      'POSTA MEDICA HUANCAYO',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple
      ),
    );
  }
  Widget _formLogin(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.only(top: 10,left: 15,right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(0, 155, 10, 1),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _inputEmail(),
            _inputPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }
  Widget _inputEmail(){
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: TextField(
          controller: cont.emailController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Usuario',
            prefixIcon: Icon(Icons.email),
            prefixIconColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.white
            )
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
    );
  }
  Widget _inputPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: cont.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            prefixIconColor: Colors.white,
            hintStyle: TextStyle(
                color: Colors.white
            ),
            prefixIcon: Icon(Icons.lock)
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          onPressed: () => cont.login(),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Color.fromRGBO(105, 165, 75, 1),
          ),
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
    );
  }
}