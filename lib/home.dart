import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right:20),
        backgroundColor: Colors.orange,
        title: const Text('Simples ERP'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(              
              child: Container(
                padding: const EdgeInsets.symmetric(
                horizontal: 14.0, // Left and right
                vertical: 7.0,   // Top and bottom
              ),
               color: Colors.white,
               child: const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white,
                      color: Colors.orange
                  ),
                ),
              )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // --- Hero Section ---
                  const SizedBox(height: 40),
                  const Text(
                    'Bem-vindo',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Simples ERP',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Seu negócio - Nosso trabalho',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Trazemos soluções inteligentes para melhorar seus negócios',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // --- Feature Cards (Responsive Grid) ---
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Responsive breakpoint: switch to grid on wider screens
                      if (constraints.maxWidth > 600) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: const [
                            _FeatureCard(
                              title: 'Tutoriais e Informações',
                              description: 'Aprenda como usar nossas ferramentas',
                              icon: Icons.school,
                            ),
                            _FeatureCard(
                              title: 'Blog Comércio e Economia',
                              description: 'Explore available framework Features.',
                              icon: Icons.article,
                            ),
                            _FeatureCard(
                              title: 'Construa seu Website',
                              description: 'Tecnologia para te fazer crescer.',
                              icon: Icons.web,
                            ),
                          ],
                        );
                      } else {
                        // Mobile: vertical list
                        return Column(
                          children: const [
                            _FeatureCard(
                              title: 'Tutoriais e Informações',
                              description: 'Aprenda como usar nossas ferramentas',
                              icon: Icons.school,
                            ),
                            SizedBox(height: 16),
                            _FeatureCard(
                              title: 'Blog Comércio e Economia',
                              description: 'Explore available framework Features.',
                              icon: Icons.article,
                            ),
                            SizedBox(height: 16),
                            _FeatureCard(
                              title: 'Construa seu Website',
                              description: 'Tecnologia para te fazer crescer.',
                              icon: Icons.web,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 60),

                  // --- Contact Section ---
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Contato',
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 1.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 2.0),
                                ),
                              ],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sugestões e dúvidas. Fale conosco.',
                          style: TextStyle(
                              fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 8),
                            Text('contato@simpleserp.com.br'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Reusable Feature Card Widget ---
class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: Colors.deepOrange),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}