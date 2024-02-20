import 'package:get/get.dart';
import 'package:posta_medica_huancayo/src/enviroment/enviroment.dart';
import 'package:posta_medica_huancayo/src/models/datemodel.dart';
import 'package:posta_medica_huancayo/src/models/response_api.dart';
import 'package:posta_medica_huancayo/src/models/user.dart';

class  UsersProvider extends GetConnect{
    String url = Enviroment.API_URL;

    Future<Response> create(User user) async{
      Response response = await post(url,user.toJson(),
      headers: {
        'Content-Type' : 'application/json'
      });
      return response;
    }
    Future<ResponseApi> login(String usuario,String clave) async{
      Response response = await post('$url/login.php',
      {
        'usuario': usuario,
        'clave':clave
      },
          headers: {
            'Content-Type' : 'application/json'
          });
      if(response.body==null){
        Get.snackbar("Error", "Nose pudo ejecutar la peticion");
        return ResponseApi();
      }
      ResponseApi responseApi=ResponseApi.fromJson(response.body);
      return responseApi;
    }
    Future<Response> date(String especialidad,String fecha) async{
      Response response = await post(url,
          {
            'especialidad': especialidad,
            'fecha':fecha
          },
          headers: {
            'Content-Type' : 'application/json'
          });
      return response;
    }
    Future<DateModel> citas() async{
      Response response = await post('$url/citas.php',{},
          headers: {
            'Content-Type' : 'application/json'
          });
      if(response.body==null){
        Get.snackbar("Error", "Nose pudo ejecutar la peticion");
        return DateModel();
      }
      DateModel datemodel = DateModel.fromJson(response.body);
      return datemodel;
    }
}