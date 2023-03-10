
import 'package:testjaho/App/Base/BaseApi/Network/connection_helper.dart';
import 'package:testjaho/App/Jaho/Home/Function/HomeService.dart';

import '../../../Base/BaseResponseModel/response_model.dart';
import '../../../DataCore/core_keys.dart';

class HomeRepository  {
  final api = HomeService();

  Future<ResponseModel> getDataList(int page) async {
    var responseModel = ResponseModel();
    if(await ConnectionHelper.hasConnection()) {
      responseModel = await api.getData(page);
    } else {
      responseModel.message = CoreKeys.deviceOff;

    }
    return responseModel;
  }
}