import 'package:bill_manager/views/Widgets/loan_widget.dart';
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
      backgroundColor: const Color(0x338ccdff),
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: FutureBuilder<Loans>(
        future: _loans,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          var item = snapshot.data.response.results;
          return ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return LoanWidget(
                company: item[index].company,
                amount: item[index].amount,
              );
            },
          );
        },
      ),
    );
  }
}
