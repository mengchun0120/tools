if [ $# -ne 1 ]; then
    echo "Usage $0 playlist-url output_dir"
    exit 1
fi
url=$1
output_dir=$2

mkdir -p "$output_dir"

cd "$output_dir"
./yt-dlp -t mp4 "$url"
