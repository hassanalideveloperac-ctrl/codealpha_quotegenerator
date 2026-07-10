import '../models/quote.dart';

class QuotesData {
  static final List<Quote> _allQuotes = [
    Quote(
      id: '1',
      text: 'The only way to do great work is to love what you do.',
      author: 'Steve Jobs',
    ),
    Quote(
      id: '2',
      text: 'Innovation distinguishes between a leader and a follower.',
      author: 'Steve Jobs',
    ),
    Quote(
      id: '3',
      text: 'Your time is limited, so don\'t waste it living someone else\'s life.',
      author: 'Steve Jobs',
    ),
    Quote(
      id: '4',
      text: 'The purpose of life is a life of purpose.',
      author: 'Robert Byrne',
    ),
    Quote(
      id: '5',
      text: 'Life is what happens when you\'re busy making other plans.',
      author: 'John Lennon',
    ),
    Quote(
      id: '6',
      text: 'Get busy living or get busy dying.',
      author: 'Stephen King',
    ),
    Quote(
      id: '7',
      text: 'The only impossible journey is the one you never begin.',
      author: 'Tony Robbins',
    ),
    Quote(
      id: '8',
      text: 'It does not matter how slowly you go as long as you do not stop.',
      author: 'Confucius',
    ),
    Quote(
      id: '9',
      text: 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      author: 'Winston Churchill',
    ),
    Quote(
      id: '10',
      text: 'Believe you can and you\'re halfway there.',
      author: 'Theodore Roosevelt',
    ),
    Quote(
      id: '11',
      text: 'The future belongs to those who believe in the beauty of their dreams.',
      author: 'Eleanor Roosevelt',
    ),
    Quote(
      id: '12',
      text: 'In the middle of difficulty lies opportunity.',
      author: 'Albert Einstein',
    ),
    Quote(
      id: '13',
      text: 'The only thing we have to fear is fear itself.',
      author: 'Franklin D. Roosevelt',
    ),
    Quote(
      id: '14',
      text: 'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.',
      author: 'Ralph Waldo Emerson',
    ),
    Quote(
      id: '15',
      text: 'Life is really simple, but we insist on making it complicated.',
      author: 'Confucius',
    ),
    Quote(
      id: '16',
      text: 'The best way to predict the future is to create it.',
      author: 'Peter Drucker',
    ),
    Quote(
      id: '17',
      text: 'It always seems impossible until it\'s done.',
      author: 'Nelson Mandela',
    ),
    Quote(
      id: '18',
      text: 'The only limit to our realization of tomorrow will be our doubts of today.',
      author: 'Franklin D. Roosevelt',
    ),
    Quote(
      id: '19',
      text: 'Strive not to be a success, but rather to be of value.',
      author: 'Albert Einstein',
    ),
    Quote(
      id: '20',
      text: 'The journey of a thousand miles begins with one step.',
      author: 'Lao Tzu',
    ),
    Quote(
      id: '21',
      text: 'Happiness is not something ready made. It comes from your own actions.',
      author: 'Dalai Lama',
    ),
    Quote(
      id: '22',
      text: 'The secret of getting ahead is getting started.',
      author: 'Mark Twain',
    ),
    Quote(
      id: '23',
      text: 'Don\'t watch the clock; do what it does. Keep going.',
      author: 'Sam Levenson',
    ),
    Quote(
      id: '24',
      text: 'The only person you are destined to become is the person you decide to be.',
      author: 'Ralph Waldo Emerson',
    ),
    Quote(
      id: '25',
      text: 'Do what you can, with what you have, where you are.',
      author: 'Theodore Roosevelt',
    ),
    Quote(
      id: '26',
      text: 'The best time to plant a tree was 20 years ago. The second best time is now.',
      author: 'Chinese Proverb',
    ),
    Quote(
      id: '27',
      text: 'It does not matter how slowly you go as long as you do not stop.',
      author: 'Confucius',
    ),
    Quote(
      id: '28',
      text: 'Our lives begin to end the day we become silent about things that matter.',
      author: 'Martin Luther King Jr.',
    ),
    Quote(
      id: '29',
      text: 'In three words I can sum up everything I\'ve learned about life: it goes on.',
      author: 'Robert Frost',
    ),
    Quote(
      id: '30',
      text: 'The only true wisdom is in knowing you know nothing.',
      author: 'Socrates',
    ),
  ];

  static List<Quote> get allQuotes => _allQuotes;

  static Quote getRandomQuote() {
    final randomIndex = DateTime.now().millisecondsSinceEpoch % _allQuotes.length;
    return _allQuotes[randomIndex];
  }

  static List<Quote> getRandomQuotes(int count) {
    final shuffled = List<Quote>.from(_allQuotes)..shuffle();
    return shuffled.take(count).toList();
  }

  static Quote getQuoteById(String id) {
    return _allQuotes.firstWhere((q) => q.id == id);
  }
}