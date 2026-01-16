# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-16

### Added
- Initial release
- 14 pen types with realistic designs:
  - Pen (classic sharp tip)
  - Pencil (wooden with graphite)
  - PencilTip (mechanical style)
  - BallpointPen (metal tip with ball)
  - GelPen (smooth rounded tip)
  - DashedPen (for dashed lines)
  - Highlighter (transparent angled tip)
  - NeonHighlighter (glowing effect)
  - BrushPen (calligraphy brush)
  - Marker (flat tip)
  - FountainPen (classic nib)
  - Fineliner (technical pen)
  - Crayon (wax crayon)
  - RulerPen (with ruler marks for straight lines)
- `PenToolbar` widget with smooth selection animations
- `PenToolbarConfig` for full customization
- Size presets: small, medium, large
- `scale()` method for proportional sizing
- `copyWith()` for partial configuration updates
- Enable/disable individual pens
- Show/hide individual pens
- Optional tooltips
- Color stripe on pen body matching pen color
- `displayName` getter for pen type names (Turkish)
- Standalone `PenItem` widget
- Standalone `PenPainter` for custom implementations