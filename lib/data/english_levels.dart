import 'package:flutter/material.dart';
import '../models/english_models.dart';

/// Lista global de niveles disponibles.
/// 👉 Para agregar una nueva clase SOLO añade otro EnglishLevel() aquí.
const List<EnglishLevel> englishLevels = [
  EnglishLevel(
    id: 'body',
    title: 'Class 1: Body Parts',
    subtitle: 'Las partes del cuerpo',
    icon: Icons.accessibility_new,
    color: Colors.teal,
    questions: [
      EnglishQuestion(
        question: 'Como se dice ojos en ingles',
        options: ['Ears', 'Eyes', 'Nose', 'Mouth'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: 'Como se dice oidos en ingles',
        options: ['Eyes', 'Nose', 'Ears', 'Hands'],
        correctIndex: 2,
      ),
      EnglishQuestion(
        question: 'Como se dice dedos del pie en ingles',
        options: ['Eyes', 'Nose', 'Toes', 'Hands'],
        correctIndex: 2,
      ),
      EnglishQuestion(
        question: 'Como se dice nariz en ingles',
        options: ['Eyes', 'Nose', 'Ears', 'Hands'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: 'Como se dice cabeza en ingles',
        options: ['Eyes', 'Nose', 'Ears', 'Head'],
        correctIndex: 3,
      ),
      // ... 3 preguntas más
    ],
  ),

  //clase 2 Hello! My Name Is
  EnglishLevel(
    id: 'names',
    title: 'Class 2: What is your name',
    subtitle: 'Cual es tu nombre',
    icon: Icons.pets,
    color: Colors.orange,
    questions: [
      EnglishQuestion(
        question: 'Como se dice: cual es tu nombre?',
        options: [
          'What is this?',
          'How old are you?',
          'How are you?',
          'What is your name?'
        ],
        correctIndex: 3,
      ),
      EnglishQuestion(
        question: 'Como se dice: como estas?',
        options: [
          'What is this?',
          'How old are you?',
          'How are you?',
          'What is your name?'
        ],
        correctIndex: 2,
      ),
      EnglishQuestion(
        question: 'Como se dice: deletrea tu nombre en ingles?',
        options: [
          'Spell your name',
          'How are you?',
          'What is your name?',
          'How old are you?'
        ],
        correctIndex: 0,
      ),
      EnglishQuestion(
        question: 'Como se dice estoy bien en Ingles',
        options: ['I am Happy', 'I am good', 'I am sad', 'I am sleepy'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: 'Como se dice buenas tardes en ingles',
        options: [
          'good mornig',
          'good nigth',
          'good evening',
          'good afternoon'
        ],
        correctIndex: 3,
      ),
    ],
  ),

//clase 3 Numbers & My Age
  EnglishLevel(
    id: 'numbers',
    title: 'Class 3: Numbers & My Age',
    subtitle: 'Los números y mi Edad',
    icon: Icons.numbers,
    color: Colors.blue,
    questions: [
      EnglishQuestion(
        question: 'Como se escribe 3 en ingles?',
        options: ['Two', 'Three', 'Four', 'Five'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: 'Como escribes 7',
        options: ['Seven', 'Six', 'Nine', 'One'],
        correctIndex: 0,
      ),
      EnglishQuestion(
        question: 'cuanto es 2 + 2 = ?',
        options: ['Three', 'Five', 'Four', 'Six'],
        correctIndex: 2,
      ),
      EnglishQuestion(
        question: 'Como escribes el 10?',
        options: ['Eight', 'Nine', 'Twelve', 'Ten'],
        correctIndex: 3,
      ),
      EnglishQuestion(
        question: 'Como preguntas que edad tienes?',
        options: [
          'What is this?',
          'How old are you?',
          'How are you?',
          'What is your name?'
        ],
        correctIndex: 1,
      ),
    ],
  ),

//clase 4 Colors & My Things
  EnglishLevel(
    id: 'colors',
    title: 'Class 4: Colors',
    subtitle: 'Los colores en inglés',
    icon: Icons.palette,
    color: Colors.pink,
    questions: [
      EnglishQuestion(
        question: '¿Cómo se escribe "rojo" en inglés?',
        options: ['Blue', 'Red', 'Green', 'Yellow'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: '¿Cómo se escribe "azul" en inglés?',
        options: ['Green', 'Black', 'Blue', 'White'],
        correctIndex: 2,
      ),
      EnglishQuestion(
        question: '¿De qué color es el cielo en un día soleado?',
        options: ['Red', 'Blue', 'Green', 'Yellow'],
        correctIndex: 1,
      ),
      EnglishQuestion(
        question: '¿Cómo se escribe "verde" en inglés?',
        options: ['Green', 'Gray', 'Brown', 'Pink'],
        correctIndex: 0,
      ),
      EnglishQuestion(
        question: '¿Cómo se escribe "amarillo" en inglés?',
        options: ['Purple', 'Orange', 'Yellow', 'White'],
        correctIndex: 2,
      ),
    ],
  ),

  // 👇 AÑADE AQUÍ MÁS CLASES SIN TOCAR NADA MÁS:
  // EnglishLevel(
  //   id: 'body',
  //   title: 'Body Parts',
  //   subtitle: 'Las partes del cuerpo',
  //   icon: Icons.accessibility,
  //   color: Colors.teal,
  //   questions: [ ... 5 preguntas ... ],
  // ),
];
