import 'package:flutter/material.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Elements/validate.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'HomeScr.dart';
import 'LoginScr.dart';
import 'RegisterScr.dart';
import 'bottomNav.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _regMethod() async {
      var isvalid = _formKey.currentState!.validate();
      // print('valid $isvalid');
      if (!isvalid) {
        return 'Please Enter Valid Data';
      }
      _formKey.currentState!.save();
      if (isvalid == true) {
        navigationPush(
            context,
            UserNavigationBar(
              currentTab: 0,
            ));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EditTextField(
                textAlign: TextAlign.left,
                txtColor: txtBlackColor,
                formBox: true,
                fillColor: borderColor,
                headTxt: 'Name',
                hintText: 'Enter Name',
                controller: nameController,
                vertical: 15,
                validator: validateField,
              ),
              heightSizedBox(10.0),
              EditTextField(
                textAlign: TextAlign.left,
                txtColor: txtBlackColor,
                formBox: true,
                fillColor: borderColor,
                headTxt: 'Username',
                hintText: 'Enter Username',
                controller: userNameController,
                vertical: 15,
                validator: validateField,
              ),
              heightSizedBox(10.0),
              EditTextField(
                textAlign: TextAlign.left,
                txtColor: txtBlackColor,
                formBox: true,
                fillColor: borderColor,
                headTxt: 'Mobile',
                hintText: 'Enter Username',
                controller: mobileController,
                vertical: 15,
                validator: validateField,
              ),
              heightSizedBox(10.0),
              EditTextField(
                  vertical: 15,
                  textAlign: TextAlign.left,
                  txtColor: txtBlackColor,
                  headTxt: 'Password',
                  fillColor: borderColor,
                  hintText: 'Enter Password',
                  controller: passwordController,
                  validator: validateField,
                  obscureText: true,
                  formBox: true),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Btn(
                  // alignment: Alignment.bottomLeft,
                  height: 45,
                  width: 100,
                  onTap: _regMethod,
                  btnName: 'Register',
                  txtColor: txtWhiteColor,
                  color: coffeColor,
                  // onTap: () => navigationPush(context, OrderDeatilsScreen()),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          // bottomSheet:
          Container(
        height: 85,
        decoration: BoxDecoration(
          color: offWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18.0, left: 25, right: 25, bottom: 5),
          child: Column(
            children: [
              Txt(
                t: ' Have an account ?',
                color: greyColor,
              ),
              heightSizedBox(5.0),
              Btn(
                onTap: () => navigationPush(context, LoginScreen()),
                height: 40,
                btnName: 'Login',
                color: redColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
