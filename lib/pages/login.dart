import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailTouched = false;
  bool _passwordTouched = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 236, 242),
      body: Column(
        children: [
          SizedBox(height: 50),
          Image.asset('assets/logo1.png', height: 250, width: 250),
          SizedBox(height: 50),
          Container(
            width: double.maxFinite,
            height: 425,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      "Masuk ke akun Anda!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'E-Mail',
                        hintText: _emailTouched && _emailController.text.isEmpty
                            ? 'E-Mail tidak boleh kosong'
                            : null,
                        hintStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusColor: Color.fromARGB(255, 22, 73, 152),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0, fontSize: 0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      onTap: () {
                        setState(() {
                          _emailTouched = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 40,
                    width: 350,
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText:
                            _passwordTouched && _passwordController.text.isEmpty
                            ? 'Password tidak boleh kosong'
                            : null,
                        hintStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0, fontSize: 0),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      onTap: () {
                        setState(() {
                          _passwordTouched = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 40,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 22, 73, 152),
                        shadowColor: Color(
                          const Color.fromARGB(255, 0, 0, 0).value,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _emailTouched = true;
                          _passwordTouched = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    child: Text(
                      'Daftar sekarang',
                      style: TextStyle(
                        color: Color.fromARGB(255, 17, 116, 59),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Version Beta 0.0.1",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(77, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Color.fromARGB(255, 22, 73,152),