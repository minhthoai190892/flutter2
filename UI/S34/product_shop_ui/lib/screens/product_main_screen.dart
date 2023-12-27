import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_shop_ui/screens/product_detail_screen.dart';

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
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search product',
                            hintStyle: TextStyle(),
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.percent)),
                  ),
                  const Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailScreen(),
                              ));
                        },
                        icon: const Icon(Icons.wallet)),
                  ),
                ],
              ),
              const Gap(16),
              SizedBox(
                height: 180,
                // decoration: const BoxDecoration(color: Colors.blue),
                child: Stack(
                  children: [
                    Positioned(
                      top: 24,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Lorem ipsum .',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const Text(
                              'Lorem ipsum dolor ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Text('Buy now'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 24,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.pink),
                        width: 140,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(onPressed: () {}, child: const Text('See all'))
                ],
              ),
              const Row(
                children: [
                  IconWidget(),
                  Gap(12),
                  IconWidget(),
                  Gap(12),
                  IconWidget(),
                  Gap(12),
                  IconWidget(),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  const Text(
                    'Exclusive',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text('22:22:22'),
                  )
                ],
              ),
              const Gap(16),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  children: List.generate(5, (index) => const ProductCard()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductDetailScreen(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1700984292461-fa2d83c28c6b?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                radius: 16,
              ),
            ),
            const Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                children: [
                  Text(
                    'Data',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'data',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.light),
          ),
          const Gap(8),
          const Text('Lamp')
        ],
      ),
    );
  }
}
