import 'package:web_community/domain/repositories/cache_token_repo.dart';
import 'package:web_community/domain/values/token.dart';

class SaveIdTokenUsecase {
  final CacheIdTokenRepo _repo;

  Future<bool> execute(String rawToken) async {
    try {
      await _repo.saveToken(IdToken(rawToken));
      return true;
    } catch (e) {
      return false;
    }
  }

  SaveIdTokenUsecase(CacheIdTokenRepo repo) : _repo = repo;
}

class FetchIdTokenUsecase {
  final CacheIdTokenRepo _repo;

  Future<IdToken?> execute() async {
    return await _repo.fetchToken();
  }

  FetchIdTokenUsecase(CacheIdTokenRepo repo) : _repo = repo;
}

class DeleteIdTokenUsecase {
  final CacheIdTokenRepo _repo;

  Future<bool> execute() async {
    return await _repo.deleteToken();
  }

  DeleteIdTokenUsecase(CacheIdTokenRepo repo) : _repo = repo;
}
