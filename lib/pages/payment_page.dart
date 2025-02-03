import 'dart:math';

import 'package:credit_card_form/credit_card_form.dart' hide CardType;
import 'package:eat_it_here/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

import 'delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '**** **** **** ****';
  String expiryDate = 'mm/yy';
  String cardHolderName = 'Card Holder Name';
  String cvvCode = '***';
  CreditCardController controller = CreditCardController();

  @override
  void initState() {
    super.initState();
    controller.setValue(CreditCardValue(
      cardNumber: cardNumber,
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
    ));
  }

  void onTapPay() {
    //payment logic

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Confirm Payment'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Card Number: $cardNumber'),
                    Text('Expiry Date: $expiryDate'),
                    Text('Card Holder Name: $cardHolderName'),
                    Text('CVV Code: $cvvCode'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DeliveryProgressPage()));
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //credit card display widget
            CreditCardUi(
              cardHolderFullName: cardHolderName,
              cardNumber: cardNumber,
              validThru: expiryDate,
              showValidFrom: false,
              doesSupportNfc: false,
              cvvNumber: cvvCode,
              enableFlipping: true,
              cardType: CardType.other,
              topLeftColor: Colors.blue,
            ),

            const SizedBox(height: 30),
            // credit card form

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CreditCardForm(
                controller: controller,
                onChanged: (CreditCardResult result) {
                  setState(() {
                    cardNumber = result.cardNumber;
                    expiryDate =
                        '${result.expirationMonth}/${result.expirationYear}';
                    cardHolderName = result.cardHolderName;
                    cvvCode = result.cvc;
                  });
                },
              ),
            ),

            const Spacer(),
            MyButton(onTap: onTapPay, title: 'Pay Now'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
