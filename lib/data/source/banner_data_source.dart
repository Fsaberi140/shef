import 'package:dio/dio.dart';
import 'package:sheff_new/data/banner.dart';
import '../common/response_validator.dart';

abstract class IBannerDataSource{
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource with HttpResponseValidator implements IBannerDataSource{
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);
  @override
  Future<List<BannerEntity>> getAll() async{
    final response= await httpClient.get("Banner/slider");
    validateResponse(response);
    final List<BannerEntity> banners=[];
    (response.data as List).forEach((jsonObject) {
      banners.add(BannerEntity.fromJson(jsonObject));
    });
    return banners;
  }

}