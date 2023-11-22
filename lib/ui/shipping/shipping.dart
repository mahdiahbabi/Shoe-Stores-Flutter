


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart/price_info.dart';
import '../receipt/payment_receipt.dart';

class ShippingScreen extends StatelessWidget {
  final int payablePrice;
  final int shippingCost;
  final int totalPrice;

  const ShippingScreen(
      {Key? key,
      required this.payablePrice,
      required this.shippingCost,
      required this.totalPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحویل گیرنده'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(label: Text('نام و نام خانوادگی')),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(label: Text('شماره تماس')),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(label: Text('کد پستی')),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(label: Text('آدرس')),
              ),
              const SizedBox(
                height: 12,
              ),
              PriceInfo(
                  payablePrice: payablePrice,
                  shippingCost: shippingCost,
                  totalPrice: totalPrice),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                 PaymentReceiptScreen()));
                      },
                      child: const Text('پرداخت در محل')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('پرداخت اینترنتی'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
