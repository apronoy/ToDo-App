import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todoapp/utilities/constants/colors.dart';
import 'package:todoapp/utilities/helperfuction/helperfuction.dart';
import 'package:todoapp/view_data/notification/notification.dart';

class Appbar extends StatefulWidget {
  const Appbar({
    super.key,
  });

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    //dark mode veriable ..
    final bool isdark = Phelperfuction.isdark(context);

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      backgroundColor: isdark ? Pcolors.darkgrey : Pcolors.light,
      title: Row(
        children: [
          // profile ..
          GestureDetector(
            child: const CircleAvatar(
              minRadius: 20,
              maxRadius: 28,
              backgroundImage: AssetImage('assets/images/suit.jpeg'),
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'APronoy Sarkar ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '@apronoy',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationPages());
              },
              icon: const Icon(Iconsax.notification))
        ],
      ),
    );
  }
}
