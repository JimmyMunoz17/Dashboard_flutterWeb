import 'package:dio/dio.dart';

import 'package:dashboard_admin/services/local_storage.dart';

//Configuración de Dio con las peticiones a la API
class CafeApi {
  static final Dio _dio = Dio();

  //Configuración de DIO
  static void configureDio() {
    //Base de la url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    //configuración de Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  //Configuración de peticiones HTTP
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      //data es el body de la respuesta.
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error de get');
    }
  }

  //Post registro
  static Future httpPost(String path, Map<String, dynamic> data) async {
    //tranformación de la data enviada
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      //data es el body de la respuesta.
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error de post');
    }
  }
}
