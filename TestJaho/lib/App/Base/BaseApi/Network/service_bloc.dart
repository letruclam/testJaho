
import 'dart:convert';

import '../../BaseResponseModel/response_model.dart';
import '../http_helper.dart';
import 'package:testjaho/App/Base/BaseApi/Network/option_network.dart'
as option_network;

import '../method_api.dart';

class ServiceBloc {

   Future connectApi(dynamic param,String url,MethodApi method, Function(ResponseModel) res) async {
     var response = ResponseModel();
     dynamic retApi;
     if(method == MethodApi.POST) {
        retApi = HttpHelper.post(url, body: param);
     } else if(method == MethodApi.GET) {
       retApi = HttpHelper.get(url);
     }
     await retApi.then((value) {
       response.status = 200;
        var res  = jsonDecode(value.toString());
       response.data = res;
       option_network.optionNetWork.logPrint('RESPONSE:');
       option_network.optionNetWork.printAll(value);
     }).catchError((e) {
       response.message = e.toString();
       option_network.optionNetWork.logPrint('ERROR:');
       option_network.optionNetWork.printAll(e.toString());
     });
     res.call(response);
   }

 }