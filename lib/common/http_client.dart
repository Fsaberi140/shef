import 'package:dio/dio.dart';
import 'package:sheff_new/data/repo/auth_repository.dart';
import 'package:sheff_new/pages/auth/bloc/auth_bloc.dart';

final httpClient =
Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'))..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  final authInfo =AuthRepository.authChangeNotifier.value;
  if (authInfo!=null && authInfo.accessToken.isNotEmpty){
    options.headers['Authorization']= 'Bearer ${authInfo.accessToken}';

  }
},));