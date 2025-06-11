import 'package:demo_project/app/models/category_model.dart';
import 'package:demo_project/app/models/item_model.dart';
import 'package:demo_project/app/widgets/category_card_widget.dart';
import 'package:demo_project/app/widgets/product_item_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Todos';

  final List<Item> allItems = [
    Item(
      id: '1',
      title: 'Computador',
      description:
          'Dell Inspiron: Versátil e acessível (para uso cotidiano e estudos).',
      price: 99.99,
      imageUrl: 'assets/images/computer.jpg',
      rating: 4.8,
      category: 'Eletrônicos',
    ),
    Item(
      id: '2',
      title: 'Hamburguer',
      description:
          'Hambúrguer com queijo derretido, bacon crocante, carne suculenta e combinações equilibradas de sabores',
      price: 99.99,
      imageUrl: 'assets/images/hamburguer.jpg',
      rating: 4.8,
      category: 'Comida',
    ),
    Item(
      id: '3',
      title: 'Calças Jeans',
      description:
          'Levi\'s 501: Clássico atemporal (para uso casual e social).',
      category: 'Moda',
      price: 99.99,
      imageUrl: 'assets/images/jeans.jpg',
      rating: 4.8,
    ),
    Item(
      id: '4',
      title: 'Chuteiras',
      description:
          'Adidas Predator: Alta performance (para futebol e esportes).',
      category: 'Esportes',
      price: 99.99,
      imageUrl: 'assets/images/boots.jpg',
      rating: 4.8,
    ),
    Item(
      id: '5',
      title: 'Cadeira',
      description: 'Cadeira de varanda ergonômica com suporte lombar ajustável',
      category: 'Casa',
      price: 99.99,
      imageUrl: 'assets/images/chair.jpg',
      rating: 4.8,
    ),
    Item(
      id: '6',
      title: 'Kit Facial',
      description:
          'Hidratante facial com ingredientes naturais para pele saudável',
      category: 'Beleza',
      price: 99.99,
      imageUrl: 'assets/images/face_care.jpg',
      rating: 4.8,
    ),
  ];

  final List<Map<String, dynamic>> categories = [
    {'name': 'Todos', 'icon': Icons.widgets, 'color': Colors.blue},
    {
      'name': 'Eletrônicos',
      'icon': Icons.electrical_services,
      'color': Colors.green,
    },
    {'name': 'Moda', 'icon': Icons.checkroom, 'color': Colors.pink},
    {'name': 'Casa', 'icon': Icons.home, 'color': Colors.orange},
    {'name': 'Beleza', 'icon': Icons.spa, 'color': Colors.purple},
    {'name': 'Esportes', 'icon': Icons.sports_soccer, 'color': Colors.red},
  ];

  List<Item> get filteredItems {
    if (selectedCategory == 'Todos') {
      return allItems;
    }
    return allItems.where((item) => item.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Demo Project',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        leadingWidth: 140,
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/main_icons/settings.png'),
              size: 30,
              color: Colors.blue,
            ),
            onPressed: () {
              print('Configurações pressionadas');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 76,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: Category(
                      name: categories[index]['name'],
                      icon: categories[index]['icon'],
                      color: categories[index]['color'],
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index]['name'];
                        });
                        print(
                          'Categoria selecionada: ${categories[index]['name']}',
                        );
                      },
                    ),
                    isSelected: selectedCategory == categories[index]['name'],
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            Text(
              'Produtos em destaque',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProductItemCard(
                      item: filteredItems[index],
                      onTap: () {},
                      onFavoritePressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
