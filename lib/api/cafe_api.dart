import 'package:dio/dio.dart';
import 'dart:typed_data';

import 'package:dashboard_admin/services/local_storage.dart';

//Configuración de Dio con las peticiones a la API
class CafeApi {
  static final Dio _dio = Dio();

  //Configuración de DIO
  static void configureDio() {
    //Base de la url Desarrollo
    // _dio.options.baseUrl = dotenv.env['URL_DESARROLLO']!;
    //Base de la url Producción
    // _dio.options.baseUrl = dotenv.env['URL_PRODUCCION']!;
    _dio.options.baseUrl = 'https://dashboard-admin-545j.onrender.com/api';

    //configuración de Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  //Configuración de peticiones HTTP GET
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      //data es el body de la respuesta.
      return response.data;
    } on DioException catch (e) {
      throw ('Error de get $e');
    }
  }

  //Configuración de peticiones HTTP POST
  static Future httpPost(String path, Map<String, dynamic> data) async {
    //tranformación de la data enviada
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      //data es el body de la respuesta.
      return response.data;
    } on DioException catch (e) {
      throw ('Error de post $e');
    }
  }

  //Configuración de peticiones HTTP PUT
  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      throw ('Error de PUT $e');
    }
  }

//Configuración de peticiones HTTP DELETE
  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.delete(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      throw ('Error de Delete $e');
    }
  }

  //Configuración de peticiones HTTP PUT upload
  static Future httpUploadPut(String path, Uint8List bytes) async {
    final formData = FormData.fromMap({
      //carga de archivos con dio "multiple files"
      //archivo es el nombre del backend que recibe la imagen o archivos
      'archivo': MultipartFile.fromBytes(bytes)
    });
    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      throw ('Error de PUT $e');
    }
  }
}
