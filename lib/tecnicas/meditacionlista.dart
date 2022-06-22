import 'package:flutter/material.dart';

class Meditacion {
  String title;
  String descripcion;
  String imagen;

  Meditacion({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<Meditacion> movieList = [
  Meditacion(
      title: 'Descripcion',
      descripcion:
          'Con el fin de evadirnos de pensamientos negativos 🤯😟, la meditación busca focalizar toda nuestra energía en el ahora 🙆‍♂️.Sin distracciones ni elementos que puedan interrumpir tu concentración 🧠, la meditación 🧘‍♂️ es un método para dormir mejor que requiere cierta práctica, asi que te recomiendo ser constante 🤓.',
      imagen: 'assets/images/meditacion.png'),
  Meditacion(
      title: 'Paso 1',
      descripcion:
          'Siéntate de una manera correcta: con la espalda recta pero relajada 🧘‍♂️. Puedes utilizar una silla 💺, un cojín o estar de rodillas. No es necesario que cruces las piernas y recuerda que debes olvidarte de tu cuerpo mientras meditas  para ello es imprescindible que te sientas comodo 🤗.',
      imagen: 'assets/images/dormido.png'),
  Meditacion(
      title: 'Paso 2',
      descripcion:
          'Una vez que te encuentres físicamente cómodo debes relajarte. Puedes centrarte en un objeto 🖼️ si tienes los ojos abiertos 👀, o en tu respiración 👃 si estás con los ojos cerrados 😌. Si durante la meditación 🧘‍♂️ pierdes la concentración 🧠, vuelve a iniciar con tranquilidad el proceso que has usado para relajarte.',
      imagen: 'assets/images/concentracion.png'),
  Meditacion(
      title: 'Paso 3',
      descripcion:
          'Durante la meditación 🧘‍♂️ acepta los pensamientos que van surgiendo 💭, déjalos fluir y sigue adelante 👍. Debes permanecer inmóvil; al principio puede ser incómodo pero a la larga es fundamental para mantener la concentración 🧠.',
      imagen: 'assets/images/hoja.png'),
  Meditacion(
      title: 'Paso 4',
      descripcion:
          'Añade la meditación a tus hábitos diarios, para progresar debes ser constante e integrar la meditación como un hábito más en tu rutina diaria. Con la práctica llega la excelencia y conseguirás los beneficios físicos 🙏 y mentales 🧠 de esta práctica milenaria.',
      imagen: 'assets/images/like.png'),
];

class RespiracionP {
  String title;
  String descripcion;
  String imagen;

  RespiracionP({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<RespiracionP> respiracionpList = [
  RespiracionP(
      title: 'Descripcion',
      descripcion:
          'La respiración profunda es una técnica de relajación para dormir mejor que exige toda nuestra atención. A pesar de su sencillez, debemos poner especial atencion en el modo en el que respiramos y cómo lo hacemos.',
      imagen: 'assets/images/livianos.png'),
  RespiracionP(
      title: 'Paso 1',
      descripcion:
          ' Vistete con ropa comoda 👚 y busca un lugar tranquilo libre de ruido 👂.',
      imagen: 'assets/images/pijama.png'),
  RespiracionP(
      title: 'Paso 2',
      descripcion:
          'Trata de relajarte y acuestate 🛌 sin cruzar ni brazos ni piernas 🧘‍♂️, encuentra una postura en la que percibas que te sientes cómodo 😌.',
      imagen: 'assets/images/dormido.png'),
  RespiracionP(
      title: 'Paso 3',
      descripcion:
          'Con tu mente 🧠 focalizada tan solo en la respiración 👃, inhala y exhala el aire por la nariz.',
      imagen: 'assets/images/nariz.png'),
  RespiracionP(
      title: 'Paso 4',
      descripcion:
          'A medida que vamos repitiendo el ejercicio, debemos realizar inhalaciones y exhalaciones más largas. El objetivo es sostenerlas lo máximo posible dentro de nuestras posibilidades sin acabar con nuestra sensación de confort. Cada vez que exhalemos, debemos prestar atención a cómo la tensión abandona nuestro cuerpo.',
      imagen: 'assets/images/respiracion.png'),
];

class Musica {
  String title;
  String descripcion;
  String imagen;

  Musica({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<Musica> musicaList = [
  Musica(
      title: 'Descripcion',
      descripcion:
          'Este método consiste, básicamente, en escuchar música antes de ir a dormir ya que según el neurólogo Takuro Endo 👨‍💼, determinado tipo de música 🎶 puede inducirnos a un estado de somnolencia 😴 y por ende es una técnica muy usada para mejorar el descanso 🛌.',
      imagen: 'assets/images/relajante.png'),
  Musica(
      title: 'Paso 1',
      descripcion:
          'Acuestate en tu cama 🛌 o en un lugar en donde te sientas comodo 😊. La postura debe ser la idónea para ir a dormir 😴. Recuerda que NO es cuestión de bailar 💃 ni cantar las canciones como si de un concierto se tratara 🥳.',
      imagen: 'assets/images/dormido.png'),
  Musica(
      title: 'Paso 2',
      descripcion:
          'Ahora debes de escoger un tipo de música 🎶 que te transmita paz y relajación 😌. Ejemplo de ello son: --Música clásica 🎻. --Instrumental 🎷. --Sonidos vinculados al medio ambiente 🍂. Existen infinidad de listas creadas en distintas plataformas como spotify, youtube, etc.',
      imagen: 'assets/images/violin.png'),
  Musica(
      title: 'Paso 3',
      descripcion:
          'Colocate audifonos y con un volumen adecuado 🔉 (no excesivamente alto 🔊), escucha con tranquilidad el sonido de la música 🎵, este poco a poco comenzara a relajarte 😌 y a llevarte a un sueño profundo 😴.',
      imagen: 'assets/images/escucha.png'),
];

class ConteoR {
  String title;
  String descripcion;
  String imagen;

  ConteoR({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<ConteoR> conteorList = [
  ConteoR(
      title: 'Descripcion',
      descripcion:
          'Este método consiste en contar. Debemos elegir una cifra elevada e ir descendiendo mentalmente dicho número hasta llegar a cero.',
      imagen: 'assets/images/cuenta-regresiva.png'),
  ConteoR(
      title: 'Paso 1',
      descripcion:
          'Acuestate en tu cama 🛌 o en un lugar que te relaje, cierra los ojos 😌 y fija una cifra alta. Por ejemplo, desde el número 100.',
      imagen: 'assets/images/dormido.png'),
  ConteoR(
      title: 'Paso 2',
      descripcion:
          'Una vez que has decidido la cifra por la que quieres comenzar 👍, es el momento de ir descendiendo por los números, uno a uno, al ritmo que quieras, sin exigencias ni nerviosismo, recuerda que no hay prisa 😉. 100; 99; 98; 97; 96…',
      imagen: 'assets/images/contando.png'),
  ConteoR(
      title: 'Paso 3',
      descripcion:
          'En ocasiones, esta técnica suele aplicarse con algunas variantes. En el descenso numérico, puedes visualizar las siluetas de cada número o las formas de estos 😄.',
      imagen: 'assets/images/numeros.png'),
];

class RelajacionV {
  String title;
  String descripcion;
  String imagen;

  RelajacionV({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<RelajacionV> relajacionvList = [
  RelajacionV(
      title: 'Descripcion',
      descripcion:
          'El método de la relajación con visualización 👀 consiste en evocar y visualizar momentos 🏖️ y emociones positivas 😊 antes de ir a dormir 😴, nuestro objetivo es focalizarnos en aquello que nos transmite paz 🙏.',
      imagen: 'assets/images/cerebro.png'),
  RelajacionV(
      title: 'Paso 1',
      descripcion:
          'Acuestate sobre tu cama 🛌 o en un lugar en el que te sientas relajado.',
      imagen: 'assets/images/dormido.png'),
  RelajacionV(
      title: 'Paso 2',
      descripcion:
          'Con los ojos cerrados 💆‍♀️, debes de visualizar momentos que te aporten tranquilidad 😌, !no olvides realizar una correcta respiracion¡ Inhala y exhala profundamente 👃.',
      imagen: 'assets/images/calma.png'),
  RelajacionV(
      title: 'Paso 3',
      descripcion:
          'Debes concebir escenas 🏊‍♀️, lugares 🏕️ o emociones 😄 que te induzcan a la calma 😌. Lo importante es visualizar 👀 al máximo cada detalle. ¿Qué olor te transmite 👃? ¿Qué escuchas 👂? Puedes probar con la posibilidad de incorporar música 🎵 o cualquier sonido de fondo ya que este elemento externo puede ayudarte a realizar mejor esta técnica 👍.',
      imagen: 'assets/images/rio.png'),
];

class RelajacionP {
  String title;
  String descripcion;
  String imagen;

  RelajacionP({
    required this.title,
    required this.descripcion,
    required this.imagen,
  });
}

List<RelajacionP> relajacionpList = [
  RelajacionP(
      title: 'Descripcion',
      descripcion:
          'La relajación muscular progresiva se basa en el reconocimiento 🤔 de qué músculos están tensos 💪🦵, hiperactivados, e incidir sobre ellos para destensarlos. Se le llama progresiva porque, poco a poco, se van relajando los distintos grupos musculares, aunque de entrada no seamos conscientes de la tensión que acumulan.',
      imagen: 'assets/images/musculo.png'),
  RelajacionP(
      title: 'Paso 1 Fase de tensión-relajación:',
      descripcion:
          'Consiste en tensionar y relajar diferentes músculos 🦵💪, sosteniendo unos 10-15 segundos tanto la tensión como la relajación. En este ejemplo nos centraremos en cuatro grupos musculares: El primero es el Rostro ✔️Frente: frunce el ceño fuertemente y, luego, relajalo lentamente. ✔️Ojos: cierra los ojos 😑, apretandolos y notando la tensión en los párpados y, luego, aflojalos. ✔️Labios y mandíbula: aprieta tus labios y dientes para luego relajar, dejando la boca entreabierta, separando los dientes 👄 y dejando la lengua floja 👅.',
      imagen: 'assets/images/cara-sonriente.png'),
  RelajacionP(
      title: 'Paso 2 Cuello:',
      descripcion:
          'Cuello: baja la cabeza hacia el pecho, notando la tensión en la parte posterior del cuello. Relaja tu cabeza volviendola a la posición inicial y alineada con la columna 🙎‍♂️.',
      imagen: 'assets/images/cuello.png'),
  RelajacionP(
      title: 'Paso 3 Hombros:',
      descripcion:
          'Inclina ligeramente la espalda hacia adelante llevando los codos hacia atrás, notando la tensión en la espalda, despues destensa retornando la espalda a su posición original y reposa tus brazos en tus piernas 🦵.',
      imagen: 'assets/images/hombre.png'),
  RelajacionP(
      title: 'Paso 4 Brazos y manos:',
      descripcion:
          'Con los brazos en reposo sobre las piernas, aprieta los puños 🤜, sintiendo con esto la tensión en brazos, antebrazos y manos. Para destensar, abre los puños y reposa 🤚 los dedos en las piernas 🦵.',
      imagen: 'assets/images/manos.png'),
  RelajacionP(
      title: 'Paso 5 Abdomen :',
      descripcion:
          'Tensa los músculos abdominales, “metiendo barriga” y luego, relajalos 😀.',
      imagen: 'assets/images/abdominoplastia.png'),
  RelajacionP(
      title: 'Paso 6 Piernas 🦵🦵:',
      descripcion:
          'Estira una pierna levantando el pie 🦶 y llevándola hacia arriba 👆 coloca tus dedos en posicion hacia atrás despues relaja lentamente, volviendo los dedos hacia adelante y bajando la pierna hasta reposar la planta del pie en el suelo. Repite esto con la otra pierna 😁.',
      imagen: 'assets/images/pierna.png'),
  RelajacionP(
      title: 'Paso 7 repaso mental 🧠:',
      descripcion:
          'Consiste en repasar mentalmente todos los grupos musculares (rostro, cuello, abdomen, piernas y brazos) y comprobar si realmente están relajados, en caso de que sientas que aun falta relajarlos puedes volver a realizar los ejercicios 😉.',
      imagen: 'assets/images/mente-humana.png'),
  RelajacionP(
      title: 'Paso 8 Relajacion mental 😌🧠:',
      descripcion:
          'Consiste en focalizar la atención 👀 en el estado de calma. Puede ser de ayuda visualizar una escena agradable que pueda evocar diferentes sensaciones. Un buen ejemplo es visualizarse acostado en una playa 🏖️ y evocar los colores 🌈, el sonido de las olas 🌊, el tacto de la arena 🤚, el olor a mar 👃, el calor del sol 🌞, la brisa en la piel 💧.',
      imagen: 'assets/images/mente.png'),
];
