/// ═════════════════════════════════════════════
/// FILE: patient_card.dart
/// PURPOSE: Tarjeta reutilizable para visualizar información básica de un paciente
/// STATUS: READY
/// NEXT PHASE: Conectar con pantalla de detalle de paciente en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../models/patient_model.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// Componente visual para listar pacientes en el módulo clínico
class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback? onTap;

  const PatientCard({
    super.key,
    required this.patient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF0D9488).withOpacity(0.1),
          foregroundColor: const Color(0xFF0D9488),
          child: const Icon(Icons.person_rounded),
        ),
        title: Text(
          patient.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Edad: ${patient.age} años • Tel: ${patient.phone}'),
            const SizedBox(height: 2),
            Text(
              patient.email,
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
      ),
    );
  }
}
