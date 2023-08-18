import 'package:flutter/material.dart';

import 'package:dashboard_admin/providers/users_provider.dart';

import 'package:dashboard_admin/ui/widgets/labels/custom_labels.dart';

import 'package:dashboard_admin/datatables/users_datasource.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    //Envia los usuarios al User Data Source
    final usersDataSource = UserDataSource(usersProvider.users);

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
        PaginatedDataTable(
          //Valor boleano si asciende o desciende ordenar
          sortAscending: usersProvider.ascending,
          //Que columna esta ordenandose
          sortColumnIndex: usersProvider.sortColumnIndex,
          columns: [
            const DataColumn(label: Text('Avatar')),
            DataColumn(
              label: const Text('Nombre'),
              onSort: (columnIndex, _) {
                usersProvider.sortColumnIndex = columnIndex;
                //organiza la columna por el nombre
                usersProvider.sort<String>((user) => user.nombre);
              },
            ),
            DataColumn(
              label: const Text('Email'),
              onSort: (columnIndex, _) {
                usersProvider.sortColumnIndex = columnIndex;
                //organiza la columna por el email
                usersProvider.sort<String>((user) => user.correo);
              },
            ),
            const DataColumn(label: Text('UID')),
            const DataColumn(label: Text('Acciones')),
          ],
          source: usersDataSource,
          //Cambio de página
          // onPageChanged: (page) => print(page),
        )
      ],
    );
  }
}
