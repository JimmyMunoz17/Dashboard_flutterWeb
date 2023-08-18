import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/categories_provider.dart';

import 'package:dashboard_admin/models/category.dart';

import 'package:dashboard_admin/services/notifications_service.dart';

import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';
import 'package:dashboard_admin/ui/widgets/Inputs/custom_inputs.dart';
import 'package:dashboard_admin/ui/widgets/buttons/custom_button.dart';

class CategoryModal extends StatefulWidget {
  final Category? category;
  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.category?.id;
    nombre = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: builBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category?.nombre ?? 'Nueva categoría',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.category?.nombre ?? " ",
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la categoría',
                label: 'Categoría',
                icon: Icons.new_releases_outlined),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomButton.buttonOpt(
                text: const Text('Guardar'),
                colorButton: Colors.black,
                bordeRadius: 20,
                sizeWidth: 120,
                sizeHeight: 50,
                onPressed: () async {
                  try {
                    if (id == null) {
                      //Crear
                      await categoriesProvider.newCategory(nombre);
                      NotificationsService.showSnackbarOk(
                          'Nueva categoría $nombre creada!');
                    } else {
                      //actualizar
                      await categoriesProvider.updateCategory(id!, nombre);
                      NotificationsService.showSnackbarOk(
                          'Categoría $nombre actulizado!');
                    }
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  } catch (e) {
                    Navigator.of(context).pop();
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar la categoría');
                  }
                }),
          )
        ],
      ),
    );
  }

  BoxDecoration builBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color.fromRGBO(45, 45, 45, 1),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
