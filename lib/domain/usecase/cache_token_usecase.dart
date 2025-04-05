import 'package:web_community/domain/repositories/cache_token_repo.dart';
import 'package:web_community/domain/values/token.dart';

class SaveIdTokenUsecase {
  final CacheIdTokenRepo _repo;

  Future<bool> execute(String rawToken) async {
    try {
      final token = IdToken(rawToken);
      await _repo.saveToken(token);
      return true;
    } catch (e) {
      return false;
    }
  }

  SaveIdTokenUsecase(CacheIdTokenRepo repo) : _repo = repo;
}

class FetchIdTokenUsecase {
  final CacheIdTokenRepo _repo;

  Future<IdToken?> execute() {
    return _repo.fetchToken();
  }

  FetchIdTokenUsecase(CacheIdTokenRepo repo) : _repo = repo;
}
