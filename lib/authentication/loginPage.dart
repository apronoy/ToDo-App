import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp/authentication/signupPage.dart';
import 'package:todoapp/common_widget/Elebutton.dart';
import 'package:todoapp/controler/login_controler.dart';
import 'package:todoapp/utilities/constants/sizes.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(LoginControler());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Psizes.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // space from top ...
              const SizedBox(height: Psizes.appBarheight),
              // title and subtitle ..
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title ..
                  Text('SignIn  ',
                      style: TextStyle(
                          fontSize: Psizes.lg, fontWeight: FontWeight.w400)),
                  // subtitle  ...
                  Text("Turn Your Plans into Progress ",
                      style: TextStyle(
                          fontSize: Psizes.md, fontWeight: FontWeight.w300)),

                  SizedBox(height: Psizes.defaultspaceforLoginpage),
                ],
              ),
              // email ...
              TextFormField(
                controller: controler.email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Psizes.inputFieldRadius))),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail_outline)),
              ),
              const SizedBox(height: Psizes.inputFieldRadius),
              // password ...
              Obx(
                () => TextFormField(
                  controller: controler.password,
                  obscureText: controler.isShow.value,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Psizes.inputFieldRadius))),
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controler.isShow.toggle();
                          },
                          icon: controler.isShow.value
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye))),
                ),
              ),
              const SizedBox(height: Psizes.spacebtnInputFields / 2),
              //Agree conditions buttons ...
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Checkbox(
                            value: controler.isagree.value,
                            onChanged: (value) {
                              controler.isagree.toggle();
                              debugPrint(
                                  'User Agree With Our Privacy And Policy !!');
                            }),
                        const Text('Agree to all Terms & condition'),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: Psizes.spacebtnInputFields / 2),
              // submit button ...
              EleButton(onpressed: controler.loginUser, name: 'Submit'),
              const SizedBox(height: Psizes.md),
              //go to create account button / signin botton ...
              TextButton(
                  onPressed: () {
                    Get.to(() => const Signuppage());
                  },
                  child: const Text('First Time ? SignIn')),
              const SizedBox(height: Psizes.md),
              // google sign in ..
              IconButton(
                  onPressed: controler.googleSignin,
                  icon: SizedBox(
                      height: 50,
                      child: Image.asset('assets/icons/google.png'))),
            ],
          ),
        ),
      ),
    );
  }
}
