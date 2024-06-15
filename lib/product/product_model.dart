class ProductModel {
  String? name;
  String? description;
  double? price;
  String? image; // Can be null

  ProductModel({this.name, this.description, this.price, this.image});

  static List<ProductModel> products = [
    ProductModel(
      name: 'Apple iPhone 13',
      description: '5G speed, A15 Bionic chip, and a brighter Super Retina XDR display.',
      price: 999.0,
      image: 'data:image/jpeg;base64,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', // Replace with a relevant image URL
    ),
    ProductModel(
      name: 'Samsung Galaxy S21',
      description: 'Pro Grade Camera, 8K Video, and 108MP High Resolution.',
      price: 799.0,
      image: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s21-5g-r.jpg', // Replace with a relevant image URL
    ),
    ProductModel(
      name: 'Sony WH-1000XM4',
      description: 'Industry Leading Noise Canceling Overhead Headphones.',
      price: 349.99,
      image: 'https://d1ncau8tqf99kp.cloudfront.net/converted/117670_original_local_256x224_v3_converted.webp', // Replace with a relevant image URL
    ),
    ProductModel(
      name: 'Apple MacBook Pro',
      description: 'Apple M1 chip, 13-inch Retina display, and up to 20 hours of battery life.',
      price: 1299.0,
      image: "https://evostore.com.np/image/catalog/banner/MBP-M3%20(1).jpg", // No image found yet
    ),
    ProductModel(
      name: 'Dell XPS 13',
      description: '13.4-inch FHD display, Intel Core i7, and up to 12 hours of battery life.',
      price: 999.99,
      image: null, // No image found yet
    ),
    ProductModel(
      name: 'Google Pixel 6',
      description: 'Google Tensor chip, 50MP camera, and a 6.4-inch OLED display.',
      price: 599.0,
      image: 'https://images.unsplash.com/photo-1542751110-97427bbecf20', // Replace with a relevant image URL
    ),
    ProductModel(
      name: 'Bose QuietComfort 35 II',
      description: 'Wireless Bluetooth Headphones, Noise-Cancelling, with Alexa Voice Control.',
      price: 299.0,
      image: 'https://itechstore.com.np/_ipx/w_1536&f_webp/img/product/b452ec59-14bb-4ee3-a0b1-8b39f07bff24/dell-xps-9530-i9-13th-gen.png', // Replace with a relevant image URL
    ),
    ProductModel(
      name: 'Nikon D850',
      description: '45.7MP FX-Format CMOS sensor, 4K UHD video recording, and up to 9 fps continuous shooting.',
      price: 2999.0,
      image: null, // No image found yet
    ),
    ProductModel(
      name: 'Sony PlayStation 5',
      description: 'Next-generation gaming console with 8K output and HDR technology.',
      price: 499.0,
      image: null, // No image found yet
    ),
    ProductModel(
      name: 'Microsoft Xbox Series X',
      description: 'Powerful gaming console with 12 teraflops of processing power and 1TB SSD.',
      price: 499.0,
      image: null, // No image found yet
    )];
}