import 'package:flutter/material.dart';

import 'package:portofolio/core/constants/app_colors.dart';

/// Brand mark and optional wordmark for the portfolio.
class PortfolioLogo extends StatelessWidget {
  /// Creates the portfolio logo.
  const PortfolioLogo({super.key, this.showWordmark = false});

  final bool showWordmark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      label: 'Abdelrahman Khaled logo',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LogoMark(size: showWordmark ? 48 : 42),
          if (showWordmark) ...[
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdelrahman Khaled',
                  style: textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                Text(
                  'Flutter mobile developer',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.28;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1C2531), Color(0xFF131922)],
        ),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -4,
            top: -8,
            child: Transform.rotate(
              angle: -0.62,
              child: Container(
                width: size * 0.26,
                height: size * 1.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.accent.withValues(alpha: 0.28),
                      AppColors.secondary.withValues(alpha: 0.12),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(size),
                ),
              ),
            ),
          ),
          Positioned(
            right: size * 0.16,
            top: size * 0.16,
            child: Container(
              width: size * 0.12,
              height: size * 0.12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent,
              ),
            ),
          ),
          Center(
            child: Text(
              'AK',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: size * 0.34,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.6,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
