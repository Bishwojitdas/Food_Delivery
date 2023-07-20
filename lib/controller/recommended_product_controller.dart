import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/model/recommended_product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
final RecommendedProductRepo recommendedProductRepo;
RecommendedProductController({required this.recommendedProductRepo});

List<RecommendedProduct> _recommendedProductList=[];
List<RecommendedProduct>get recommendedProductList=>_recommendedProductList ;

bool _isLoaded=false;
bool get isLoaded=>_isLoaded;

Future<void> getRecommendedProductList()async{
  Response response= await recommendedProductRepo.getRecommendedProductList();
  if(response.statusCode==200){
    _recommendedProductList=[];
    for(var item in response.body){
      _recommendedProductList.add(RecommendedProduct.fromJson(item));
    }
    _isLoaded=true;
    update();
  }
}


}