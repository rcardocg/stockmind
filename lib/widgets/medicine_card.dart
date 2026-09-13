/// ═════════════════════════════════════════════
/// FILE: medicine_card.dart
/// PURPOSE: Tarjeta reutilizable para visualizar información de un medicamento
/// STATUS: READY
/// NEXT PHASE: Conectar acciones de editar/despachar en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../models/medicine_model.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// Componente visual para listar un medicamento en el almacén
class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final VoidCallback? onTap;

  const MedicineCard({
    super.key,
    required this.medicine,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCritical = medicine.isLowStock;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isCritical ? Colors.red.shade200 : const Color(0xFFE2E8F0),
          width: isCritical ? 1.5 : 1,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isCritical ? Colors.red.shade50 : const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.medication_rounded,
            color: isCritical ? Colors.red.shade700 : const Color(0xFF1E3A8A),
          ),
        ),
        title: Text(
          medicine.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('SKU: ${medicine.sku} • Cat: ${medicine.category}'),
            const SizedBox(height: 4),
            if (isCritical)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'STOCK CRÍTICO (Mín: ${medicine.minStock})',
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${medicine.stockQuantity}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isCritical ? Colors.red.shade700 : const Color(0xFF0F172A),
              ),
            ),
            const Text(
              'Unidades',
              style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
            ),
          ],
        ),
      ),
    );
  }
}
