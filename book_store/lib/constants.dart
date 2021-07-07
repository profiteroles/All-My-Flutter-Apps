import 'package:book_store/models/book.dart';
import 'package:flutter/material.dart';

List<Book> kPurchasedBooks = [];
Color kBtnColor = Colors.blue.shade900.withOpacity(0.5);
const kPath = 'images/books/';
const kUnsolvedStory = 'Discover the stories behind some of the most infamous unsolved murders of the last century, including the Black Dahlia, the Zodiac Killer and the JonBenét Ramsey case.';
const kAliceStory =
    'Lose yourself in Alice\'s story. Tumble down the rabbit-hole and meet some very curious creatures in the topsy-turvy world of Wonderland. Follow the White Rabbit through the magical forest and stop on your journey for a quick game of croquet with the Queen of Hearts. Be wary of a peculiar caterpillar and a disappearing feline along the way. And above all, always remember to believe in impossible things.';
const kLittleLoveStory = "In A Little Love Story, Roland Merullo—winner of the Massachusetts Book Award and the Maria Thomas Fiction Award—has created a sometimes poignant, sometimes hilarious tale of attraction and loyalty, jealousy and grief. It is a classic love story—with some modern twists.";
const kHeresyStory =
    "A country awash with paranoia and conspiracy - but a safe haven for a radical monk on the run. Giordano Bruno, with his theories of astronomy and extraterrestrial life, has fled the Inquisition for the court of Elizabeth I. Here, he attracts the attention of Francis Walsingham, chief spymaster and sworn enemy of Catholic plotters.";
const kNeverendingStory =
    "When Bastian happens upon an old book called The Neverending Story, he's swept into the magical world of Fantastica--so much that he finds he has actually become a character in the story! And when he realizes that this mysteriously enchanted world is in great danger, he also discovers that he is the one chosen to save it. Can Bastian overcome the barrier between reality and his imagination in order to save Fantastica?";
const kJackRipperStory =
    "Horrific, horrendous, unspeakable, The Whitechapel Murderer, Jack the Ripper, stalked the streets of East London in 1888, slaughtering prostitutes and bewildering the police who were hunting him. They never succeeded in apprehending him, and to this day the mystery of his identity remains an enigma.";
const kTolkienStory = "The vivid color pictures illustrate their fantastic imagination... in bringing to life the characters and locations of Tolkien's Middle-earth. It is fascinating to see.\" - The Library Journal\"A book to be admired and pored over by dreamers of all ages.";

List<Book> kFantasyBooks = [
  Book(title: 'Alice in Wonderland', genre: 'Fantasy', price: 5.99, author: 'Lewis Carroll', imageFile: 'alice_in_wonderland.jpeg', description: kAliceStory),
  Book(title: 'Heresy', genre: 'Fantasy', price: 6.80, author: 'S J Parris', imageFile: 'heresy.jpeg', description: kHeresyStory),
  Book(title: 'The Neverending Story', genre: 'Fantasy', price: 7.99, author: 'Michael Ende', imageFile: 'the_neverending_story.jpeg', description: kNeverendingStory),
  Book(title: 'The Tolkien Years', genre: 'Fantasy', price: 22.90, author: 'Greg Hildebrandt', imageFile: 'tolkien_years.jpeg', description: kTolkienStory),
];

List<Book> kCrimeBooks = [
  Book(title: 'Unsolved murders', genre: 'Crime', price: 10.99, author: 'Amber Hunt', imageFile: 'unsolved_murders.jpeg', description: kUnsolvedStory),
  Book(title: 'Jack the Ripper', genre: 'Crime', price: 16.00, author: 'Philip Sugden', imageFile: 'jack_the_ripper.jpeg', description: kJackRipperStory),
];
List<Book> kRomancePBooks = [
  Book(title: 'A Little Love Story', genre: 'Romance', price: 2.40, author: 'Roland Merullo', imageFile: 'a_little_love_story.jpeg', description: kLittleLoveStory),
];

BoxDecoration bgGradient() => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.mirror,
        stops: [0.0, 0.4, 0.6, 1],
        colors: [
          Colors.blueGrey.shade800,
          Colors.blueGrey.shade700,
          Colors.blueGrey.shade700,
          Colors.blueGrey.shade800,
        ],
      ),
    );
