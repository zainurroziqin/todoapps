import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor
  });

  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}