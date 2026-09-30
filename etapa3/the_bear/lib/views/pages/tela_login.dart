import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bear/viewModels/login_viewmodel.dart';
import 'package:the_bear/views/pages/tela_cadastro.dart';
import 'package:the_bear/views/pages/pedidos_page.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<void> entrar() async {
     final viewModel = context.read<LoginViewModel>();

  final usuario = await viewModel.entrar(
    emailController.text.trim(),
    senhaController.text.trim(),
  );

  if (!mounted) return;

  if (usuario != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const PedidosPage(),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (viewModel.erro != null)
              Text(
                viewModel.erro!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: viewModel.carregando ? null : entrar,
                child: viewModel.carregando
                    ? const CircularProgressIndicator()
                    : const Text('Entrar'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CadastroPage(),
                  ),
                );
              },
              child: const Text(
                'Não possui conta? Cadastre-se',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
