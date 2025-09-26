import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("/contacts"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _contactInfo(context)),
                          const SizedBox(width: 40),
                          Expanded(child: _contactForm(context)),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            _contactInfo(context),
                            const SizedBox(height: 30),
                            _contactForm(context),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }

  // Left side (info + socials)
  Widget _contactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#contacts",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Let’s Connect 🤝",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00D9FF), // bright cyan accent
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "I’m open to freelance opportunities. If you have another request or just want to say hi, don’t hesitate to reach out.",
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white70),
        ),
        const SizedBox(height: 24),
        const Text("📧 Email: larz.stack@gmail.com",
            style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 8),
        const Text("💼 LinkedIn: linkedin.com/in/Lawrence",
            style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 8),
        const Text("💻 GitHub: github.com/Larz-debug",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ],
    );
  }

  // Right side (form)
  Widget _contactForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF262A39),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Send me a message ✍️",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor)),
            const SizedBox(height: 20),

            // Name
            TextFormField(
              controller: nameController,
              decoration: _inputDecoration("Name"),
              validator: (value) =>
                  value!.isEmpty ? "Please enter your name" : null,
            ),
            const SizedBox(height: 15),

            // Email
            TextFormField(
              controller: emailController,
              decoration: _inputDecoration("Email"),
              validator: (value) =>
                  value!.isEmpty ? "Please enter your email" : null,
            ),
            const SizedBox(height: 15),

            // Message
            TextFormField(
              controller: messageController,
              maxLines: 4,
              decoration: _inputDecoration("Message"),
              validator: (value) =>
                  value!.isEmpty ? "Please enter a message" : null,
            ),
            const SizedBox(height: 20),

            // Send button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Message sent! (demo only)")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D9FF),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF00D9FF), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: const Color(0xFF1E1E2E),
    );
  }
}
