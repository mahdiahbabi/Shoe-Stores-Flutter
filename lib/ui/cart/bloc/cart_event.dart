









import '../../../data/auth_info.dart';

abstract class CartEvent  {
  const CartEvent();


}

class CartStarted extends CartEvent {
  final AuthInfo? authInfo;
  final bool isRefreshing;

  const CartStarted(this.authInfo, {this.isRefreshing = false});
}

class CartDeleteButtonClicked extends CartEvent {
  final int cartItemId;

  const CartDeleteButtonClicked(this.cartItemId);


}

class CartAuthInfoChanged extends CartEvent {
  final AuthInfo? authInfo;

  const CartAuthInfoChanged(this.authInfo);
}

class CartIncreaseCountButtonClicked extends CartEvent {
  final int cartItemId;

  const CartIncreaseCountButtonClicked(this.cartItemId);


}

class CartDecreaseCountButtonClicked extends CartEvent {
  final int cartItemId;

  const CartDecreaseCountButtonClicked(this.cartItemId);

 
}
