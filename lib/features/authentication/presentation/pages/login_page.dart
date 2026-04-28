import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/authentication/presentation/state/auth_provider.dart';
import 'package:pos_app/app/providers.dart';

class LoginPage extends ConsumerStatefulWidget{
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>{
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: "admin@demo.local");
  final _passwordController = TextEditingController(text: "12345678");
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit(){
    if(_formKey.currentState!.validate()){
      ref.read(authProvider.notifier).login(
        _emailController.text.trim(), 
        _passwordController.text.trim(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
   final authState = ref.watch(authProvider);

   ref.listen<AuthState>(authProvider, (previous, next) {
    if(next.status == AuthStatus.error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(next.errorMessage ?? "Erreur")),
      );
    }
   });
   return Scaffold(
    body: SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            elevation: 4,
            child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Connexion",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox( height: 24),
                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Champ Obligatoir": null,
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: authState.status == AuthStatus.loading ? null : _submit,
                      child: authState.status == AuthStatus.loading ? 
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ) : const Text("Se connecter"),
                    ),
                  )
                ],
              ),            
              ),
          ),
        ),
      ),
    ),
    ),
   );
  }
}