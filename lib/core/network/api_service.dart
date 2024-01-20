import 'package:dio/dio.dart';
import 'package:kotoby_app/constants.dart';

class ApiService {

  
  ApiService(this._dio);
  final Dio _dio;
   
  Future<Map<String,dynamic>> get({required endPoint})async{
   
   var response =await _dio.get(baseUrl+endPoint);
   return response.data;

  }


}