// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/models/items_model.dart';

class CartItemDesignWidget extends StatefulWidget {
  const CartItemDesignWidget({
    Key? key,
    required this.model,
    required this.quantity,
    required this.context,
  }) : super(key: key);
  final ItemsModel model;
  final int quantity;
  final BuildContext context;
  @override
  State<CartItemDesignWidget> createState() => _CartItemDesignWidgetState();
}

class _CartItemDesignWidgetState extends State<CartItemDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          height: 125,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Image.network(
                widget.model.thumbnailUrl,
                width: 140,
                height: 120,
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'KiwiMaru'),
                  ),
                  Row(
                    children: [
                      const Text(
                        'x',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Acme'),
                      ),
                      Text(
                        widget.quantity.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Acme'),
                      ),
                    ],
                  ),
                  // price
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Acme'),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        '\$',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Acme'),
                      ),
                      Text(
                        widget.model.price.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Acme'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
