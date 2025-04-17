#!/bin/bash

# Script to download OpenStreetMap (OSM) maps by state, country, or region
# Ensure you have wget and unzip installed before running this script

# Function to display usage
usage() {
    echo "Usage: $0 <region|country|state> <name>"
    echo "Example: $0 country Germany"
    exit 1
}

# Check if arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

TYPE=$1
NAME=$2
BASE_URL="https://download.geofabrik.de"

# Convert name to lowercase and replace spaces with dashes
NAME_LOWER=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Construct the download URL
case $TYPE in
    region)
        URL="$BASE_URL/$NAME_LOWER-latest.osm.pbf"
        ;;
    country)
        URL="$BASE_URL/$NAME_LOWER-latest.osm.pbf"
        ;;
    state)
        URL="$BASE_URL/$NAME_LOWER-latest.osm.pbf"
        ;;
    *)
        echo "Invalid type: $TYPE"
        usage
        ;;
esac

# Create a directory for downloaded maps
DOWNLOAD_DIR="osm-maps"
mkdir -p "$DOWNLOAD_DIR"

# Download the map
echo "Downloading OSM map for $NAME ($TYPE)..."
wget -O "$DOWNLOAD_DIR/$NAME_LOWER.osm.pbf" "$URL"

if [ $? -eq 0 ]; then
    echo "Download completed: $DOWNLOAD_DIR/$NAME_LOWER.osm.pbf"
else
    echo "Failed to download map. Please check the region/country/state name."
    exit 1
fi