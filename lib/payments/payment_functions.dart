import 'package:dio/dio.dart';
import 'package:ecommerce_api/payments/create_payment_intent.dart';
import 'package:ecommerce_api/screens/payment_done_page.dart';
import 'package:ecommerce_api/utils/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../main.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();
  String? paymentId;
  int? payAmount;

  Future<void> makePayment(
      {required int amount, required VoidCallback callBack, required BuildContext? context}) async {
    try {
      String? paymentIntentClientSecret = await createPaymentIntent(
        amount,
        "inr",
      );
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "E commerce",
        ),
      );

      await processPayment(callBack: callBack, context: context);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      payAmount = amount;
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(
          amount,
        ),
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );
      if (response.statusCode == 200) {
        paymentId = response.data["id"];
        print('testtest$paymentId');
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> processPayment(
      {required VoidCallback callBack, required BuildContext? context}) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      box!.clear();
      cartModelList.clear();

      Navigator.pushReplacement(
        context!,
        MaterialPageRoute(
          builder: (context) => PaymentDonePage(
            amount: payAmount!,
            paymentId: paymentId!,
          ),
        ),
      );
      callBack();
    } catch (e) {
      print(e);
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}

retrieveTxnId({required BuildContext context, required String paymentIntent}) async {
  try {
    final Dio dio = Dio();

    var response = await dio.get(
      "https://api.stripe.com/v1/charges?payment_intent=$paymentIntent",
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type": 'application/x-www-form-urlencoded'
        },
      ),
    );
    if (response.statusCode == 200) {
      var date = response.data["client_secret"];
      print("Transaction Id ${date['data'][0]['balanceTransaction']}");
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
