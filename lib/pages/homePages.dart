import 'package:flutter/material.dart';
import 'dart:ui';
import 'detalles_producto_page.dart';
import 'carrito_page.dart';
import 'favoritos_page.dart';
import 'alertas_page.dart';
import 'perfil_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int _selectedCategory = 0;
  String _searchQuery = '';
  
  final List<String> categories = ['🔥 Popular', '🍔 Burgers', '🍕 Pizzas', '🍣 Sushi', '🌮 Tacos', '🥤 Bebidas'];

  final List<Map<String, dynamic>> menuItems = [
    {
      'id': '1',
      'nombre': 'Burger Extrema',
      'descripcion': 'Doble carne asada a la parrilla con tocino, queso derretido cheddar y salsa BBQ secreta de la casa.',
      'precio': 8.99,
      'imagen': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Burgers',
      'calificacion': 4.9
    },
    {
      'id': '2',
      'nombre': 'Pizza Gourmet',
      'descripcion': 'Pizza artesanal con pepperoni rústico, mozzarella de búfala fresca y albahaca.',
      'precio': 14.50,
      'imagen': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Pizzas',
      'calificacion': 4.8
    },
    {
      'id': '3',
      'nombre': 'Sushi Roll Dragon',
      'descripcion': 'Rollo de camarón tempura, anguila, aguacate y salsa teriyaki artesanal.',
      'precio': 12.00,
      'imagen': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Sushi',
      'calificacion': 4.7
    },
    {
      'id': '4',
      'nombre': 'Tacos al Pastor',
      'descripcion': 'Orden de 4 jugosos tacos al pastor con piña, cebolla, cilantro y limón fresco.',
      'precio': 6.50,
      'imagen': 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Tacos',
      'calificacion': 4.6
    },
    {
      'id': '5',
      'nombre': 'Pollo Frito Crujiente',
      'descripcion': 'Piezas de pollo marinado por 24 horas y rebosado en especias secretas.',
      'precio': 10.99,
      'imagen': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Popular',
      'calificacion': 4.8
    },
    {
      'id': '6',
      'nombre': 'Pasta Carbonara',
      'descripcion': 'Auténtica carbonara italiana con panceta, huevo, queso parmesano y pimienta negra.',
      'precio': 13.50,
      'imagen': 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Popular',
      'calificacion': 4.9
    },
    {
      'id': '7',
      'nombre': 'Papas Fritas Trufadas',
      'descripcion': 'Papas fritas doradas bañadas en aceite de trufa blanca y queso parmesano rallado.',
      'precio': 5.50,
      'imagen': 'https://images.unsplash.com/photo-1576107232684-1279f390859f?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Popular',
      'calificacion': 4.5
    },
    {
      'id': '8',
      'nombre': 'Jugo de Naranja',
      'descripcion': 'Jugo fresco exprimido cada mañana, lleno de vitamina C.',
      'precio': 3.50,
      'imagen': 'https://images.unsplash.com/photo-1556881286-fc6915169721?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Bebidas',
      'calificacion': 4.3
    },
    {
      'id': '9',
      'nombre': 'Cheeseburger Clásica',
      'descripcion': 'La clásica hamburguesa con queso derretido, mostaza, kétchup y pepinillos.',
      'precio': 7.50,
      'imagen': 'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Burgers',
      'calificacion': 4.7
    },
    {
      'id': '10',
      'nombre': 'Pizza Hawaiana',
      'descripcion': 'Deliciosa pizza con trozos de piña, jamón, y queso fundido al horno.',
      'precio': 13.00,
      'imagen': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Pizzas',
      'calificacion': 4.6
    },
    {
      'id': '11',
      'nombre': 'Nigiri de Salmón',
      'descripcion': 'Finos cortes de salmón fresco sobre pequeñas porciones de arroz avinagrado.',
      'precio': 9.00,
      'imagen': 'https://images.unsplash.com/photo-1553621042-f6e147245754?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Sushi',
      'calificacion': 4.8
    },
    {
      'id': '12',
      'nombre': 'Tacos de Asada',
      'descripcion': 'Tres tacos de carne asada con guacamole, pico de gallo y salsa verde.',
      'precio': 7.00,
      'imagen': 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Tacos',
      'calificacion': 4.9
    },
    {
      'id': '13',
      'nombre': 'Refresco de Cola',
      'descripcion': 'Refresco burbujeante bien frío con hielos.',
      'precio': 2.50,
      'imagen': 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Bebidas',
      'calificacion': 4.5
    },
    {
      'id': '14',
      'nombre': 'Limonada Rosa',
      'descripcion': 'Limonada cítrica refrescante con un toque dulce de frambuesa.',
      'precio': 3.00,
      'imagen': 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=600&q=80',
      'categoria': 'Bebidas',
      'calificacion': 4.8
    },
  ];

  List<Map<String, dynamic>> get filteredItems {
    String selectedCatName = categories[_selectedCategory].split(' ')[1];
    return menuItems.where((item) {
      bool matchesCategory = (_selectedCategory == 0) || (item['categoria'] == selectedCatName);
      bool matchesSearch = item['nombre'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  late AnimationController _animationController;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: _buildAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(0.05, 0), end: Offset.zero).animate(animation),
              child: child,
            ),
          );
        },
        child: _buildCurrentPage(),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.person, color: Colors.grey),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))
            ]
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CarritoPage()));
            },
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
        ),
        child: FadeTransition(
          opacity: _animationController,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menú de Comida 🍽️', style: TextStyle(fontSize: 18, color: Colors.grey)),
              SizedBox(height: 5),
              Text(
                'Elige la comida \nmás deliciosa 😋',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FadeTransition(
        opacity: _animationController,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Buscar hamburguesa, pizza...',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 25, bottom: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategory == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepOrange : Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: isSelected 
                  ? [BoxShadow(color: Colors.deepOrange.withOpacity(0.4), blurRadius: 12, offset: const Offset(0, 6))] 
                  : [],
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = filteredItems[index];
            // Animation staggered by index
            final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Interval((index / filteredItems.length) * 0.5, 1.0, curve: Curves.easeOutBack),
              ),
            );

            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => DetallesProductoPage(producto: item),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 10))
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagen de Comida
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Hero(
                                tag: item['id'],
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                                  child: Image.network(
                                    item['imagen'],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star, color: Colors.amber, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${item['calificacion']}',
                                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // Detalles
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['nombre'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'S/. ${item['precio']}',
                                      style: const TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Icon(Icons.add, color: Colors.white, size: 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: filteredItems.length,
        ),
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return CustomScrollView(
          key: const ValueKey('home'),
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearchBar()),
            SliverToBoxAdapter(child: _buildCategories()),
            _buildFoodGrid(),
          ],
        );
      case 1:
        return const FavoritosPage(key: ValueKey('favoritos'));
      case 2:
        return const AlertasPage(key: ValueKey('alertas'));
      case 3:
        return const PerfilPage(key: ValueKey('perfil'));
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, -5))],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 28), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 28), label: 'Favs'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, size: 28), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: 'Profile'),
        ],
      ),
    );
  }
}