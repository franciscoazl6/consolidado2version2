import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posta_medica_huancayo/src/pages/login/login_controller.dart';
import 'package:posta_medica_huancayo/src/pages/main/main_controller.dart';

class MainPage extends StatelessWidget{
  MainController cont = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 120,
        color: Color.fromRGBO(0, 155, 10, 1),
        child: _textBottomInfo(),
      ),
      body:Container(
        padding: EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  _imageCover(),
                  _textAppName()
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Column(
                      children: [
                        _imageInformation(),
                        _textInformation()
                      ],
                    ),
                    Column(
                      children: [
                        _imageConsulta(),
                        _textConsulta()
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        _imageDate(),
                        _textDate()
                      ],
                    ),
                    Column(
                      children: [
                        _imageChat(),
                        _textChat()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
      );
  }
  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top:100,bottom: 15),
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/img/logopmh.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
  Widget _textAppName(){
    return Container(
      margin: const EdgeInsets.only(top: 70,left: 20),
      child: const Text(
        'POSTA MEDICA HUANCAYO',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
        ),
      ),
    );
  }
  Widget _imageInformation(){
    return SafeArea(
      child: GestureDetector(
        onTap: ()=>cont.goToDataPage(),
        child: Container(
          margin: const EdgeInsets.only(left: 60),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/img/img.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
  Widget _imageConsulta(){
    return SafeArea(
      child: GestureDetector(
        onTap: ()=>cont.goToInfoPage(),
        child: Container(
          margin: const EdgeInsets.only(left: 50,top: 8),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/img/img_1.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
  Widget _imageDate(){
    return SafeArea(
      child: GestureDetector(
        onTap: ()=>cont.goToDatePage(),
        child: Container(
          margin: const EdgeInsets.only(left: 60),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/img/img_2.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
  Widget _imageChat(){
    return SafeArea(
      child: GestureDetector(
        onTap: ()=>cont.goToChatPage(),
        child: Container(
          margin: const EdgeInsets.only(left: 50,top: 2),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/img/img_4.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
  Widget _textInformation(){
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 45),
      child: const Text(
        'INFORMACION',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _textConsulta(){
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 35),
      child: const Text(
        'CONSULTA MEDICA',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _textDate(){
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 45),
      child: const Text(
        'CITA / HORARIO',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _textChat(){
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 40),
      child: const Text(
        'CHATBOT MEDICO',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _textBottomInfo(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15,right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Direccion Jr. xxxxxxxxx',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),
              ),
              SizedBox(height: 7),
              Text(
                'N° 98425887468',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),
              )
            ],
          ),
        ),
        Text(
            'POSTA MEDICA HUANCAYO',
            style: TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11
            ),
        ),
        GestureDetector(
          onTap:()=>cont.infoSession(),
          child: Icon(Icons.exit_to_app,color: Colors.white,),
        )
      ],
    );
  }
}