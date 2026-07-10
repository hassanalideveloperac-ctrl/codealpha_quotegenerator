import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../data/quotes_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class QuoteProvider extends ChangeNotifier {
  Quote? _currentQuote;
  bool _isLoading = false;
  List<Quote> _favorites = [];
  List<Quote> _recentQuotes = [];
  bool _showRecent = false;

  Quote? get currentQuote => _currentQuote;
  bool get isLoading => _isLoading;
  List<Quote> get favorites => _favorites;
  List<Quote> get recentQuotes => _recentQuotes;
  bool get showRecent => _showRecent;
  bool get hasFavorites => _favorites.isNotEmpty;

  QuoteProvider() {
    loadFavorites();
  }

  void toggleRecentView() {
    _showRecent = !_showRecent;
    notifyListeners();
  }

  void loadRandomQuote() {
    _isLoading = true;
    notifyListeners();

    _currentQuote = QuotesData.getRandomQuote();
    _addToRecent(_currentQuote!);

    _isLoading = false;
    notifyListeners();
  }

  void _addToRecent(Quote quote) {
    final exists = _recentQuotes.any((q) => q.id == quote.id);
    if (!exists) {
      _recentQuotes.insert(0, quote);
      if (_recentQuotes.length > 20) {
        _recentQuotes.removeLast();
      }
    }
  }

  void toggleFavorite(Quote quote) {
    final index = _favorites.indexWhere((q) => q.id == quote.id);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(quote.copyWith(isFavorite: true));
    }
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Quote quote) {
    return _favorites.any((q) => q.id == quote.id);
  }

  Future<void> saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final quotesJson = _favorites.map((q) => q.toJson()).toList();
      await prefs.setString('favorites', json.encode(quotesJson));
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favoritesJson = prefs.getString('favorites');
      if (favoritesJson != null) {
        final List<dynamic> decoded = json.decode(favoritesJson);
        _favorites = decoded.map((json) => Quote.fromJson(json)).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  void removeFromFavorites(Quote quote) {
    _favorites.removeWhere((q) => q.id == quote.id);
    saveFavorites();
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    saveFavorites();
    notifyListeners();
  }

  void refreshQuote() {
    loadRandomQuote();
  }
}