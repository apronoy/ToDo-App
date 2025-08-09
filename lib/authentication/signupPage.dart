import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp/authentication/loginPage.dart';
import 'package:todoapp/common_widget/Elebutton.dart';
import 'package:todoapp/controler/signup_controler.dart';
import 'package:todoapp/utilities/model/user_model.dart';
import 'package:todoapp/utilities/constants/sizes.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(SignupControler());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Psizes.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // space from top ...
              const SizedBox(height: Psizes.appBarheight),
              // title and subtitle ..
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title ..
                  Text('SignUp  ',
                      style: TextStyle(
                          fontSize: Psizes.lg, fontWeight: FontWeight.w400)),
                  // subtitle  ...
                  Text("Just You and Your To-Dos ",
                      style: TextStyle(
                          fontSize: Psizes.md, fontWeight: FontWeight.w300)),
                ],
              ),
              // space ..
              const SizedBox(height: 50),
              // Full Name  textfield section ...
              TextFormField(
                controller: controler.fullname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Psizes.inputFieldRadius))),
                    labelText: 'Full Name',
                    prefixIcon: Icon(Iconsax.user)),
              ),
              // space  ..
              const SizedBox(height: Psizes.spacebtnInputFields),
              Row(mainAxisSize: MainAxisSize.min, children: [
                // Phone textfield section  ..
                Expanded(
                  child: TextFormField(
                    controller: controler.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Psizes.inputFieldRadius))),
                        labelText: 'Phone',
                        prefixIcon: Icon(Iconsax.call)),
                  ),
                ),
                const SizedBox(width: Psizes.spacebtnInputFields),
                // country textfield section ..
                Expanded(
                  child: TextFormField(
                    controller: controler.country,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Psizes.inputFieldRadius))),
                        labelText: 'Country',
                        prefixIcon: Icon(Iconsax.global)),
                  ),
                ),
              ]),
              // space  ..
              const SizedBox(height: 15),
              //Email textfield section  ..
              TextFormField(
                controller: controler.email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Psizes.inputFieldRadius))),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail_outline)),
              ),
              const SizedBox(height: 15),
              // password textfield section  ...
              Obx(
                () => TextFormField(
                  controller: controler.password,
                  obscureText: controler.isShow.value,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Psizes.inputFieldRadius))),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            controler.isShow.toggle();
                          },
                          icon: controler.isShow.value
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye)),
                      prefixIcon: const Icon(Iconsax.password_check)),
                ),
              ),
              // space  ..
              const SizedBox(height: 20),
              //submit button
              EleButton(
                  name: 'Submit',
                  onpressed: () {
                    controler.createAccount();
                    // to save data on cloude store ...
                    controler.uploadData(UserModel(
                        fullname: controler.fullname.text,
                        phone: controler.phone.text,
                        email: controler.email.text,
                        id: '',
                        country: controler.country.text));
                  }),
              // space  ..
              const SizedBox(height: 10),
              // if already have accounts then go to login page ..
              TextButton(
                  onPressed: () {
                    Get.off(() => const Loginpage());
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
