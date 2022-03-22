import 'package:flutter/material.dart';
import 'Models/Loans.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  late Future<Loans> _loans;

  @override
  void initState() {
    super.initState();
    _loans = Loans.fetchLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: FutureBuilder<Loans>(
        future: _loans,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data.response.results.length,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '${snapshot.data.response.results[index].id}',
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
