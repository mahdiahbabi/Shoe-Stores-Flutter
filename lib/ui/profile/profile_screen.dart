
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/auth_info.dart';
import '../../data/repo/auth_repository.dart';
import '../../data/repo/cart_repository.dart';
import '../auth/auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('پروفایل',),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<AuthInfo?>(
        valueListenable: AuthRepository.authChangeNotifier,
        builder: (context, authinfo, child) {
          final islogin = authinfo != null && authinfo.accessToken.isNotEmpty;
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 65,
                    height: 65,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 32, bottom: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 1),
                    ),
                    child: Image.asset('assets/img/profile.png')),
                Text(islogin ? 'mahdi.m12528@yahoo.com' : 'کاربر مهمان '),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 56,
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.heart),
                        SizedBox(
                          width: 16,
                        ),
                        Text('لیست علاقمندی ها'),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 56,
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.cart),
                        SizedBox(
                          width: 16,
                        ),
                        Text('  سوابق سفارش '),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    if (islogin) {
                      showDialog(
                        useRootNavigator: true,
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title: Text('خروج از حساب کاربری'),
                              content:
                                  Text('آیا میخواهید از حساب خود خارج شوید ؟'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('خیر '),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      CartRepository
                                          .cartItemCountNotifier.value = 0;
                                      authRepository.signOut();
                                    },
                                    child: Text('بله')),
                              ],
                            ),
                          );
                        },
                      );
                 
                    } else {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 56,
                    child: Row(
                      children: [
                        Icon(islogin
                            ? CupertinoIcons.arrow_right_square
                            : CupertinoIcons.arrow_left_square),
                        SizedBox(
                          width: 16,
                        ),
                        Text(islogin
                            ? ' خروج از حساب کاربری'
                            : 'ورود به حساب کاربری'),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
