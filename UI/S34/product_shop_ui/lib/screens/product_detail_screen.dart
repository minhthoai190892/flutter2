import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1700984292461-fa2d83c28c6b?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                        radius: 24,
                        child: const Icon(Icons.arrow_back_ios_new),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                        child: const Icon(Icons.bookmark_border),
                      ),
                      const Gap(16),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                        child: const Icon(Icons.upload),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '1/4',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Design house',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.purpleAccent,
                              ),
                              Text('4.9'),
                              Gap(4),
                              Text('(127)')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chat_bubble_outline)),
                    )
                  ],
                ),
                const Gap(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lamp',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Posted 1 hr ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.refresh),
                          Text('Buy Online'),
                        ],
                      ),
                    ),
                    const Gap(4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.indigo[50],
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.flash_on),
                          Text('Best Product'),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis suscipit minima reprehenderit architecto perferendis mollitia adipisci obcaecati, asperiores fugit dicta, sunt soluta ullam quia laboriosam enim quam nostrum quisquam esse illum vel tenetur harum quis! Perspiciatis et placeat, accusantium nihil impedit repellat dolores itaque cupiditate quam eaque molestias omnis. Animi odit repellendus obcaecati cum distinctio aut temporibus tempora, alias, ut aspernatur modi fugit itaque quam ab illo libero magnam. Voluptatum, delectus, recusandae, cupiditate ducimus eos ipsum quod officia aperiam quibusdam magnam obcaecati sapiente quidem sit ratione non soluta quia voluptatem saepe laboriosam ipsa explicabo odit provident veritatis! Neque, nihil similique.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Gap(8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Exchange',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
