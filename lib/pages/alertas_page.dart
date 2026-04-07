import 'package:flutter/material.dart';

class AlertasPage extends StatelessWidget {
  const AlertasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notificaciones = [
      {
        'titulo': '¡Tu comida está en camino!',
        'subtitulo': 'El repartidor llegará en aproximadamente 15 minutos.',
        'icono': Icons.delivery_dining,
        'color': Colors.deepOrange,
        'tiempo': 'Hace 5 min'
      },
      {
        'titulo': 'Cupón del 20% de descuento',
        'subtitulo': 'Usa el código DELICIOSO20 en tu próxima compra.',
        'icono': Icons.local_offer,
        'color': Colors.green,
        'tiempo': 'Hace 2 horas'
      },
      {
        'titulo': 'Pedido entregado',
        'subtitulo': '¡Esperamos que lo hayas disfrutado! Danos tu opinión.',
        'icono': Icons.check_circle,
        'color': Colors.blue,
        'tiempo': 'Ayer'
      },
      {
        'titulo': '¡Bienvenido a Menú de Comida!',
        'subtitulo': 'Descubre nuestros platillos populares y ofertas.',
        'icono': Icons.celebration,
        'color': Colors.purple,
        'tiempo': 'Hace 2 días'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Tus Alertas 🔔',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final alerta = notificaciones[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, 5))
                    ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: alerta['color'].withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(alerta['icono'], color: alerta['color'], size: 28),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alerta['titulo'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              alerta['subtitulo'],
                              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.3),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              alerta['tiempo'],
                              style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: notificaciones.length,
            ),
          ),
        ],
      ),
    );
  }
}
