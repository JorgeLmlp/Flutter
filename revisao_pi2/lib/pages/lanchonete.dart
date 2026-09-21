import 'package:flutter/material.dart';
import 'package:revisao_pi2/widgets/produto.dart';

final listaProdutos = [
  Itens(
    name: "x-burguer",
    description: "Delicioso x-burguer com queijo, alface e tomate",
    price: 12.99,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0qr57JtqSDyeEMCpaz-SdxUXTzK4pQD6nYpJhyaCdTqjlf74plRZSWVo&s=10",
  ),
  Itens(
    name: "x-ratao",
    description: "Delicioso x-ratao com queijo, alface e tomate",
    price: 99.99,
    imageUrl: "https://i.ytimg.com/vi/1OrD0c9AHPs/hqdefault.jpg",
  ),
  Itens(
    name: "x-salada",
    description: "Delicioso x-salada com queijo, alface e tomate",
    price: 20.99,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEqmO3HJ95J8BWrQUtyeK8fXytic88UkGRzTUnj6m9GAt3lVEHbxCbXA8&s=10",
  ),
    Itens(
    name: "Pão",
    description: "Pão que o diabo amassou",
    price: 4.99,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrq-7gz_-JNpdU2Kf805MxL2aiceJAzdOV1NNXIuQSVplqqMitWdfNFy0&s=10",
  ),
];

class HomeLanchonete extends StatelessWidget {
  const HomeLanchonete({super.key});

  showGeneralDialog(
      context: context,
      barrierDismissible: true, // Fecha ao clicar fora
      barrierLabel: 'Fechar',
      barrierColor: Colors.black.withOpacity(0.5), // Cor de fundo atrás do modal
      transitionDuration: const Duration(milliseconds: 300), // Duração da animação
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
         return AlertDialog(
          title: Text(
            produto.name,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
      // Aqui você define a animação de entrada
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Curva para deixar a animação mais natural/suave
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
        
        return ScaleTransition(
          scale: curvedAnimation, // Faz o modal "crescer" ao surgir
          child: FadeTransition(
            opacity: animation, // Faz o modal surgir suavemente (efeito fade)
            child: child,
          ),
        );
      },
    );
  }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lanchonete"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        
        child: 
        Padding(
          
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "CATEGORIAS: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    
                    ),
                    
                  ),
                  SizedBox(width: 80),

                  Text(
                    "Ver todas",
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(width: 20),
                  Text("Do dia", style: TextStyle(color: Colors.blueGrey),)
                ],
              ),
              const SizedBox(height: 20),
              Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: listaProdutos.map((produto) {
                          return Produto(produto: produto);
                        }).toList(),
                      ))),
                      
            ],
          ),
        ),
      ),
    );
  }
}
