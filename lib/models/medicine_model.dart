/// ═════════════════════════════════════════════
/// FILE: medicine_model.dart
/// PURPOSE: Modelo de datos para inventario de medicamentos e insumos clínicos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Stock se actualiza mediante MedicineMovement en fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ MODELS                 ║
// ╚════════════════════════╝

/// Entidad de Medicamento o Insumo en el almacén
class Medicine {
  final String id;
  final String sku;
  final String name;
  final String category;
  final double pricePerUnit;
  final int stockQuantity;
  final int minStock;
  final DateTime? expiryDate;

  Medicine({
    required this.id,
    required this.sku,
    required this.name,
    required this.category,
    required this.pricePerUnit,
    required this.stockQuantity,
    required this.minStock,
    this.expiryDate,
  }) {
    assert(id.isNotEmpty, 'El id no puede estar vacío');
    assert(sku.isNotEmpty, 'El SKU es requerido');
    assert(name.isNotEmpty, 'El nombre del medicamento es requerido');
    assert(pricePerUnit >= 0, 'El precio no puede ser negativo');
    assert(stockQuantity >= 0, 'La cantidad en stock no puede ser negativa');
    assert(minStock >= 0, 'El stock mínimo no puede ser negativo');
  }

  /// Indica si el stock actual está en nivel de alerta crítico
  bool get isLowStock => stockQuantity <= minStock;

  // NOTE: Este método retorna un modelo desde JSON. Implementar en fase 2
  // TODO: Conectar a Supabase en fase 2
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      pricePerUnit: (json['price_per_unit'] as num?)?.toDouble() ?? 0.0,
      stockQuantity: (json['stock_quantity'] as num?)?.toInt() ?? 0,
      minStock: (json['min_stock'] as num?)?.toInt() ?? 0,
      expiryDate: json['expiry_date'] != null
          ? DateTime.tryParse(json['expiry_date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'name': name,
      'category': category,
      'price_per_unit': pricePerUnit,
      'stock_quantity': stockQuantity,
      'min_stock': minStock,
      'expiry_date': expiryDate?.toIso8601String(),
    };
  }
}
