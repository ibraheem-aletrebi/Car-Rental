
import 'package:car_rental/Feature/auth/data/model/country_model.dart';

abstract class CountryRepo {
  Future<List<CountryModel>> getCountries();
}