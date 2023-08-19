import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/model/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  Future<ResponseModel> registration(SignUpModel signUpBody)async{
    _isLoading=true;
    Response response=await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode==200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel=ResponseModel(true, response.body["token"]);
    }else{
      responseModel=ResponseModel(false, response.statusText!);
    }
    _isLoading=true;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password)async{
    authRepo.getUserToken();
    _isLoading=true;
    Response response=await authRepo.login(email, password);
    late ResponseModel responseModel;
    if(response.statusCode==200){
      print("Backend Token");
      authRepo.saveUserToken(response.body["token"]);
      print(response.body["token"].toString());
      responseModel=ResponseModel(true, response.body["token"]);
    }else{
      responseModel=ResponseModel(false, response.statusText!);
    }
    _isLoading=true;
    update();
    return responseModel;
  }



  void saveUserNumberAndPassword(String number, String password){
    authRepo.saveUserNumberAndPassword(number, password);
  }



}