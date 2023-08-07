import 'package:dashboard_admin/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dashboard_admin/router/router.dart';
import 'package:dashboard_admin/providers/login_form_provider.dart';

import '../widgets/Inputs/custom_inputs.dart';
import '../widgets/buttons/custom_button.dart';
import '../widgets/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //instancia del provider
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    //Se crea el provider en login ya que solo se usa en esta view
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
              // se da el acceso al provider a todo el formulario
              key: loginFormProvider.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.white.withOpacity(0.4),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Sign in',
                                  style: GoogleFonts.montserratAlternates(
                                      fontSize: 25),
                                ),
                                const SizedBox(
                                  width: 180,
                                ),
                                LinkText(
                                  text: "Sign up",
                                  icon: Icons.add,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Flurorouter.registerRoute);
                                  },
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromRGBO(105, 180, 255, 1),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onFieldSubmitted: (_) =>
                                onFormSubmit(loginFormProvider, authProvider),
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? '')) {
                                return 'Email no válido';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            //Obtiene el valor del input
                            onChanged: (value) =>
                                loginFormProvider.emailLogin = value,
                            style: const TextStyle(color: Colors.black),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo',
                                label: 'Email',
                                icon: Icons.email_outlined),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onFieldSubmitted: (_) =>
                                onFormSubmit(loginFormProvider, authProvider),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su contraseña';
                              }
                              if (value.length < 6) {
                                return 'La contraseña debe tener 6 caracteres';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            //Obtiene el valor del input
                            onChanged: (value) =>
                                loginFormProvider.passwordLogin = value,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: '*******',
                                label: 'Password',
                                icon: Icons.lock_outline),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const FittedBox(
                              fit: BoxFit.contain,
                              child: LinkText(text: 'Forgot password?')),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton.buttonOpt(
                              text: Text(
                                'SIGN IN',
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white),
                              ),
                              colorButton: const Color.fromRGBO(0, 133, 255, 1),
                              bordeRadius: 10,
                              onPressed: () =>
                                  onFormSubmit(loginFormProvider, authProvider))
                        ],
                      ),
                    ),
                  ))),
        );
      }),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    bool isValid = loginFormProvider.validatorLogin();
    if (isValid) {
      authProvider.login(
          loginFormProvider.emailLogin, loginFormProvider.passwordLogin);
    }
  }
}
