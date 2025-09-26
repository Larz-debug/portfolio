import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("/projects"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: isDesktop ? 3 : 1,
              padding: const EdgeInsets.all(24),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              children: const [
                SingleChildScrollView(
                  child: ProjectCard(
                    imagePath: "assets/project_1.jpg",
                    title: "Sudoku Puzzle",
                    description:
                        "Test your logic with this sleek Sudoku puzzle.",
                    githubUrl: "https://github.com/Larz-debug/sudoku_puzzle",
                  ),
                ),
                SingleChildScrollView(
                  child: ProjectCard(
                    imagePath: "assets/project_2.jpg",
                    title: "TODO App",
                    description:
                        "Elegant to-do list app to manage tasks and boost productivity.",
                    githubUrl: "https://github.com/Larz-debug/todo_app",
                  ),
                ),
                SingleChildScrollView(
                  child: ProjectCard(
                    imagePath: "assets/cal_logo.png",
                    title: "CalApp",
                    description:
                        "A sleek and responsive calculator app built with Flutter.",
                    githubUrl: "https://github.com/Larz-debug/calculator",
                  ),
                ),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String? githubUrl;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.githubUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.03))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: accent.withOpacity(0.4),
                    blurRadius: 18,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        ),
        child: Card(
          color: const Color(0xFF1E1E2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.white24, width: 1),
          ),
          elevation: _isHovered ? 10 : 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: accent,
                        )),
                    const SizedBox(height: 8),
                    Text(widget.description,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 14),
                    if (widget.githubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(widget.githubUrl!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text("GitHub"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: accent,
                          side: BorderSide(color: accent),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
