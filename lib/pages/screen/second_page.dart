import 'package:flutter/material.dart';
import 'package:synapsis_project/color_constants.dart';
import 'package:synapsis_project/widgets/device_soc_info.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<StatefulWidget> createState() => _StateSecondPage();
}

class _StateSecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Device SOC Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.primaryFontColor,
                ),
              ),
              const SizedBox(height: 10),
              const DeviceSocInfo(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mainColor,
        onPressed: () {
          Navigator.pushNamed(context, 'third_page');
        },
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
