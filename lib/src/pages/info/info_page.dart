import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posta_medica_huancayo/src/pages/info/info_controller.dart';

class InfoPage extends StatelessWidget{
  final List<String> opciones = ['Medicina General', 'Obstetricia', 'Enfermería', 'Psicología', 'Odontológia', 'Oncologia', 'Pediatria'];
  final InfoController controller = Get.put(InfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 120,
          color: Color.fromRGBO(0, 155, 10, 1),
          child: _textBottomInfo(),
        ),
        body:SafeArea(
          child: Column(
            children: [
              _buttonBack(),
              Obx(() => DropdownButton<String>(
                value: controller.selectedValue.value,
                onChanged: (String? newValue) {
                  controller.selectedValue.value = newValue!;
                  controller.updateDisplayText(); // Llamada a la función para actualizar el texto
                },
                items: opciones.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
              Row(
                children: [
                  _imageCover(),
                  _textAppName()
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Obx(()=> Text(
                      '${controller.doctor.value}\n ${controller.descripcion.value}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )),
                  ),
                  Obx(()=>_imageDoctor(controller.imagen.value))
                ],
              ),
              Obx(()=>Text('Especialidad - ${controller.displayText.value}',style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
        )
    );
  }

  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top:25,bottom: 15),
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
      margin: const EdgeInsets.only(top: 25,left: 20),
      child: const Text(
        'POSTA MEDICA HUANCAYO',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
  Widget _imageDoctor(String img){
    return CircleAvatar(
      backgroundImage: AssetImage(img),
      radius: 60,
      backgroundColor: Colors.white,
    );
  }
  Widget _buttonBack() {
    return SafeArea(
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(left: 20,top: 35),
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
        )
      ],
    );
  }
}