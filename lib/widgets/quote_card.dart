import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import 'package:provider/provider.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback? onTap;

  const QuoteCard({
    super.key,
    required this.quote,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuoteProvider>(context, listen: false);
    final isFav = provider.isFavorite(quote);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 8,
        shadowColor: const Color(0xFF6C63FF).withOpacity(0.15),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF6C63FF).withOpacity(0.06),
                  const Color(0xFF8B7BF7).withOpacity(0.03),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.format_quote,
                        color: Color(0xFFFFD700),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        quote.text,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.7,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2D2D3F),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 30,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6C63FF), Color(0xFF8B7BF7)],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          quote.author,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          provider.toggleFavorite(quote);
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isFav
                                ? const Color(0xFFFF6584).withOpacity(0.12)
                                : Colors.grey.withOpacity(0.08),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isFav
                                  ? const Color(0xFFFF6584).withOpacity(0.3)
                                  : Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              key: ValueKey(isFav),
                              color: isFav ? const Color(0xFFFF6584) : Colors.grey.shade400,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}