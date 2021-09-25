#!/bin/bash

# Script used to analyze bundled assets and generate a dart file which contains
# the relevant metadata needed at runtime without forcing the application to
# download the assets.
#
# Usage:
# ./tool/generate_asset_metadata.sh > lib/screen/sub_category/mid_autumn/view/photo_editor/models/assets.g.dart

set -e

output_metadata () {
    width=$(sips -g pixelWidth $1 | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $1 | tail -n1 | cut -d" " -f4)
    filepath=$1
    name=$(basename "${filepath%.*}")

    echo "Asset(name: '$name', path: '$1', size: Size($width, $height));"
}

echo "// GENERATED CODE - DO NOT MODIFY BY HAND"
echo ""
echo "import 'package:flutter/widgets.dart';"
echo "import 'asset.dart';"
echo ""
echo "class Assets {"

sticker=images/mid_autumn/sticker/*.webp

echo "  static const sticker = ["
for prop in $sticker
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)
    name=$(basename "${prop%.*}")
    echo "    Asset(
                name: '$name',
                path: '$prop',
                size: Size($width, $height),
              ),"
done

echo "  ];"

boxTmpBg=images/mid_autumn/box_tmp_bg/*.webp

echo "  static const boxTmpbg = ["
for prop in $boxTmpBg
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)
    name=$(basename "${prop%.*}")
    echo "    Asset(
                name: '$name',
                path: '$prop',
                size: Size($width, $height),
              ),"
done

echo "  ];"

boxTmpX2=images/mid_autumn/box_tmp_x2/*.png

echo "  static const boxTmpX2 = ["
for prop in $boxTmpX2
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)
    name=$(basename "${prop%.*}")
    echo "    Asset(
                name: '$name',
                path: '$prop',
                size: Size($width, $height),
              ),"
done

echo "  ];"

boxTmpX4=images/mid_autumn/box_tmp_x4/*.png

echo "  static const boxTmpX4 = ["
for prop in $boxTmpX4
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)
    name=$(basename "${prop%.*}")
    echo "    Asset(
                name: '$name',
                path: '$prop',
                size: Size($width, $height),
              ),"
done

echo "  ];"

boxTmpX6=images/mid_autumn/box_tmp_x6/*.png

echo "  static const boxTmpX6 = ["
for prop in $boxTmpX6
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)
    name=$(basename "${prop%.*}")
    echo "    Asset(
                name: '$name',
                path: '$prop',
                size: Size($width, $height),
              ),"
done

echo "  ];"

echo "  static const props = [
          ...sticker,
          ...boxTmpX2,
          ...boxTmpX4,
          ...boxTmpX6,
        ];"
echo "}"