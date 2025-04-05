import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_community/core/constants/storage_keys.dart';
import 'package:web_community/domain/repositories/cache_token_repo.dart';
import 'package:web_community/domain/values/token.dart';

class CacheIdTokenRepoImpl implements CacheIdTokenRepo {
  static final _key = StorageKeys.getIdTokenKey();

  @override
  Future<void> saveToken(IdToken token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token.toString());
  }

  @override
  Future<IdToken?> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_key);
    if (token == null || token.isEmpty) {
      return null;
    } else {
      return IdToken(token);
    }
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
