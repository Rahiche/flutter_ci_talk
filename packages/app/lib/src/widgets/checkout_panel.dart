import 'package:flutter/material.dart';

/// Exercises `no_raw_text` from package:ci_lints.
///
/// Every string below is either a lint hit or a deliberate near-miss, so
/// `dart run custom_lint` on this file is the rule's regression test.
class CheckoutPanel extends StatelessWidget {
  const CheckoutPanel({super.key, required this.total, required this.currency});

  final double total;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LINT: displayed text.
        const Text('Order summary'),

        // LINT: interpolation is raw text too, and it bakes in word order.
        Text('Total: $total $currency'),

        // OK: no letters to translate.
        const Text(' - '),

        // OK: already localized.
        Text(MaterialLocalizations.of(context).okButtonLabel),

        const TextField(
          decoration: InputDecoration(
            // LINT: named parameter on a widget.
            hintText: 'Discount code',
            // OK: a currency symbol is not a sentence.
            prefixText: r'$',
          ),
        ),

        IconButton(
          // LINT: screen readers read this out loud.
          tooltip: 'Remove item',
          icon: const Icon(Icons.delete),
          onPressed: () => debugPrint('remove tapped'), // OK: a log line.
        ),

        // OK: an asset path is not user-facing text.
        Image.asset('assets/images/empty_cart.png'),

        // OK: not a widget, so the rule stays out of it.
        Semantics(
          identifier: 'checkout_total',
          child: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
