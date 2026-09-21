import 'package:flutter/material.dart';

class Itens {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Itens({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Produto extends StatelessWidget {
  final Itens produto;
  const Produto({super.key, required this.produto});



    void _openDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, 
      barrierLabel: 'Fechar',
      barrierColor: Colors.black.withValues(alpha: 0.5), 
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {

        return AlertDialog(
          title: Text(
            produto.name,
            style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(produto.imageUrl, height: 150, fit: BoxFit.contain),
              const SizedBox(height: 10),
              Text(
                produto.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 15),
              Text(
                'R\$ ${produto.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar', style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
        
        return ScaleTransition(
          scale: curvedAnimation, 
          child: FadeTransition(
            opacity: animation, 
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 140,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.orange, width: 1.0,), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(padding: EdgeInsets.all(10)),
          Image.network(produto.imageUrl, height: 150, width: 120),
          Text(
            produto.name,
            style: TextStyle(fontSize: 24, color: Colors.orange),
          ),
          Text(
            textAlign: TextAlign.center,
            produto.description,
            style: TextStyle(
      
              fontSize: 12,
            
            ),
          ),
          
          Text(produto.price.toString()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                 _openDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)), 
                  ),
                ),
                child: Text("Ver detalhes", style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }
}