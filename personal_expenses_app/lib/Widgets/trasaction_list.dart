import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function _deleteTransaction;

  TrasactionList(this.transaction, this._deleteTransaction);

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      width: double.infinity,
      height: 450,
      color: Colors.black12,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transaction Added yet !!!'),
                SizedBox(height: 30),
                Container(
                  height: 200,
                  child: Image.asset(
                    'image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView(
              children: transaction.map((tx) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '₹' + tx.amount.toStringAsFixed(2),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tx.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(buildContext).errorColor,
                      onPressed: () {
                        _deleteTransaction(tx.id);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
