import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_x/core/constants/assets_constants.dart';
import 'package:task_x/core/theme/app_pallete.dart';
import 'package:task_x/features/home/model/products_model.dart';
import 'package:task_x/features/home/view/pages/product_details.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailsPage(
              productModel: productModel,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Pallete.cardColor, // Dark background color
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productModel.image, // URL of the image
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // Return a placeholder widget if the image fails to load
                return Image.asset(
                  AssetsConstants.imgProduct1,
                  scale: 4,
                );
              },
            ),
            const SizedBox(height: 8.0),
            // Product name
            Text(
              productModel.name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Brand: ${productModel.brand}',
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            // Price and discounted price
            Row(
              children: [
                Text(
                  '\$${productModel.price}',
                  style: TextStyle(
                    color: Colors.red[300], // Original price in red
                    decoration: TextDecoration
                        .lineThrough, // Strike-through for discount
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '\$${(productModel.price * (1 - productModel.discount / 100)).toStringAsFixed(2)}', // Formatting discounted price to 2 decimal places
                  style: TextStyle(
                    color: Colors.green[400], // Discounted price in green
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            // Rating
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 16.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '${productModel.rating}/5',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[400], // Red background for discount badge
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    '${productModel.discount}% OFF',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
