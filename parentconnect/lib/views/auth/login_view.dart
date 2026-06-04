import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController _authController = AuthController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  // 🚀 LOGIN FUNCTION
  Future<void> handleLogin() async {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    setState(() {
      errorMessage = "Veuillez remplir tous les champs";
    });
    return;
  }

  setState(() {
    isLoading = true;
    errorMessage = null;
  });

  final role = await _authController.login(email, password);

  setState(() {
    isLoading = false;
  });

  if (role == null) {
    setState(() {
      errorMessage = "Email ou mot de passe incorrect";
    });
    return;
  }

  if (!mounted) return;

  // redirection
  if (role == "admin") {
    Navigator.pushReplacementNamed(context, '/admin');
  } else if (role == "teacher") {
    Navigator.pushReplacementNamed(context, '/teacher');
  } else if (role == "parent") {
    Navigator.pushReplacementNamed(context, '/parent');
  } else if (role == "student") {
    Navigator.pushReplacementNamed(context, '/student');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // 🏫 TITLE
                const Text(
                  "ParentConnect",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                // 📧 EMAIL
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                // 🔒 PASSWORD
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // ❌ ERROR
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 10),

                // 🔄 LOADING
                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          child: const Text("Se connecter"),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


