import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/model/sign_up_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpBody)async{
  return await apiClient.postData(
      AppConstants.REGISTRATION,
      signUpBody.toJson());
  }

  Future<String> getUserToken()async{
    return await sharedPreferences.getString(AppConstants.TOKEN)?? "None";
  }
  
  Future<Response> login(String email, String password)async{
  return await apiClient.postData(
      AppConstants.LOGIN, {"email":email, "password":password});
  }

  Future<bool>saveUserToken(String token) async{
    apiClient.token=token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void >saveUserNumberAndPassword(String number, String password) async{
    try{
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

}