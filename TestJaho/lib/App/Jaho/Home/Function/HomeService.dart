

import 'package:testjaho/App/Base/BaseApi/Network/service_bloc.dart';
import 'package:testjaho/App/Base/BaseApi/Network/end_points.dart' as Endpoints;

import 'package:testjaho/App/Base/BaseApi/method_api.dart';

import '../../../Base/BaseResponseModel/response_model.dart';

class HomeService extends ServiceBloc {

  Future<ResponseModel> getData(int page) async {
    var response = ResponseModel();
    await connectApi(null, Endpoints.myUrl.url+page.toString(), MethodApi.GET, (p0) => response = p0);
    return response;
  }

}