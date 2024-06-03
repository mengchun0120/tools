import glob
import subprocess
import sys
import os
import re

def main():
    if len(sys.argv) != 3:
        print(f"Usage: python {sys.argv[0]} source_dir dest_dir")
        exit(1)

    source_dir = sys.argv[1]
    dest_dir = sys.argv[2]

    if not os.path.isdir(dest_dir):
        os.makedirs(dest_dir)

    for name in glob.glob(f"{source_dir}/*.mp4"):
        print(f"Processing {name}")
        file_name = os.path.basename(name)
        new_name = os.path.join(dest_dir, re.sub(r"mp4$", "m4a", file_name))
        subprocess.call(
            ["ffmpeg", "-i", name, "-vn", "-c:a", "aac", new_name]
        )



if __name__ == "__main__":
    main()

