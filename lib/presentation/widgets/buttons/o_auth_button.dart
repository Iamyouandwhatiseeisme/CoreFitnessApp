import 'package:flutter/material.dart';

class OauthButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  const OauthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          foregroundColor: Colors.white,
          shadowColor: Colors.grey.withAlpha(70),
          backgroundColor: Colors.grey.withAlpha(35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        ),
        onPressed: () {
          onPressed();
        },
        label: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black.withAlpha(200),
          ),
        ),
        icon: icon,
      ),
    );
  }
}
