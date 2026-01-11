wallpaperDir="/home/shared/wallpapers";
targetLink="/home/shared/wallpaper_special.png";

# Check if the wallpapers directory exists
if [ ! -d "${wallpaperDir}" ]; then
    exit 1
fi

# Get list of image files
images=($(find ${wallpaperDir} -type f -name "*.jpg" -o -name "*.jpeg" -o -name "*.png"))

# Check if any images were found
if [ ${#images[@]} -eq 0 ]; then
    exit 1
fi

size=${#images[@]}
index=$(($RANDOM % $size))
image=${images[$index]}

# Remove existing symlink if it exists
if [ -L "${targetLink}" ]; then
    rm "${targetLink}"
fi

# Create new symlink
ln -s "${image}" "${targetLink}"
