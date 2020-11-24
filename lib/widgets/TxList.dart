import 'package:flutter/material.dart';
import 'package:how_much_you_spent_app/models/Transaction.dart';
import 'package:intl/intl.dart';

class TxList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TxList(this.transactions, this.deleteTx); // called from TxHistoryManager

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset(
                    'assets/images/3298067.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Oops, history not found!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  // card
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor, // this color will change later dynamically
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                transactions[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                transactions[index].desc,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                DateFormat().format(transactions[index].time),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
