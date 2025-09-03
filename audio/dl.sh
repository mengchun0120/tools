if [ $# -ne 1 ]; then
    echo "Usage: $0 url"
fi

./yt-dlp -t mp4 $1
