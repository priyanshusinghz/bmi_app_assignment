import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatelessWidget {
  final List<Map<String, String>> historyData;
  final void Function(int index) onEdit;

  const HistoryList({
    Key? key,
    required this.historyData,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Weight: ${historyData[index]['weight']}'),
            subtitle: Text(
              'Date: ${_formatDate(historyData[index]['date']!)}',
            ),
            onTap: () {
              onEdit(index);
            },
          );
        },
      ),
    );
  }

  String _formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    return DateFormat('MMMM dd, yyyy').format(date);
  }
}
