import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:email_validator/email_validator.dart';

import '../../providers/providers.dart';

import 'package:dashboard_admin/models/usuario.dart';

import 'package:dashboard_admin/services/notifications_service.dart';
import 'package:dashboard_admin/services/navigation_service.dart';

import '../widgets/cards/white_card.dart';
import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';
import 'package:dashboard_admin/ui/widgets/Inputs/custom_inputs.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    //Envio de id para validar en BD
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    //Obtener datos para actulizar
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
      setState(() {
        if (userDB != null) {
          userFormProvider.user = userDB;
          userFormProvider.formkey = GlobalKey<FormState>();
          setState(() {
            user = userDB;
          });
        } else {
          NavigationService.replaceTo('/dashboard/users');
        }
      });
    });
  }

  //limpiar la información
  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user == null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'User view',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        if (user == null)
          WhiteCard(
              child: Container(
            alignment: Alignment.center,
            height: 300,
            child: const CircularProgressIndicator(),
          )),
        if (user != null) const _UserViewBody()
      ],
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody();

  @override
  Widget build(BuildContext context) {
    return Table(
      //colocar tamaño de las columnas y depende de su posición colocar el tamaño
      columnWidths: const {0: FixedColumnWidth(250)},
      //Todo ancho columna
      children: const [
        TableRow(children: [
          //Avatar
          _AvatarContainer(),
          //Body formulario actulización
          _UserViewForm(),
        ])
      ],
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm();

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información general',
        child: Form(
            key: userFormProvider.formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: user.nombre,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'Nombre del usuario',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su nombre';
                    }
                    if (value.length < 2) {
                      return 'El nombre debe tener mas de dos letras';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(nombre: value),
                  // onChanged: (value) => user.nombre = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: user.correo,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'Correo del usuario',
                      label: 'Correo',
                      icon: Icons.mark_email_read_outlined),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return 'Correo no válido';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(correo: value),
                  // onChanged: (value) => user.correo = value
                ),
                const SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: ElevatedButton(
                      onPressed: () async {
                        // actulizar PUT
                        final saved = await userFormProvider.updateUser();
                        if (saved) {
                          NotificationsService.showSnackbarOk(
                              'Usuario actulizado');
                          // ignore: use_build_context_synchronously
                          Provider.of<UsersProvider>(context, listen: false)
                              .refreshUser(user);
                        } else {
                          NotificationsService.showSnackbarError(
                              'No se pudo guardar');
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(0, 133, 255, 1)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.save_outlined,
                            size: 20,
                          ),
                          Text('  Guardar')
                        ],
                      )),
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer();

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    final image = (user.img == null)
        ? const Image(image: AssetImage('/img/no-image.jpg'))
        : FadeInImage.assetNetwork(
            placeholder: '/gif/loader.gif', image: user.img!);

    return WhiteCard(
        width: 250,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 160,
                child: Stack(children: [
                  ClipOval(
                      //Mustra la imagen de perfil
                      child: image),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 5)),
                      child: FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(0, 133, 255, 1),
                        elevation: 0,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                        onPressed: () async {
                          //Subida de imagen para el user
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  //archivos permitidos
                                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  allowMultiple: false);

                          if (result != null && context.mounted) {
                            NotificationsService.showBusyIndicator(context);
                            PlatformFile file = result.files.first;
                            final newUser = await userFormProvider.uploadImage(
                                '/uploads/usuarios/${user.uid}', file.bytes!);
                            if (context.mounted) {
                              Provider.of<UsersProvider>(context, listen: false)
                                  .refreshUser(newUser);
                              Navigator.of(context).pop();
                            }
                          } else {
                            // User canceled the picker
                            // print('no hay imagen');
                          }
                        },
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              Text(
                user.nombre,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
