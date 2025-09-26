import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("/home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (isDesktop) ...[
            _navButton(context, "Home", "/"),
            _navButton(context, "Projects", "/projects"),
            _navButton(context, "About", "/about"),
            _navButton(context, "Contacts", "/contact"),
          ],
        ],
      ),
      drawer: !isDesktop
          ? Drawer(
              backgroundColor: const Color(0xFF161B22),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFFFF6F61)),
                    child: Text("Larz", style: TextStyle(color: Colors.white)),
                  ),
                  _drawerItem(context, "Home", "/"),
                  _drawerItem(context, "Projects", "/projects"),
                  _drawerItem(context, "About", "/about"),
                  _drawerItem(context, "Contacts", "/contact"),
                ],
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero section (intro text + image)
                  Flex(
                    direction: isDesktop ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text section
                      Expanded(
                        flex: isDesktop ? 1 : 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lawrence is a ",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "web designer ",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: const [
                                  TextSpan(
                                    text: "and ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: "front-end developer",
                                    style: TextStyle(color: Color(0xFFFF6F61)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "He crafts responsive websites where technologies\nmeet creativity",
                              style: TextStyle(fontSize: 18, color: Colors.white70),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/contact");
                              },
                              child: const Text("Contact me !!"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40, height: 40),

                      // Image section
                      Expanded(
                        flex: isDesktop ? 1 : 0,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/profile_pics.jpg",
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF161B22),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.white24, width: 1),
                              ),
                              child: const Text(
                                "I don't just write code; I build solutions.",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Quote section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22),
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 4,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "\"Simplicity is prerequisite for reliability.\"",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "- Edsger W. Dijkstra ",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Sections preview (Projects & About)
                  _sectionPreview(
                    context,
                    title: "#projects",
                    description: "Check out some of my featured works below.",
                    buttonText: "View Projects →",
                    route: "/projects",
                  ),
                  const SizedBox(height: 60),
                  _sectionPreview(
                    context,
                    title: "#about-me",
                    description:
                        "Learn more about my journey, skills, and what drives me.",
                    buttonText: "Read More →",
                    route: "/about",
                  ),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }

  Widget _sectionPreview(
    BuildContext context, {
    required String title,
    required String description,
    required String buttonText,
    required String route,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(description, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, route),
          child: Text(buttonText),
        ),
      ],
    );
  }

  Widget _navButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String text, String route) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}



