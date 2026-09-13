/// ═════════════════════════════════════════════
/// FILE: appointment_model.dart
/// PURPOSE: Modelo de datos para la gestión de citas médicas
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar con tabla appointments de Supabase en Fase 2
/// ═════════════════════════════════════════════

import 'enums.dart';

// ╔════════════════════════╗
// ║ MODELS                 ║
// ╚════════════════════════╝

/// Entidad de Cita Médica
class Appointment {
  final String id;
  final String patientId;
  final String clinicId;
  final String doctorName;
  final DateTime appointmentDate;
  final AppointmentStatus status;
  final String? notes;

  Appointment({
    required this.id,
    required this.patientId,
    required this.clinicId,
    required this.doctorName,
    required this.appointmentDate,
    required this.status,
    this.notes,
  }) {
    assert(id.isNotEmpty, 'El id no puede estar vacío');
    assert(patientId.isNotEmpty, 'El patientId es obligatorio');
    assert(clinicId.isNotEmpty, 'El clinicId es obligatorio');
    assert(doctorName.isNotEmpty, 'El nombre del médico es obligatorio');
  }

  // NOTE: toJson/fromJson serán conectados a Supabase en fase 2
  // TODO: Conectar a Supabase en fase 2
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] as String? ?? '',
      patientId: json['patient_id'] as String? ?? '',
      clinicId: json['clinic_id'] as String? ?? '',
      doctorName: json['doctor_name'] as String? ?? '',
      appointmentDate: json['appointment_date'] != null
          ? DateTime.tryParse(json['appointment_date'] as String) ?? DateTime.now()
          : DateTime.now(),
      status: AppointmentStatus.values.firstWhere(
        (e) => e.name == (json['status'] as String?),
        orElse: () => AppointmentStatus.PENDING,
      ),
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'clinic_id': clinicId,
      'doctor_name': doctorName,
      'appointment_date': appointmentDate.toIso8601String(),
      'status': status.name,
      'notes': notes,
    };
  }
}
