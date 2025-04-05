class Validators {
	static String? validateEmail(String? value) {
		if (value == null || value.isEmpty) return "メールアドレスを入力してください";
		final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
		if (!emailRegex.hasMatch(value)) return "正しいメール形式で入力してください";
		return null;
	}

	static String? validatePassword(String? value) {
		if (value == null || value.length < 8) return "パスワードは8文字以上必要です";
		final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#$%^&*()_+=\-`~\[\]\{\}\|;:",./<>?]).{8,}$');
		if(!passwordRegex.hasMatch(value)) return "必要な文字または記号を含めてください";
		return null;
	}

	static String? validateUsername(String? value) {
		if (value == null || value.isEmpty) return "ユーザー名を入力してください";
		return null;
	}
}
