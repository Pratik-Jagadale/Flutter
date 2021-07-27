import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactionHandler;

  NewTransaction(this.addNewTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) < 0) {
      return;
    }

    widget.addNewTransactionHandler(
      //because of widget. property we can use member funcitons of connected widget class
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _pressDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 400,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (value) {
              // titleInput = value;
              //},
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //   onChanged: (value) {
              //     amountInput = value;
              //   },
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) =>
                  submitData(), //there have argumenet but dont need
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Choosen :'
                        : 'Picked date -' +
                            DateFormat.yMd().format(_selectedDate)),
                  ),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: _pressDatePicker,
                  )
                ],
              ),
            ),
            ElevatedButton(
              //style: BoxShadow.lerp(a, b, t),
              onPressed: submitData,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
