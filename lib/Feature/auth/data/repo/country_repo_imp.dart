

import 'dart:developer';

import 'package:car_rental/Feature/auth/data/model/country_model.dart';
import 'package:car_rental/Feature/auth/domain/repo/country_repo.dart';
import 'package:car_rental/core/services/network_services/api_service.dart';
import 'package:car_rental/core/services/network_services/back_end_end_point.dart';

class CountryRepoImp  implements CountryRepo{
  final ApiService apiService;

  CountryRepoImp({required this.apiService});
  @override
  Future<List<CountryModel>> getCountries() async{
    try{
      var response = await apiService.get(endPoint: BackEndEndPoint.countriesEndPoint).then((value) => value['data']);
      return response.map((e) => CountryModel.fromJson(e)).toList();
    }catch(e){
      log('error: ${e.toString()} From -> country repo imp get countries');
      throw Exception(e.toString());  
    }
  }
}