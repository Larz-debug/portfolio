import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("/about-me"),
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
                          // Profile picture
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "assets/profile_pics.jpg",
                              height: 240,
                              width: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 40),

                          // About content
                          Expanded(child: _aboutContent(context)),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/profile_pics.jpg",
                                height: 180,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _aboutContent(context),
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

  Widget _aboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#about-me",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Hi, I'm Lawrence 👋",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00D9FF), // cyan accent
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Flutter Developer | UI/UX Enthusiast",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "I am passionate about building beautiful and responsive apps with Flutter. "
          "I enjoy working on creative projects, exploring animations, and making "
          "interfaces that feel smooth and intuitive.",
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white70),
        ),
        const SizedBox(height: 40),

        // Skills
        Text(
          "#skills",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        const SkillBar(skill: "Flutter", level: 0.9),
        const SkillBar(skill: "Dart", level: 0.85),
        const SkillBar(skill: "Firebase", level: 0.75),
        const SkillBar(skill: "UI/UX Design", level: 0.8),
      ],
    );
  }
}

// Skill bar widget
class SkillBar extends StatelessWidget {
  final String skill;
  final double level;

  const SkillBar({super.key, required this.skill, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: LinearProgressIndicator(
              value: level,
              minHeight: 10,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF00D9FF), // cyan accent
              ),
            ),
          ),
        ],
      ),
    );
  }
}


