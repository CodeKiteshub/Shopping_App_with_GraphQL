import 'package:get/get.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayController extends GetxController {
  late Razorpay _razorpay;
  @override
  void onInit() {
    super.onInit();
    initializeRazorPay();
  }

  int? planId;
  String? amount;
  RxBool isLoading = false.obs;

  RxBool isPlaymentDone = false.obs;

  // void handleInappSuccess(PurchaseDetails purchaseDetails) async {
  //   print("Payment Sucessfull");

  //   bool paymentDone = await sendRazorDetails(
  //       purchaseDetails.purchaseID!, amount!, purchaseDetails.productID);
  //   if (paymentDone) {
  //     this.isPlaymentDone.value = true;
  //   }
  //   UserProfileController userProfileController = Get.put(
  //     UserProfileController(),
  //   );
  //   await userProfileController.getUserProfileData();
  //   Get.showSnackbar(
  //     GetSnackBar(
  //         title: 'Succesfull',
  //         message:
  //             'Your payment id is: ' + purchaseDetails.purchaseID.toString()),
  //   );

  //   isLoading.value = false;
  // }

  void initializeRazorPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("Payment Sucessfull");

    print(
        "${response.orderId} \n${response.paymentId} \n${response.signature}");

    // bool paymentDone = await sendRazorDetails(
    //     response.paymentId!, amount!, planId!.toString());
    // if (paymentDone) {
    //   this.isPlaymentDone.value = true;
    // }
    // UserProfileController userProfileController = Get.put(
    //   UserProfileController(),
    // );
    // await userProfileController.getUserProfileData();
    Get.showSnackbar(
      GetSnackBar(
          title: 'Succesfull',
          message: 'Your payment id is: ' + response.paymentId.toString()),
    );

    isLoading.value = false;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payemt Failed");

    print("${response.code}\n${response.message}");

    Get.showSnackbar(
      GetSnackBar(
        title: 'Error!!!',
        message: response.code.toString() + ' ' + response.message.toString(),
      ),
    );
    isLoading.value = false;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Payment Failed");
    isLoading.value = false;
  }

  void doPayment(
    int amount,
    String name,
    String phone,
    String planId,
  ) {
    isLoading.value = true;
    isPlaymentDone.value = false;
    this.amount = amount.toString();

    var options = {
     // 'key': 'rzp_test_UfIqGg33hpskpp',
     'key':'rzp_live_yl8ffRosNiw7HV',
      'amount': amount,
      'name': name,
      'description': planId,
      'prefill': {'contact': phone}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }
}
