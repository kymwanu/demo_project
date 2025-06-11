import 'package:demo_project/app/services/favorites_service.dart';
import 'package:demo_project/app/widgets/product_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoriteService _favoriteService = FavoriteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favoritos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: _favoriteService.favoriteItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Nenhum favorito ainda',
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.4,
                  ),
                  itemCount: _favoriteService.favoriteItems.length,
                  itemBuilder: (context, index) {
                    final item = _favoriteService.favoriteItems[index];
                    return ProductItemCard(
                      item: item,
                      initialFavoriteStatus: true,
                      onFavoriteUpdated: () => setState(() {}),
                      onFavoritePressed: () {},
                      onTap: () {},
                    );
                  },
                ),
              ),
      ),
    );
  }
}
