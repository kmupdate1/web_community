import 'package:web_community/domain/usecase/auth_usecase.dart';
import 'package:web_community/domain/usecase/cache_token_usecase.dart';
import 'package:web_community/models/repositories/auth_repo_impl.dart';
import 'package:web_community/models/repositories/cache_token_repo_impl.dart';
import 'package:web_community/viewmodels/auth_viewmodel.dart';

class SignupViewModelFactory {
  static SignupViewModel getInstance() {
    final repo = SignupRepoImpl();
    final usecase = SignupUsecase(repo);
    final viewModel = SignupViewModel(usecase);

    return viewModel;
  }
}

class SigningViewModelFactory {
  static SigningViewModel getInstance() {
    final authRepo = SigningRepoImpl();
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
    final repo = VerifyRepoImpl();
    final usecase = VerifyUsecase(repo);
    final viewModel = VerifyViewModel(usecase);

    return viewModel;
  }
}
