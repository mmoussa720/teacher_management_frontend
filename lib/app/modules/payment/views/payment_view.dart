import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/responsive_template.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(desktop: Center(child: Text("Payment")));
  }
}
