import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: const Color(0xFF161B22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink(context, "Home", "/"),
              const SizedBox(width: 20),
              _footerLink(context, "About", "/about"),
              const SizedBox(width: 20),
              _footerLink(context, "Projects", "/projects"),
              const SizedBox(width: 20),
              _footerLink(context, "Contact", "/contact"),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "© 2025 Lawrence. All rights reserved.",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(BuildContext context, String title, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

