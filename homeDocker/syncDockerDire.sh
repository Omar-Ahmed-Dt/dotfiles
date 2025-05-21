cd ~/home_docker
for dir in */; do
    dir_name="${dir%/}"
    
    # Skip unwanted directories
    if [[ "$dir_name" == "invidious" || "$dir_name" == "SSL_Cert" ]]; then
        continue
    fi

    # Destination path
    dest_dir="/home/omar/Documents/GitHub/dotfiles/homeDocker/$dir_name"
    mkdir -p "$dest_dir"

    # Copy the docker-compose file if it exists
    if [ -f "$dir/docker-compose.yml" ]; then
        cp "$dir/docker-compose.yml" "$dest_dir/docker-compose.yml"
    elif [ -f "$dir/docker-compose.yaml" ]; then
        cp "$dir/docker-compose.yaml" "$dest_dir/docker-compose.yaml"
    fi
done
