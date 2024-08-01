#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/home/saikumar/source"
DEST_DIR="/opt/tomcat/webapps/destination"

# Check if source directory exists

function warDeploy(){
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Create destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Loop through all .war files in the source directory
for file in "$SOURCE_DIR"/*.war; do
    # Check if the file exists to avoid errors if no .war files are found
    if [ -e "$file" ]; then
        cp "$file" "$DEST_DIR"
        echo "Copied $file to $DEST_DIR"
    else
        echo "No .war files found in $SOURCE_DIR."
        break
    fi
done
echo "All .war files have been copied from $SOURCE_DIR to $DEST_DIR."
}
function zipDeploy(){
# Loop through all .zip files in the source directory
for file in "$SOURCE_DIR"/*.zip; do
    # Check if the file exists to avoid errors if no .zip files are found
    if [ -e "$file" ]; then
        cp "$file" "$DEST_DIR"
        echo "Copied $file to $DEST_DIR"
    else
        echo "No .zip files found in $SOURCE_DIR."
        break
    fi
done

echo "All .zip files have been copied from $SOURCE_DIR to $DEST_DIR."

}

function unzipdestination(){
#!/bin/bash

# Define the directory containing the zip files
ZIP_DIR="/opt/tomcat/webapps/destination"

# Check if the directory exists
if [ ! -d "$ZIP_DIR" ]; then
    echo "Directory $ZIP_DIR does not exist."
    exit 1
fi

# Change to the directory
cd "$ZIP_DIR" || exit

for zip_file in *.zip; do
    # Check if there are any .zip files
    if [ -e "$zip_file" ]; then
        # Unzip the file
        unzip "$zip_file"
        # Check if unzip was successful
        if [ $? -eq 0 ]; then
            echo "Unzipped $zip_file successfully."
            # Remove the zip file
            rm "$zip_file"
            echo "Removed $zip_file."
        else
            echo "Failed to unzip $zip_file."
        fi
    else
        echo "No .zip files found in $ZIP_DIR."
        break
    fi
done

echo "All .zip files have been processed."

}

warDeploy

zipDeploy

unzipdestination


