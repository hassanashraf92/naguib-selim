import 'package:naguib_selim/base/base_presenter.dart';
import 'package:naguib_selim/base/base_view.dart';
import 'package:naguib_selim/data/user_model_response.dart';

class AuthPresenter extends BasePresenter {
  AuthPresenter(BaseView view) : super(view);

  Future<bool> register(String name, String type, String b2bNumber,
      String phone, String email, String password,
      {Function()? onSuccess}) async {
    bool _success = false;
    Map<String, dynamic> params = {
      "name": name,
      "type": type,
      "b2b_number": b2bNumber,
      "phone": phone,
      "email": email,
      "password": password
    };

    view.showProgress();

    UserDataResponse userResponse = await networkManager?.post(
      "https://nagiubselium.egypsy.net/api/auth/register",
      param: params,
      body: {},
    );

    view.hideProgress();

    if (userResponse == null) {
      print("USER IS NULL");
      return false;
    }

    _success = true;

    if (onSuccess != null) onSuccess();

    return _success;
  }
}
