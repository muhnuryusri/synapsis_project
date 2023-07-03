import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:synapsis_project/services/local_auth_service.dart';
import 'package:synapsis_project/widgets/custom_alert_dialog.dart';
import 'package:synapsis_project/widgets/custom_outlined_button.dart';

import '../../color_constants.dart';
import '../../models/user.dart';
import '../../services/database_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String? username;
  late String? password;
  late bool showLoading = false;
  late bool authenticated = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();

  void _login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    User? user = await databaseHelper.getUser(username);
    if (user != null && user.password == password) {
      Fluttertoast.showToast(msg: 'Login berhasil');
      Navigator.pushNamed(context, 'first_page');
    } else {
      Fluttertoast.showToast(msg: 'Username atau password salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showLoading,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/synapsis_id_logo.png'),
                  const SizedBox(height: 10),
                  Text(
                    'Masuk',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryFontColor),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    titleText: 'Username',
                    hintText: 'Masukkan username',
                    icon: Icons.person,
                    isPassword: false,
                    textController: usernameController,
                  ),
                  CustomTextField(
                    titleText: 'Password',
                    hintText: 'Masukkan password',
                    icon: Icons.lock,
                    isPassword: true,
                    textController: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    color: ColorConstants.mainColor,
                    text: 'Masuk',
                    onPressed: _login,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Divider(
                          thickness: 1,
                          color: ColorConstants.strokeColor,
                        ),
                      ),
                      Text(
                        "atau",
                        style: TextStyle(
                          color: ColorConstants.secondaryFontColor,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: Divider(
                          thickness: 1,
                          color: ColorConstants.strokeColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomOutlinedButton(
                    icon: Icons.nfc,
                    text: "NFC",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                            title: "Masuk dengan NFC",
                            icon: Icons.nfc,
                            contentTitle: "Scan NFC",
                            contentDescription:
                                "Nyalakan fitur NFC reader dan tempelkan NFC ke perangkat kamu untuk masuk"),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlinedButton(
                    icon: Icons.fingerprint,
                    text: "Fingerprint",
                    onPressed: () async {
                      final authenticate = await LocalAuth().authenticate();
                      setState(() {
                        authenticated = authenticate;
                        if (authenticated) {
                          Fluttertoast.showToast(msg: 'Login berhasil');
                          Navigator.pushNamed(context, 'first_page');
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlinedButton(
                    icon: Icons.qr_code,
                    text: "QR Code",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
