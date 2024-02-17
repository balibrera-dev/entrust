import 'package:entrust/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = "/auth-screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  bool _islogin = true;
  var _enteredUser = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _passwordView = false;

  void _signInUser() {
    AuthService().signInUser(
      context: context,
      email: _enteredEmail,
      password: _enteredPassword,
    );
  }

  void _signUpUser() {
    AuthService().signUpUser(
      context: context,
      email: _enteredEmail,
      password: _enteredPassword,
      username: _enteredUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/entrust-logo-text.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _form,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _islogin
                                ? const SizedBox()
                                : TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Usuario',
                                        prefixIcon: Icon(Icons.person)),
                                    autocorrect: false,
                                    textCapitalization: TextCapitalization.none,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value.length < 3) {
                                        return 'El usuario debe conterner al menos 3 caracteres';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      _enteredUser = newValue!;
                                    },
                                  ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Correo electronico',
                                  prefixIcon: Icon(Icons.email)),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Ingresa un email válido';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredEmail = newValue!;
                              },
                            ),
                            TextFormField(
                              obscureText: _passwordView ? false : true,
                              decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordView = !_passwordView;
                                        });
                                      },
                                      icon: Icon(_passwordView
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'El password debe de ser al menos de 6 digitos.';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredPassword = newValue!;
                              },
                            ),
                            // _islogin
                            //     ? const SizedBox()
                            //     : TextFormField(
                            //         obscureText: true,
                            //         decoration: const InputDecoration(
                            //           labelText: 'Repetir contraseña',
                            //         ),
                            //       ),
                            const SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final isValid = _form.currentState!.validate();
                                if (isValid) {
                                  _form.currentState!.save();
                                  _islogin ? _signInUser() : _signUpUser();
                                }
                              },
                              child: Text(_islogin ? 'Entrar' : 'Registrarse'),
                            ),
                            TextButton(
                              onPressed: () {
                                _form.currentState!.reset();

                                setState(() {
                                  _islogin = !_islogin;
                                });
                              },
                              child: Text(_islogin
                                  ? 'Crear una cuenta'
                                  : 'Ya tengo una cuenta, entrar'),
                            ),
                          ],
                        )),
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
