import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_x/core/constants/assets_constants.dart';
import 'package:task_x/core/theme/app_pallete.dart';
import 'package:task_x/features/home/model/products_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsPage({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.name),
        backgroundColor: Pallete.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  AssetsConstants.imgProduct1,
                  scale: 4,
                ),
                // child: Image.network(
                //   productModel.image.isNotEmpty
                //       ? productModel.image
                //       : 'https://picsum.photos/320/180', // Use a placeholder image if URL is empty
                //   height: 320,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                //   errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                //     // Return a placeholder widget if the image fails to load
                //     return Image.asset(
                //       AssetsConstants.imgProduct1,
                //       height: 320,
                //       width: double.infinity,
                //       fit: BoxFit.cover,
                //     );
                //   },
                // ),
              ),
              const SizedBox(height: 16.0),
              // Product name
              Text(
                productModel.name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 8.0),
              // Brand and Category
              Text(
                'Brand: ${productModel.brand} | Category: ${productModel.category}',
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              // Price and Discounted price
              Row(
                children: [
                  Text(
                    '\$${productModel.price}',
                    style: GoogleFonts.poppins(
                      color: Colors.red[300], // Original price in red
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '\$${(productModel.price * (1 - productModel.discount / 100)).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.green[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // Availability
              Text(
                productModel.availability ? 'In Stock' : 'Out of Stock',
                style: GoogleFonts.poppins(
                  color: productModel.availability
                      ? Colors.green[300]
                      : Colors.red[400],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // Description
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                productModel.description,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              // Rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${productModel.rating}/5',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // Reviews
              Text(
                'Reviews',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productModel.reviews.length,
                itemBuilder: (context, index) {
                  final review = productModel.reviews[index];
                  return ListTile(
                    title: Text(
                      'User ${review['user_id']}',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    subtitle: Text(
                      review['comment'],
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[600],
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '${review['rating']}/5',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
