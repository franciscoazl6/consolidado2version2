import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buttonBack(),
               Text('Mision',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                Text('Brindamos atención médica integral y accesible, centrada en la prevención y tratamiento de la salud. Nos comprometemos a ser un referente en la atención primaria, trabajando en colaboración con la comunidad para mejorar la calidad de vida. Valoramos la proximidad, la confianza y la educación en salud, promoviendo un ambiente cálido y empático.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),textAlign: TextAlign.justify,),
                Text('Vision',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                Text('Nos visualizamos como líderes en la atención primaria de salud en Huancayo, siendo reconocidos por nuestra excelencia en servicios preventivos, el compromiso con la comunidad y la implementación de prácticas innovadoras. Aspiramos a ser un modelo de referencia en cuidado de la salud, promoviendo la participación activa de la comunidad y mejorando continuamente para satisfacer las necesidades cambiantes de la sociedad.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),textAlign: TextAlign.justify,),
              ],
            ),
          ),
        )
    );
  }
  Widget _buttonBack() {
    return SafeArea(
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(left: 20,top: 5),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
          ),
        )
    );
  }
}