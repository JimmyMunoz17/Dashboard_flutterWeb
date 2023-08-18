import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dashboard_admin/providers/categories_provider.dart';

import '../../datatables/categories_datasource.dart';

import 'package:dashboard_admin/ui/modals/category_modal.dart';

import 'package:dashboard_admin/ui/widgets/buttons/custom_button.dart';
import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categorias;

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Categorias',
          style: CustomLabels.h1,
        ),
        const SizedBox(
          height: 10,
        ),
        PaginatedDataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Categoría')),
            DataColumn(label: Text('Creado por')),
            DataColumn(label: Text('Acciones')),
          ],
          source: CategoriesDataTS(categories, context),
          header: Text(
            'Lista de categorías',
            maxLines: 2,
            style: GoogleFonts.roboto(fontSize: 20),
          ),
          //Selección del usuario de la cantidad de elementos a ver, uso del statefulWidget para el estado con el rowsPerPage
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage = value ?? 10;
            });
          },
          //Establece cuantos elementos se pueden ver rowsPerPage: 20,
          rowsPerPage: _rowsPerPage,

          actions: [
            CustomButton.buttonOptIcon(
                text: const Text('Agregar'),
                iconImage: Icons.add,
                colorButton: Colors.black,
                bordeRadius: 20,
                onPressed: () {
                  showModalBottomSheet(
                      barrierColor: Colors.black.withOpacity(0.2),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => const CategoryModal(
                            category: null,
                          ));
                },
                sizeWidth: 150,
                sizeHeight: 20)
          ],
        )
      ],
    );
  }
}
