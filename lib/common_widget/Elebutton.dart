import 'package:flutter/material.dart';
import 'package:todoapp/utilities/constants/sizes.dart';

class EleButton extends StatelessWidget {
  const EleButton({
    super.key,
    required this.onpressed,
    required this.name,
  });
  final String name;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Psizes.btnheight,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: Psizes.md),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Psizes.inputFieldRadius))),
      ),
    );
  }
}
