import 'package:web_community/domain/values/token.dart';

abstract class CacheIdTokenRepo {
  Future<void> saveToken(IdToken token);
  Future<IdToken?> fetchToken();
  Future<void> deleteToken();
}
