import 'package:flutter/material.dart';
import 'package:psventuresassignment/themes/pallete.dart';

class CommonIconButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  final Color color;
  final String subtitle;
  const CommonIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.subtitle = '',
    this.color = Pallete.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onPressed();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon,
          ),
        ),
        (subtitle.isEmpty) ? const SizedBox() : const SizedBox(height: 10),
        (subtitle.isEmpty)
            ? const SizedBox()
            : Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }
}
