import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheff_new/data/source/auth_data_source.dart';
import '../../common/http_client.dart';
import '../authInfo.dart';

final authRepository = AuthRepository(AuthRemoteDataSource(
  httpClient,
));

abstract class IAuthRepository {
  Future<void> login(String username, String password);

  Future<void> signUp(String username, String password);

  Future<void> refreshToken();

  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthInfo?> authChangeNotifier =
  ValueNotifier(null);
  final IAuthDataSource dataSource;

  AuthRepository(this.dataSource);

  static bool isUserLoggedIn() {
    return authChangeNotifier.value != null &&
        authChangeNotifier.value!.accessToken != null &&
        authChangeNotifier.value!.accessToken.isNotEmpty;
  }

  @override
  Future<void> login(String username, String password) async {
    final AuthInfo authInfo = await dataSource.login(username, password);
    _persistAuthTokens(authInfo);
    debugPrint("access token is: " + authInfo.accessToken);
  }

  @override
  Future<void> signUp(String username, String password) async {
    final AuthInfo authInfo = await dataSource.signUp(username, password);
    _persistAuthTokens(authInfo);
    debugPrint("access token is: " + authInfo.accessToken);
  }

  @override
  Future<void> refreshToken() async {
    if (authChangeNotifier.value != null) {
      final AuthInfo authInfo =
      await dataSource.refreshToken(authChangeNotifier.value!.refreshToken);
      debugPrint('refresh token is: ${authInfo.refreshToken}');
      _persistAuthTokens(authInfo);
    }
  }

  Future<void> _persistAuthTokens(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.accessToken);
    sharedPreferences.setString("refresh_token", authInfo.refreshToken);
    sharedPreferences.setString("email", authInfo.email);
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';

    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      authChangeNotifier.value = AuthInfo(
          accessToken, refreshToken,
          sharedPreferences.getString("email") ?? '');
    }
  }

  @override
  Future<void> signOut() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.clear();
    authChangeNotifier.value = null;
  }
}
