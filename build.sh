#!/bin/sh

# Depends On
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
#   - "xcf2png" for GIMP to PNG export
#   - "convert" from "ImageMagick" to resize images
#   - "xcursorgen" for PNG to X11 cursor export ([size] [x_cordinate] [y_cordinate] [png_file] [refresh_rate])

declare GimpCursorsFolder=GimpCursors
declare TemplateFolder=X11FolderTemplate
declare TempFodler=Temp
declare CursorPackageName=ArchLinuxCursors

function GeneratePngFromGimpFiles() {
    local imageSize=$1
    local CursorPackageNameWithSuffix=$CursorPackageName$imageSize
    
    rm -r $TempFodler 2> /dev/null
    rm -r $CursorPackageNameWithSuffix 2> /dev/null
    
    mkdir $TempFodler
    mkdir $CursorPackageName

    cp -r $TemplateFolder/* $CursorPackageName/
    for file in `ls $GimpCursorsFolder/*.xcf`
    do
        declare pngFile=$TempFodler/$(basename "$file").png
        xcf2png $file -o $pngFile

        convert $pngFile -resize 32x32 $pngFile
    done
}

echo "64 5 5 $TempFodler/Pointer.xcf.png 1000"      > $TempFodler/CursorConfig
echo "32 2 2 $TempFodler/Pointer.xcf.png 1000"      > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/Pointer.xcf.png.x11cursor

echo "64 5 5 $TempFodler/PointerBusy.xcf.png 1000"  > $TempFodler/CursorConfig
echo "32 2 2 $TempFodler/PointerBusy.xcf.png 1000"  > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/PointerBusy.xcf.png.x11cursor

echo "64 32 32 $TempFodler/Busy.xcf.png 1000"       > $TempFodler/CursorConfig
echo "32 16 16 $TempFodler/Busy.xcf.png 1000"       > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/Busy.xcf.png.x11cursor

echo "64 32 32 $TempFodler/Move.xcf.png 1000"       > $TempFodler/CursorConfig
echo "32 16 16 $TempFodler/Move.xcf.png 1000"       > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/Move.xcf.png.x11cursor

echo "64 10 5 $TempFodler/Hand.xcf.png 1000"        > $TempFodler/CursorConfig
echo "32 5 2 $TempFodler/Hand.xcf.png 1000"        > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/Hand.xcf.png.x11cursor

echo "64 32 64 $TempFodler/Denier.xcf.png 1000"     > $TempFodler/CursorConfig
echo "32 16 32 $TempFodler/Denier.xcf.png 1000"     > $TempFodler/CursorConfig
xcursorgen $TempFodler/CursorConfig $TempFodler/Denier.xcf.png.x11cursor



###echo "32 0 0 $pngFile 1000" > $TempFodler/CursorConfig
###xcursorgen $TempFodler/CursorConfig $pngFile.x11cursor


# Supported: Busy Denier Hand Move PointerBusy Pointer
# Make to be like this https://tronche.com/gui/x/xlib/appendix/b/
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/X_cursor
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/XC_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/center_ptr
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/left_ptr
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/right_ptr
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/top_left_arrow

cp $TempFodler/PointerBusy.xcf.png.x11cursor $CursorPackageName/cursors/left_ptr_watch

cp $TempFodler/Busy.xcf.png.x11cursor $CursorPackageName/cursors/watch


cp $TempFodler/Move.xcf.png.x11cursor $CursorPackageName/cursors/fleur

cp $TempFodler/Hand.xcf.png.x11cursor $CursorPackageName/cursors/hand1
cp $TempFodler/Hand.xcf.png.x11cursor $CursorPackageName/cursors/hand2


# Fill-in the missing cursors
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/sb_v_double_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/sb_h_double_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/sb_h_double_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/h_double_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/v_double_arrow
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/copy
cp $TempFodler/Pointer.xcf.png.x11cursor $CursorPackageName/cursors/link
cp $TempFodler/Hand.xcf.png.x11cursor    $CursorPackageName/cursors/hand


# Add full X11 compatibility
ln -s $CursorPackageName/cursors/sb_v_double_arrow $CursorPackageName/cursors/00008160000006810000408080010102
ln -s $CursorPackageName/cursors/sb_h_double_arrow $CursorPackageName/cursors/028006030e0e7ebffc7f7070c0600140
ln -s $CursorPackageName/cursors/crossed_circle    $CursorPackageName/cursors/03b6e0fcb3499374a867c041f52298f0
ln -s $CursorPackageName/cursors/left_ptr_watch    $CursorPackageName/cursors/08e8e1c95fe2fc01f976f1e063a24ccd
ln -s $CursorPackageName/cursors/h_double_arrow    $CursorPackageName/cursors/14fef782d02440884392942c11205230
ln -s $CursorPackageName/cursors/v_double_arrow    $CursorPackageName/cursors/2870a09082c103050810ffdffffe0204
ln -s $CursorPackageName/cursors/left_ptr_watch    $CursorPackageName/cursors/3ecb610c1bf2410f44200f48c40d3599
ln -s $CursorPackageName/cursors/fleur             $CursorPackageName/cursors/4498f0e0c1937ffe01fd06f973665830
ln -s $CursorPackageName/cursors/copy              $CursorPackageName/cursors/6407b0e94181790501fd1e167b474872
ln -s $CursorPackageName/cursors/link              $CursorPackageName/cursors/640fb0e74195791501fd1ed57b41487f
ln -s $CursorPackageName/cursors/hand1             $CursorPackageName/cursors/9d800788f1b08800ae810202380a0822
#ln -s top_left_corner   c7088f0f3e6c8088236ef8e1e3e70000
ln -s $CursorPackageName/cursors/question_arrow    $CursorPackageName/cursors/d9ce0ab605698f320427677b458ad60b
ln -s $CursorPackageName/cursors/hand              $CursorPackageName/cursors/e29285e634086352946a0e7090d73106
#ln -s top_right_corner  fcf1c3c7cd4491d801f1e1c78f100000


