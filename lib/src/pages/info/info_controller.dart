import 'package:get/get.dart';

class InfoController extends GetxController {
  var selectedValue = 'Medicina General'.obs; // Utilizando Observables de GetX
  var displayText = 'Sin Elegir'.obs; // Utilizando Observables de GetX
  var doctor = 'Sin Doctor Elegido'.obs;
  var imagen = 'assets/img/logopmh.jpg'.obs;
  var descripcion = 'La posta médica huancayo es un centro de atención de salud comunitario. Su personal capacitado proporciona servicios médicos básicos con enfoque en la prevención y tratamiento de enfermedades. La posta ofrece atención médica cercana y accesible, promoviendo la salud y el bienestar en la comunidad.'.obs;
  final Map<String, String> Doctores = {
    'Medicina General': 'Dra. Sofia Rodriguez Garcia',
    'Obstetricia': 'Dr. Daniel Martinez Fernandez',
    'Enfermería': 'Dra. Laura Lopez Hernandez',
    'Psicología':'Dr. Alejandro Ramos Condori',
    'Odontológia':'Dr. Seralo Perez Ruiz',
    'Oncologia':'Dr. Juan Jimenez Diaz',
    'Pediatria':'Dr. Carlos Tapia Medina'
  };
  final Map<String, String> Descriciones = {
    'Medicina General': 'La doctora Rodriguez es un médico comprometido con experiencia en Medicina General. Se especializa en el diagnóstico y tratamiento de diversas condiciones médicas, proporcionando atención integral y compasiva a sus pacientes.',
    'Obstetricia': 'El doctor Martinez es un especialista consagrado con amplia experiencia en Obstetricia. Se dedica a la atención integral de la salud materna, brindando cuidados obstétricos expertos y compasivos.',
    'Enfermería': 'La enfermera Lopez es una profesional dedicada con experiencia en enfermería. Se especializa en cuidados de salud integral, centrándose en enfermedades cardíacas y proporcionando atención compasiva y experta a sus pacientes.',
    'Psicología': 'El psicologo Ramos es una profesional comprometida con experiencia en psicología clínica. Se especializa en el manejo de diversas condiciones mentales, brindando atención compasiva y experta para promover el bienestar emocional de sus pacientes.',
    'Odontológia':'El odontólogo Perez es un profesional dedicado con experiencia en odontología. Se especializa en el cuidado integral de la salud bucal, ofreciendo tratamientos especializados y atención odontológica compasiva para mantener la salud dental de sus pacientes',
    'Oncologia':'El oncólogo Jimenez es un médico comprometido con una destacada experiencia en oncología. Se especializa en el diagnóstico y tratamiento de enfermedades oncológicas, brindando atención médica compasiva y especializada para apoyar a los pacientes en su lucha contra el cáncer.',
    'Pediatria':'El pediatra Tapia es un médico comprometido con amplia experiencia en pediatría. Se especializa en el cuidado de la salud infantil, brindando atención médica compasiva y experta para garantizar el bienestar de los niños a lo largo de su desarrollo.'
  };
  final Map<String, String> Imagenes = {
    'Medicina General': 'assets/img/img_5.png',
    'Obstetricia': 'assets/img/img_6.png',
    'Enfermería': 'assets/img/img_7.png',
    'Psicología':'assets/img/img_8.png',
    'Odontológia':'assets/img/img_3.png',
    'Oncologia':'assets/img/img_9.png',
    'Pediatria':'assets/img/img_10.png'
  };
  void updateDisplayText() {
    // Puedes personalizar esta lógica según tus necesidades
    // Aquí simplemente establecemos el texto según la opción seleccionada
    displayText.value = '${selectedValue.value}';
    doctor.value = '${Doctores[selectedValue]}';
    descripcion.value = '${Descriciones[selectedValue]}';
    imagen.value = '${Imagenes[selectedValue]}';
  }
}