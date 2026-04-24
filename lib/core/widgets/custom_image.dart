import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    final isNetwork = path.startsWith('http://') || path.startsWith('https://');
    final cleanPath = path.split('?').first;
    final isSvg = cleanPath.toLowerCase().endsWith('.svg');

    print(isNetwork);
    print(isSvg);

    if (isNetwork) {
      imageWidget = CachedNetworkImage(
        imageUrl: path,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
        placeholder: (context, url) => placeholder ?? const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (context, url, error) =>
            errorWidget ?? const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
      );
    } else {
      if (isSvg) {
        imageWidget = SvgPicture.asset(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      } else {
        imageWidget = Image.asset(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ?? const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
        );
      }
    }

    if (shape == BoxShape.circle) {
      return ClipOval(child: imageWidget);
    } else if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
