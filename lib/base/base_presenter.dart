import 'package:naguib_selim/base/base_view.dart';
import 'package:naguib_selim/base/error_listener.dart';
import 'package:naguib_selim/network/network_manager.dart';

class BasePresenter implements ErrorListener {
  // AppCache appCache;
  NetworkManager? networkManager;

  BaseView view;

  BasePresenter(this.view) {
    // appCache = AppCache.getInstance();
    networkManager = NetworkManager();
  }

  @override
  void onError(int code, String message) {
    // String msg = Localize.get("noInternet");
    String msg = "No Internet Connection";

    switch (code) {
      case 401:
        msg = "No Internet Connection";
        // view.showCustomAlert("LOGOUT");
        break;
      case 405:
        msg = "No Internet Connection";
        // msg = Localize.get("serverError");
        break;
      case 307:
        msg = "No Internet Connection";
        // msg = Localize.get("serverError");
        break;
    }

    if (message != null) msg = message;

    view.hideProgress();
    if (code != 404) {
      view.showErrorMsg(msg);
    }
  }
}
