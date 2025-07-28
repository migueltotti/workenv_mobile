import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIconButton extends StatelessWidget {
  const SocialMediaIconButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        log('social medial icon button pressed');
      },
      style: TextButton.styleFrom(iconColor: Color.fromRGBO(13, 27, 52, 0.85)),
      child: FaIcon(icon, size: 27),
    );
  }
}
