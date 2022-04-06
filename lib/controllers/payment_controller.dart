import 'package:get/get.dart';
import 'package:pattern_getx/models/post_model.dart';
import 'package:pattern_getx/services/http_service.dart';

class PaymentController extends GetxController{
  var isLoading=false;
  var items=[];

  Future apiPostList()async{
    isLoading=true;
    update();

    var response= await Network.GET(Network.API_LIST,Network.paramsEmpty());
    if(response!=null){
      items=Network.parsePostList(response);
    }
    else{
      items=[];
    }
    isLoading=false;
    update();
  }

  Future<bool> apiPostDelete(Post post)async{
    isLoading=true;
    update();

    var response =Network.DEL(Network.API_DELETE+ post.id.toString(),Network.paramsEmpty());

    apiPostList();
    return response!=null;
  }
}