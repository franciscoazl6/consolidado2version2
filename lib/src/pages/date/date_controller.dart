import 'package:get/get.dart';
import 'package:posta_medica_huancayo/src/enviroment/enviroment.dart';
import 'package:posta_medica_huancayo/src/models/datemodel.dart';
import 'package:posta_medica_huancayo/src/providers/users_provider.dart';

class DateController extends GetConnect{
  String URL = Enviroment.API_URL;
  UsersProvider usersProvider = UsersProvider();
  createDate(String select,String fecha) async{
    Response response = await usersProvider.date(select, fecha);
    if(response.body["success"]==true){
      Get.toNamed("/success");
    }

  }
  Future<List<String>> showDates() async{
    List<String> citasmedicas = [];
    final Map<String, String> Doctores = {
      'Medicina General': 'Dra. Sofia Rodriguez Garcia',
      'Obstetricia': 'Dr. Daniel Martinez Fernandez',
      'Enfermería': 'Dra. Laura Lopez Hernandez',
      'Psicología':'Dr. Alejandro Ramos Condori',
      'Odontológia':'Dr. Seralo Perez Ruiz',
      'Oncologia':'Dr. Juan Jimenez Diaz',
      'Pediatria':'Dr. Carlos Tapia Medinaa'
    };
    DateModel response = await usersProvider.citas();
    List<dynamic> miLista = response.data;
    miLista.forEach((elemento) {
      //print('${elemento["Especialidad"]} - ${Doctores[elemento["Especialidad"]]} \n- HORA CITA: ${elemento["FechaCita"]}.');
      citasmedicas.add('${miLista.indexOf(elemento)+1}--${elemento["Especialidad"]} - ${Doctores[elemento["Especialidad"]]} \n- HORA CITA: ${elemento["FechaCita"]}.');
    });
    return citasmedicas;
  }

}