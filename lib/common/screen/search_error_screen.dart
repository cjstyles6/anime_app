import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SearchErrorScreen extends StatelessWidget {
  const SearchErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: SizedBox(
          height: 0.7.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/3ca1920b-06b1-4bcd-937b-a01eb58113e0/qMZ8XGiKIT.json',
              ),
              const SizedBox(height: 10),
              const Text('Not Found')
                  .fontSize(25)
                  .textColor(primaryColor)
                  .bold(),
              10.heightBox,
              const Text(
                'Sorry, the keyword you entered could not be found. Try again or search with another keyword.',
                textAlign: TextAlign.center,
              ).fontSize(15).textColor(Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
