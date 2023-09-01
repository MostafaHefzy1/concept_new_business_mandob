import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/style.dart';
import '../../utils/shared_preferences.dart';
import 'login_screen.dart';
import 'orders_view/orders_representative_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() {
    if ((CashHelper.getData(key: "idRepresentative")) == null) {
       Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const LoginScreen()),
              (route) => false);
    
    } else {
         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
