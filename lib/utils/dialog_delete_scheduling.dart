import 'package:flutter/material.dart';
import 'package:scheduling_app/data/scheduling_service.dart';

void dialogDeleteScheduling(BuildContext context, String schedulingId) =>
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja realmente excluir o agendamento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
              SchedulingService().deleteScheduling(schedulingId);
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
