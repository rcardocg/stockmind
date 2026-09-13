/// ═════════════════════════════════════════════
/// FILE: appointment_card.dart
/// PURPOSE: Tarjeta visual para citas médicas con código de color por estado
/// STATUS: READY
/// NEXT PHASE: Conectar con acciones de completar/cancelar cita en Fase 2
/// ═════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../models/appointment_model.dart';
import '../models/enums.dart';

// ╔════════════════════════╗
// ║ WIDGETS                ║
// ╚════════════════════════╝

/// Componente visual para listar citas médicas
class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback? onTap;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onTap,
  });

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.PENDING:
        return const Color(0xFFD97706); // Amarillo / Ámbar
      case AppointmentStatus.COMPLETED:
        return const Color(0xFF16A34A); // Verde
      case AppointmentStatus.CANCELLED:
        return const Color(0xFFDC2626); // Rojo
    }
  }

  String _getStatusLabel(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.PENDING:
        return 'PENDIENTE';
      case AppointmentStatus.COMPLETED:
        return 'COMPLETADA';
      case AppointmentStatus.CANCELLED:
        return 'CANCELADA';
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(appointment.status);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 18, color: Color(0xFF64748B)),
                    const SizedBox(width: 6),
                    Text(
                      'Paciente: ${appointment.patientId}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _getStatusLabel(appointment.status),
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20, color: Color(0xFFE2E8F0)),
            Row(
              children: [
                const Icon(Icons.medical_services_outlined, size: 16, color: Color(0xFF64748B)),
                const SizedBox(width: 6),
                Text('Dr(a). ${appointment.doctorName}', style: const TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF64748B)),
                const SizedBox(width: 6),
                Text(
                  'Fecha: ${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year}',
                  style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                ),
              ],
            ),
            if (appointment.notes != null && appointment.notes!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Nota: ${appointment.notes}',
                style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
