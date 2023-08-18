import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/categories_provider.dart';

import 'package:dashboard_admin/models/category.dart';

import 'package:dashboard_admin/ui/modals/category_modal.dart';

class CategoriesDataTS extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDataTS(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final category = categories[index];

    //construcción de la fila
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.nombre)),
      DataCell(Text(category.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined,
                color: Color.fromRGBO(0, 111, 255, 1)),
            onPressed: () {
              showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.2),
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => CategoryModal(category: category));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: const Color.fromRGBO(0, 111, 255, 1).withOpacity(0.5),
            ),
            onPressed: () {
              final dialog = AlertDialog(
                title: const Text('¿Está seguro de borrarlo?'),
                content: Text('Borrar definitivamente ${category.nombre}'),
                actions: [
                  TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: const Text('Si, Borrar'),
                      onPressed: () async {
                        await Provider.of<CategoriesProvider>(context,
                                listen: false)
                            .deleteCategory(category.id);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      }),
                ],
              );

              showDialog(
                  barrierColor: Colors.black.withOpacity(0.2),
                  context: context,
                  builder: (_) => dialog);
            },
          ),
        ],
      ))
    ]);
  }

  @override

  //No se tiene la cantidad de columnas y se coloca un aproximado
  bool get isRowCountApproximate => false;

  @override

  //Cuantos elementos tiene la tabla
  int get rowCount => categories.length;

  @override

  //seleción de la fila
  int get selectedRowCount => 0;
}
