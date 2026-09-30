class Pedido {
  int? id;

  String cliente;
  String prato;
  int quantidade;
  double valorUnitario;
  String status;

  Pedido({
    this.id,
    required this.cliente,
    required this.prato,
    required this.quantidade,
    required this.valorUnitario,
    this.status = 'Pendente',
  });

  double get total {
    return quantidade * valorUnitario;
  }

  String get classificacao {
    if (quantidade >= 5) {
      return 'PEDIDO GRANDE';
    }

    return 'PEDIDO NORMAL';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente': cliente,
      'prato': prato,
      'quantidade': quantidade,
      'valor_unitario': valorUnitario,
      'total': total,
      'classificacao': classificacao,
      'status': status,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      cliente: map['cliente'],
      prato: map['prato'],
      quantidade: map['quantidade'],
      valorUnitario:
          (map['valor_unitario'] as num).toDouble(),
      status: map['status'],
    );
  }
}