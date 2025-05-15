import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// Razorpay
class Paymentgateway extends StatefulWidget {
  const Paymentgateway({super.key});

  @override
  State<Paymentgateway> createState() => _PaymentgatewayState();
}

class _PaymentgatewayState extends State<Paymentgateway> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("===${response.data}");
    print("===${response.paymentId}");
    print("===${response.orderId}");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("SUCCESS")));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error")));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Wallet")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_KSSN48248hxLnm',
                'amount': 100 * 100,
                'name': 'Kurti',
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': '+91 9409420588',
                  'email': 'darshanpipaliya56@gmail.com'
                }
              };
              _razorpay.open(options);
            },
            child: Text("Buy Now")),
      ),
    );
  }
}
