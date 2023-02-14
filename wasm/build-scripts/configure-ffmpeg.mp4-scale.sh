#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all
  --enable-gpl            # required by x264
  --enable-libx264        # enable x264
  --enable-zlib           # required by png

  --enable-version3
  #--enable-nonfree
  #--enable-libfdk-aac

  --enable-avcodec
  --enable-avformat
  --enable-avfilter
  --enable-swresample
  --enable-swscale
  --enable-decoder='h264,png,aac'
  --enable-encoder='rawvideo,libx264,png'
  --enable-parser='h264,aac'
  --enable-protocol='file,pipe'
  --enable-demuxer='mov,image_png_pipe,aac'
  --enable-muxer='rawvideo,mp4,adts'
  #--enable-filter=scale,format
  --enable-small
  --enable-filter='scale,format,overlay,split,trim,null'
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
