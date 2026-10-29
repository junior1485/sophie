import 'package:flutter/material.dart';
import '../models/picture_game_models.dart';

const List<PictureEntry> pictureBank = [
  // ── BODY ──
  /********************************************
Los nombres deben coincidir con PictureLevel
*******************************************/
  PictureEntry(
    fileName: 'cabeza.webp',
    assetPath: 'recursos/body/cabeza.webp',
    question: 'What is this?',
    options: ['Hand', 'Head', 'Foot', 'Eye'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'boca.webp',
    assetPath: 'recursos/body/boca.webp',
    question: 'What is this?',
    options: ['Foot', 'Mouth', 'Nose', 'Head'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'ojos.webp',
    assetPath: 'recursos/body/ojos.webp',
    question: 'What is this?',
    options: ['Eye', 'Nose', 'Ear', 'Mouth'],
    correctIndex: 0,
  ),
  PictureEntry(
    fileName: 'nariz.webp',
    assetPath: 'recursos/body/nariz.webp',
    question: 'What is this?',
    options: ['Eye', 'Mouth', 'Nose', 'Ear'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'orejas.webp',
    assetPath: 'recursos/body/oreja.webp',
    question: 'What is this?',
    options: ['Hand', 'Head', 'Ears', 'Arm'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'hombros.webp',
    assetPath: 'recursos/body/hombros.webp',
    question: 'What is this?',
    options: ['Hand', 'Head', 'Shoulders', 'Arm'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'rodillas.webp',
    assetPath: 'recursos/body/rodillas.webp',
    question: 'What is this?',
    options: ['Hand', 'Head', 'Arm', 'Knees'],
    correctIndex: 3,
  ),
  PictureEntry(
    fileName: 'dedos_pies.webp',
    assetPath: 'recursos/body/dedos_pies.webp',
    question: 'What is this?',
    options: ['Toes', 'Head', 'Shoulders', 'Arm'],
    correctIndex: 0,
  ),

  // ── COLORS ──
  PictureEntry(
    fileName: 'red.webp',
    assetPath: 'recursos/colors/red.webp',
    question: 'What color is it?',
    options: ['Red', 'Blue', 'Green', 'Yellow'],
    correctIndex: 0,
  ),
  PictureEntry(
    fileName: 'blue.webp',
    assetPath: 'recursos/colors/blue.webp',
    question: 'What color is it?',
    options: ['Green', 'Blue', 'Red', 'Purple'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'green.webp',
    assetPath: 'recursos/colors/green.webp',
    question: 'What color is it?',
    options: ['Yellow', 'Brown', 'Green', 'Blue'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'yellow.webp',
    assetPath: 'recursos/colors/yellow.webp',
    question: 'What color is it?',
    options: ['Orange', 'White', 'Pink', 'Yellow'],
    correctIndex: 3,
  ),
  PictureEntry(
    fileName: 'black.webp',
    assetPath: 'recursos/colors/black.webp',
    question: 'What color is it?',
    options: ['White', 'Gray', 'Black', 'Brown'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'gray.webp',
    assetPath: 'recursos/colors/gray.webp',
    question: 'What color is it?',
    options: ['Gray', 'Black', 'White', 'Brown'],
    correctIndex: 0,
  ),
  PictureEntry(
    fileName: 'white.webp',
    assetPath: 'recursos/colors/white.webp',
    question: 'What color is it?',
    options: ['Gray', 'White', 'Pink', 'Yellow'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'brown.webp',
    assetPath: 'recursos/colors/brown.webp',
    question: 'What color is it?',
    options: ['Orange', 'Red', 'Brown', 'Black'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'orange.webp',
    assetPath: 'recursos/colors/orange.webp',
    question: 'What color is it?',
    options: ['Orange', 'Red', 'Yellow', 'Pink'],
    correctIndex: 0,
  ),
  PictureEntry(
    fileName: 'pink.webp',
    assetPath: 'recursos/colors/pink.webp',
    question: 'What color is it?',
    options: ['Purple', 'Pink', 'Red', 'White'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'purple.webp',
    assetPath: 'recursos/colors/purple.webp',
    question: 'What color is it?',
    options: ['Blue', 'Pink', 'Purple', 'Gray'],
    correctIndex: 2,
  ),

  // ── FAMILY ──
  /*PictureEntry(
    fileName: 'mother.jpg',
    assetPath: 'family/mother.jpg',
    question: '¿Quién es esta persona?',
    options: ['Father', 'Mother', 'Sister', 'Aunt'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'father.jpg',
    assetPath: 'family/father.jpg',
    question: '¿Quién es esta persona?',
    options: ['Father', 'Brother', 'Uncle', 'Mother'],
    correctIndex: 0,
  ),
  PictureEntry(
    fileName: 'brother.jpg',
    assetPath: 'family/brother.jpg',
    question: '¿Quién es esta persona?',
    options: ['Sister', 'Brother', 'Father', 'Cousin'],
    correctIndex: 1,
  ),
  PictureEntry(
    fileName: 'sister.jpg',
    assetPath: 'family/sister.jpg',
    question: '¿Quién es esta persona?',
    options: ['Brother', 'Mother', 'Sister', 'Aunt'],
    correctIndex: 2,
  ),
  PictureEntry(
    fileName: 'grandmother.jpg',
    assetPath: 'family/grandmother.jpg',
    question: '¿Quién es esta persona?',
    options: ['Mother', 'Aunt', 'Grandmother', 'Sister'],
    correctIndex: 2,
  ),*/
];

/********************************************
Los nombres deben coincidir con PictureEntry
*******************************************/
const List<PictureLevel> pictureLevels = [
  PictureLevel(
    id: 'body',
    title: 'Body',
    subtitle: 'Las partes del cuerpo',
    icon: Icons.accessibility_new,
    color: Colors.teal,
    fileNames: [
      'cabeza.webp',
      'boca.webp',
      'ojos.webp',
      'nariz.webp',
      'orejas.webp',
      'hombros.webp',
      'rodillas.webp',
      'dedos_pies.webp',
    ],
  ),
  PictureLevel(
    id: 'colors',
    title: 'Colors',
    subtitle: 'Los colores con imágenes',
    icon: Icons.palette,
    color: Colors.pink,
    fileNames: [
      'red.webp',
      'blue.webp',
      'green.webp',
      'yellow.webp',
      'black.webp',
      'gray.webp',
      'white.webp',
      'brown.webp',
      'orange.webp',
      'pink.webp',
      'purple.webp',
    ],
  ),
  /*PictureLevel(
    id: 'family',
    title: 'Family',
    subtitle: 'La familia con imágenes',
    icon: Icons.family_restroom,
    color: Colors.green,
    fileNames: [
      'mother.jpg',
      'father.jpg',
      'brother.jpg',
      'sister.jpg',
      'grandmother.jpg',
    ],
  ),*/
];

/// Busca una entrada del banco por nombre de archivo.
PictureEntry? buscarEnBanco(String fileName) {
  try {
    return pictureBank.firstWhere((e) => e.fileName == fileName);
  } catch (_) {
    return null;
  }
}
