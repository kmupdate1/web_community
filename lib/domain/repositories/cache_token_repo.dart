import 'package:web_community/domain/values/token.dart';

abstract class CacheIdTokenRepo {
  Future<bool> saveToken(IdToken token);
  Future<IdToken?> fetchToken();
  Future<bool> deleteToken();
}
