import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/auth_provider.dart';
import 'package:dashboard_admin/providers/register_form_provider.dart';

import 'package:dashboard_admin/router/router.dart';

import '../widgets/Inputs/custom_inputs.dart';
import '../widgets/buttons/custom_button.dart';
import '../widgets/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerformProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
                //control del formulario en el provider
                key: registerformProvider.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Sign up',
                                    style: GoogleFonts.montserratAlternates(
                                        fontSize: 25),
                                  ),
                                  const SizedBox(
                                    width: 180,
                                  ),
                                  LinkText(
                                    text: "Back",
                                    icon: Icons.arrow_back_ios_new_outlined,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, Flurorouter.loginRoute);
                                    },
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese su nombre';
                                }
                                if (value.length < 2) {
                                  return 'El nombre debe tener mas de dos letras';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              //Obtiene el valor del input
                              onChanged: (value) =>
                                  registerformProvider.nameRegister = value,
                              style: const TextStyle(color: Colors.black),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su nombre',
                                  label: 'Name',
                                  icon: Icons.supervised_user_circle_rounded),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (!EmailValidator.validate(value ?? '')) {
                                  return 'Email no válido';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              //Obtiene el valor del input
                              onChanged: (value) =>
                                  registerformProvider.emailRegister = value,
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
                                  registerformProvider.passwordRegister = value,
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su contraseña',
                                  label: 'Password',
                                  icon: Icons.lock_outline),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese su contraseña';
                                }
                                if (value !=
                                    registerformProvider.passwordRegister) {
                                  return 'La contraseña de verificación no coincide';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              //Obtiene el valor del input
                              // onChanged: (value) => loginFormProvider.password = value,
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Confirmar contraseña',
                                  label: 'Confirm Password',
                                  icon: Icons.lock_outline),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButton.buttonOpt(
                                text: Text(
                                  'SING UP',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.white),
                                ),
                                colorButton:
                                    const Color.fromRGBO(0, 133, 255, 1),
                                bordeRadius: 10,
                                onPressed: () {
                                  final validForm =
                                      registerformProvider.validatorRegistro();
                                  if (!validForm) return;
                                  final authProvider =
                                      Provider.of<AuthProvider>(context,
                                          listen: false);
                                  authProvider.register(
                                      registerformProvider.emailRegister,
                                      registerformProvider.passwordRegister,
                                      registerformProvider.nameRegister);
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ))),
          ),
        );
      }),
    );
  }
}
