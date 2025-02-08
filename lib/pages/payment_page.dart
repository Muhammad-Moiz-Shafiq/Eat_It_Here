import 'package:credit_card_form/credit_card_form.dart' hide CardType;
import 'package:eat_it_here/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../themes/light_mode.dart';
import '../themes/theme_provider.dart';
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

  bool validityCheck(String expiryDate) {
    final List<String> expiryDateList = expiryDate.split('/');
    final int month = int.parse(expiryDateList[0]);
    final int year = int.parse(expiryDateList[1]);
    final DateTime now = DateTime.now();
    final int cardYear = now.year % 100;
    if (year < cardYear ||
        !(month <= 12 && month > 0)||
        (year == cardYear && month < now.month)) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text(
                    'Sorry, your card is invalid. Kindly use a valid card.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ));
      return false;
    }
    return true;
  }

  void onTapPay() {
    //payment logic
    // checking if user has filled the form or not
    if (cardNumber == '**** **** **** ****' ||
        expiryDate == 'mm/yy' ||
        cardHolderName == 'Card Holder Name' ||
        cvvCode == '***') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Please fill the form correctly.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ));
      return;
    } //checking if expiryDate is less than present date
    else if (!validityCheck(expiryDate)) {
      return;
    }

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
      resizeToAvoidBottomInset: false,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: CreditCardUi(
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
            ),

            const SizedBox(height: 30),
            // credit card form

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CreditCardForm(
                theme:
                    Provider.of<ThemeProvider>(context).themeData == lightMode
                        ? CreditCardLightTheme()
                        : CreditCardDarkTheme(),
                controller: controller,
                onChanged: (CreditCardResult result) {
                  setState(() {
                    cardNumber = result.cardNumber.isEmpty
                        ? '**** **** **** ****'
                        : result.cardNumber;
                    expiryDate = result.expirationMonth.isEmpty &&
                            result.expirationYear.isEmpty
                        ? 'mm/yy'
                        : '${result.expirationMonth}/${result.expirationYear}';
                    cardHolderName = result.cardHolderName.isEmpty
                        ? 'Card Holder Name'
                        : result.cardHolderName;
                    cvvCode = result.cvc.isEmpty ? '***' : result.cvc;
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
