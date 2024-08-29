import 'package:ecommerce_api/utils/app_color.dart';
import 'package:ecommerce_api/widgets/build_bottom_navbar_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentDonePage extends StatefulWidget {
  final int amount;
  final String paymentId;
  const PaymentDonePage({
    super.key,
    required this.amount,
    required this.paymentId,
  });

  @override
  State<PaymentDonePage> createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/paymentdone.json',
                frameRate: const FrameRate(120),
                width: 300,
                height: 300,
              ),
            ),
            Center(
              child: BuildTextWidget(
                text: 'Payment Successfull !',
                size: 20,
                weight: FontWeight.w900,
                color: AppColors().primaryColors,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildTextWidget(
                    text: 'Amount Paid : \u{20B9}${widget.amount}',
                    size: 12,
                    color: const Color.fromARGB(255, 99, 99, 99),
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BuildTextWidget(
                    text: 'Transaction Id : ${widget.paymentId}',
                    size: 12,
                    color: const Color.fromARGB(255, 99, 99, 99),
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 230,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const BuildBottomNavbarWidget()));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors().primaryColors,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(300)),
                child: const BuildTextWidget(
                  text: "Done",
                  color: Colors.white,
                  weight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
