// history.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zignuts_assignment/screens/home/chart.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, String>> historyData = [
    {'weight': '150', 'date': '2024-01-01'},
    {'weight': '155', 'date': '2024-01-05'},
    {'weight': '160', 'date': '2024-01-10'},
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Column(
        children: [
          // Your existing ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Weight: ${historyData[index]['weight']}'),
                  subtitle: Text('Date: ${historyData[index]['date']}'),
                  onTap: () {
                    _editEntry(index);
                  },
                );
              },
            ),
          ),
          // BarGraphWidget added below the ListView.builder
          BarGraphWidget(
            historyData: historyData,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEntry();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editEntry(int index) {
    String? updatedWeight = historyData[index]['weight'];
    DateTime updatedDate = DateTime.parse(historyData[index]['date']!);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Weight'),
                onChanged: (value) {
                  updatedWeight = value;
                },
              ),
              const SizedBox(height: 10),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Date: ${DateFormat.yMd().format(updatedDate)}',
                  ),
                  trailing: const Icon(Icons.date_range),
                ),
                onTap: () => _selectDate(context, updatedDate),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement saving the edited data
                // Update the historyData list and close the dialog
                Navigator.pop(context);
                setState(() {
                  historyData[index]['weight'] = updatedWeight!;
                  historyData[index]['date'] =
                      DateFormat('yyyy-MM-dd').format(updatedDate);
                });
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addEntry() {
    String newWeight = '';
    DateTime newDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Weight'),
                onChanged: (value) {
                  newWeight = value;
                },
              ),
              const SizedBox(height: 10),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Date: ${DateFormat.yMd().format(newDate)}',
                  ),
                  trailing: const Icon(Icons.date_range),
                ),
                onTap: () => _selectDate(context, newDate),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement saving the new entry data
                // Add a new entry to the historyData list and close the dialog
                Navigator.pop(context);
                setState(() {
                  historyData.add({
                    'weight': newWeight,
                    'date': DateFormat('yyyy-MM-dd').format(newDate),
                  });
                });
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime initialDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        initialDate = pickedDate;
      });
    }
  }
}
