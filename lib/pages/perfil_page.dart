import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Cabecera de Perfil
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.deepOrange, width: 3),
                      boxShadow: [
                        BoxShadow(color: Colors.deepOrange.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))
                      ]
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 60, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Franklyn Ramirez',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('🌟 Cuenta VIP', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Opciones de Configuración
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileOption(context, Icons.person_outline, 'Sobre Mí', Colors.blue),
                  _buildProfileOption(context, Icons.receipt_long, 'Historial de Compras', Colors.green),
                  _buildProfileOption(context, Icons.credit_card, 'Métodos de Pago', Colors.deepOrange),
                  _buildProfileOption(context, Icons.location_on_outlined, 'Direcciones de Envío', Colors.purple),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  _buildProfileOption(context, Icons.settings_outlined, 'Configuración', Colors.grey),
                  _buildProfileOption(context, Icons.help_outline, 'Centro de Ayuda', Colors.teal),
                  const SizedBox(height: 20),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.logout, color: Colors.red),
                    ),
                    title: const Text('Cerrar Sesión', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          if (title == 'Sobre Mí') {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                title: const Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('Sobre Mí'),
                  ],
                ),
                content: const Text(
                  'Desarrollador: Franklyn Ramirez\n'
                  'Versión de App: 1.0.0\n\n'
                  '¡Esta es una aplicación de Restaurante Premium construida con Flutter!',
                  style: TextStyle(height: 1.5, fontSize: 16),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Cerrar', style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              )
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Abriendo: $title...'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: color,
              ),
            );
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
