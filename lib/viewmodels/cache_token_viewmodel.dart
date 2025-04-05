import 'package:web_community/domain/usecase/cache_token_usecase.dart';

class DeleteIdTokenViewModel {
  final DeleteIdTokenUsecase _deleteIdTokenUsecase;

  DeleteIdTokenViewModel(DeleteIdTokenUsecase deleteIdTokenUsecase)
    : _deleteIdTokenUsecase = deleteIdTokenUsecase;
}
