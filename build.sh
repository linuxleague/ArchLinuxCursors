
# By default depends on "xcf2png" for GIMP to PNG export
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
declare XcfToPngConverter=xcf2png
declare XcfToPngConverterFlags=-o

# By default depends on "xcursorgen" for PNG to X11 cursor export
# Format: [size] [x_cordinate] [y_cordinate] [png_file] [refresh_rate]
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
declare PngToX11CursorConverter=xcursorgen

declare CursorsFolder=Cursors
declare CursorsConfigFolder=CursorsConfig
declare TemplateFolder=X11FolderTemplate
declare TempFodler=Temp

declare CursorPackageName=ArchLinuxCursors

mkdir $TempFodler
mkdir $CursorPackageName
#mkdir $CursorPackageNameSmall

# Generate Cursors x64 (not 64 bit:)
# ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~ ~~~~
cp -r $TemplateFolder/* $CursorPackageName/
for file in `ls $CursorsFolder/*.xcf`
do
    declare pngFile=$TempFodler/$(basename "$file").png
	$XcfToPngConverter $file $XcfToPngConverterFlags $pngFile
	
    echo "64 0 0 $pngFile 1000" > $TempFodler/CursorConfig
    $PngToX11CursorConverter $TempFodler/CursorConfig $pngFile.x11cursor
done

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

