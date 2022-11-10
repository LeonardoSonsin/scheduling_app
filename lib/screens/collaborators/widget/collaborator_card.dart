import 'package:flutter/material.dart';

import '../../month_table/month_table_screen.dart';

class CollaboratorCard extends StatelessWidget {
  const CollaboratorCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.id,
      required this.storeId,
      required this.store,
      required this.collaborator,
      required this.service})
      : super(key: key);

  final String id;
  final String image;
  final String name;
  final String storeId;

  final String store;
  final String collaborator;
  final String service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MonthTableScreen(
                  collaboratorId: id,
                  storeId: storeId,
                  store: store,
                  collaborator: collaborator,
                  service: service,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
