/// ═════════════════════════════════════════════
/// FILE: patient_model.dart
/// PURPOSE: Modelo de datos para la entidad Paciente en módulos clínicos
/// STATUS: PLACEHOLDER
/// NEXT PHASE: Conectar campos clínicos detallados con Supabase en Fase 2
/// ═════════════════════════════════════════════

// ╔════════════════════════╗
// ║ MODELS                 ║
// ╚════════════════════════╝

/// Entidad de Paciente asignado a una clínica
class Patient {
  final String id;
  final String clinicId;
  final String name;
  final int age;
  final String phone;
  final String email;
  final String? medicalHistory;

  Patient({
    required this.id,
    required this.clinicId,
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
    this.medicalHistory,
  }) {
    assert(id.isNotEmpty, 'El id no puede estar vacío');
    assert(clinicId.isNotEmpty, 'El clinicId es obligatorio');
    assert(name.isNotEmpty, 'El nombre es obligatorio');
    assert(age >= 0 && age <= 130, 'Edad fuera de rango válido');
  }

  // NOTE: toJson/fromJson serán conectados a Supabase en fase 2
  // TODO: Conectar a Supabase en fase 2
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as String? ?? '',
      clinicId: json['clinic_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      medicalHistory: json['medical_history'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clinic_id': clinicId,
      'name': name,
      'age': age,
      'phone': phone,
      'email': email,
      'medical_history': medicalHistory,
    };
  }
}
