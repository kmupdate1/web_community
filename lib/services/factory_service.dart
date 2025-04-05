import 'package:web_community/domain/usecase/auth_usecase.dart';
import 'package:web_community/domain/usecase/cache_token_usecase.dart';
import 'package:web_community/models/repositories/auth_repo_impl.dart';
import 'package:web_community/models/repositories/cache_token_repo_impl.dart';
import 'package:web_community/viewmodels/auth_viewmodel.dart';

class SignupViewModelFactory {
  static SignupViewModel getInstance() {
    final repo = AuthRepoImpl();
    final usecase = SignupUsecase(repo);
    final viewModel = SignupViewModel(usecase);

    return viewModel;
  }
}

class SigningViewModelFactory {
  static SigningViewModel getInstance() {
    final authRepo = AuthRepoImpl();
    final idTokenRepo = CacheIdTokenRepoImpl();
    final signingUsecase = SigningUsecase(authRepo);
    final saveIdTokenUsecase = SaveIdTokenUsecase(idTokenRepo);
    final viewModel = SigningViewModel(
      signingUsecase: signingUsecase,
      saveIdTokenUsecase: saveIdTokenUsecase,
    );

    return viewModel;
  }
}

class VerifyViewModelFactory {
  static VerifyViewModel getInstance() {
    final authRepo = AuthRepoImpl();
    final cacheRepo = CacheIdTokenRepoImpl();
    final verifyUsecase = VerifyUsecase(authRepo);
    final fetchUsecase = FetchIdTokenUsecase(cacheRepo);
    final viewModel = VerifyViewModel(
      verifyUsecase: verifyUsecase,
      fetchIdTokenUsecase: fetchUsecase,
    );

    return viewModel;
  }
}
