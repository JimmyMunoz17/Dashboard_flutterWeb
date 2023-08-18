import 'package:flutter/material.dart';

import '../models/usuario.dart';

import 'package:dashboard_admin/services/navigation_service.dart';

class UserDataSource extends DataTableSource {
  //Variable que obtiene los usuarios actualizados
  final List<Usuario> users;

  UserDataSource(this.users);

  @override
  DataRow? getRow(int index) {
    final Usuario user = users[index];
    final img = (user.img == null)
        ? const Image(
            image: AssetImage('/img/no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: '/gif/loader.gif',
            image: user.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: img,
      )),
      DataCell(Text(user.nombre)),
      DataCell(Text(user.correo)),
      DataCell(Text(user.uid)),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined,
                color: Color.fromRGBO(0, 111, 255, 1)),
            onPressed: () {
              // NUEVA PANTALLA /UID DEL USUARIO
              NavigationService.replaceTo('/dashboard/users/${user.uid}');
            },
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
