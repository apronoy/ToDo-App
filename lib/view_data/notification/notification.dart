import 'package:flutter/material.dart';

class NotificationPages extends StatelessWidget {
  const NotificationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No Notifications ',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
