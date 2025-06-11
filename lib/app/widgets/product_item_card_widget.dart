import 'package:demo_project/app/services/favorites_service.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/app/models/item_model.dart';
import 'package:demo_project/app/screens/detail_screen.dart';

class ProductItemCard extends StatefulWidget {
  final Item item;
  final bool initialFavoriteStatus;
  final VoidCallback? onFavoriteUpdated;

  const ProductItemCard({
    super.key,
    required this.item,
    this.initialFavoriteStatus = false,
    this.onFavoriteUpdated,
    required Null Function() onFavoritePressed,
    required Null Function() onTap,
  });

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  late bool isFavorite;
  final FavoriteService _favoriteService = FavoriteService();

  @override
  void initState() {
    super.initState();
    isFavorite = _favoriteService.isFavorite(widget.item);
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      _favoriteService.toggleFavorite(widget.item);
    });
    if (widget.onFavoriteUpdated != null) {
      widget.onFavoriteUpdated!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: widget.item),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.item.imageUrl,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                widget.item.category ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(widget.item.rating.toString()),
                  const Spacer(),
                  Text(
                    '\$${widget.item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
