import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.percent)),
                  ),
                  Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.wallet)),
                  ),
                ],
              ),
              Gap(16),
              Container(
                height: 180,
                decoration: BoxDecoration(color: Colors.blue),
                child: Placeholder(),
              ),
              Gap(16),
              Row(
                children: [
                  Text('Category'),
                  TextButton(onPressed: () {}, child: Text('See all'))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.blueAccent),
                          child: Icon(Icons.light),
                        ),
                        Text('Lamp')
                      ],
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.blueAccent),
                          child: Icon(Icons.light),
                        ),
                        Text('Lamp')
                      ],
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.blueAccent),
                          child: Icon(Icons.light),
                        ),
                        Text('Lamp')
                      ],
                    ),
                  ),
                ],
              ),
              Gap(16),
              Row(
                children: [
                  Text('Exclusive'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('22:22:22'),
                  )
                ],
              ),
              Gap(16),

              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  children: [
                    Container(color: Colors.blue,),
                    Container(color: Colors.blue,),
                    Container(color: Colors.blue,),
                    Container(color: Colors.blue,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
