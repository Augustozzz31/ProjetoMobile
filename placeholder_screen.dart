import 'package:flutter/material.dart';

class PlaceholderScreen extends StatefulWidget {
  const PlaceholderScreen({super.key});

  @override
  State<PlaceholderScreen> createState() => _PlaceholderScreenState();
}

class _PlaceholderScreenState extends State<PlaceholderScreen> {
  int _testCounter = 0;

  void _onTestButtonPressed() {
    setState(() {
      _testCounter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cookie clicado! Total: $_testCounter'),
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFF3949AB),
      ),
    );
  }

  void _onInfoButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sobre a tela'),
        content: const Text(
          'Esta é uma tela de testes Flutter com contador, '
              'menu lateral e botões interativos.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3949AB);
    const backgroundColor = Color(0xFFF3F0FF);
    const accentColor = Color(0xFF7E57C2);

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: const Text('Minha Tela de Testes'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, accentColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Menu Teste 404',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explore as opções',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: primaryColor),
              title: const Text('Início'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: primaryColor),
              title: const Text('Configurações'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: primaryColor),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                _onInfoButtonPressed();
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.science,
                size: 64,
                color: accentColor,
              ),
              const SizedBox(height: 16),

              Text(
                'Área de testes',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Test button tapped: $_testCounter time(s)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 28),

              ElevatedButton.icon(
                onPressed: _onTestButtonPressed,
                icon: const Icon(Icons.cookie),
                label: const Text('Cookie Clicker'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              OutlinedButton.icon(
                onPressed: _onInfoButtonPressed,
                icon: const Icon(Icons.info_outline),
                label: const Text('Informações'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: accentColor,
                  side: const BorderSide(color: accentColor),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}