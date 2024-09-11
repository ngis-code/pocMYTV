#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BUILD_DIR="docker_image_builds"
GITHUB_REPO="https://github.com/ngis-code/pocMYTV"

# Initializations
export DOCKER_DEFAULT_PLATFORM=linux/amd64

showSuccess() {
    echo -e "${GREEN}$1${NC}"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        osascript -e 'beep 1'
    fi
}

error_exit() {
    echo -e "${RED}$1${NC}" 1>&2
    if [[ "$OSTYPE" == "darwin"* ]]; then
        osascript -e 'beep 2'
    fi
    exit 1
}

error_continue() {
    echo -e "${RED}$1${NC}" 1>&2
    if [[ "$OSTYPE" == "darwin"* ]]; then
        osascript -e 'beep 2'
    fi
}

print_help(){
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  help, -h, --help    Display this help message"
    echo "  clean               Perform a docker clean and removes the $BUILD_DIR directory"
    echo "  save                Save the images to the $BUILD_DIR directory"
    echo "  load                Load the images from the $BUILD_DIR directory"
    echo "  build               Pulls and builds the docker image"
    echo "  download            Downloads the latest release from Github"
}

# Use it choose a single option
function choose_single_menu() {
    local prompt="$1" outvar="$2"
    shift
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e") 
    printf "$prompt\n"
    while true
    do
        index=0 
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\e[7m$o\e[0m" 
            else echo "  $o"
            fi
            (( index++ ))
        done
        read -s -n3 key 
        if [[ $key == $esc[A ]] 
        then (( cur-- )); (( cur < 0 )) && (( cur = 0 ))
        elif [[ $key == $esc[B ]] 
        then (( cur++ )); (( cur >= count )) && (( cur = count - 1 ))
        elif [[ $key == "" ]] 
        then break
        fi
        echo -en "\e[${count}A" 
    done
    printf -v $outvar "${options[$cur]}"
}

function choose_multiple_menu() {
    local prompt="$1"
    local outvar="$2"
    shift
    shift
    local options=("$@")
    local cur=0
    local count=${#options[@]}
    local index=0
    local esc=$(printf '\033')
    local selected=("${options[@]}")
    # local selected=()

    printf "$prompt\n"

    while true; do
        index=0
        for o in "${options[@]}"; do
            if [ "$index" == "$cur" ]; then
                if [[ " ${selected[@]} " =~ " ${options[$cur]} " ]]; then
                    # echo -e " >\e[7m\e[32m$o\e[0m"
                    echo -e " >${GREEN}*$o${NC}"
                else
                    # echo -e " >\e[7m$o\e[0m"
                    echo -e " > ${NC}$o${NC}"
                fi
            else
                if [[ " ${selected[@]} " =~ " ${options[$index]} " ]]; then
                    # echo -e " *\e[32m$o\e[0m"
                    echo -e "  *${GREEN}$o${NC}"
                else
                    echo "   $o"
                fi
            fi
            (( index++ ))
        done

        read -rsn1 key
        case "$key" in
            $esc)
                read -rsn2 key
                if [[ "$key" == "[A" ]]; then
                    (( cur-- ))
                    (( cur < 0 )) && (( cur = 0 ))
                elif [[ "$key" == "[B" ]]; then
                    (( cur++ ))
                    (( cur >= count )) && (( cur = count - 1 ))
                elif [[ "$key" == "[C" ]]; then
                    if [[ " ${selected[@]} " =~ " ${options[$cur]} " ]]; then
                        selected=("${selected[@]/${options[$cur]}/}")
                    else
                        selected+=("${options[$cur]}")
                    fi
                fi
                ;;
            "")
                break
                ;;
        esac

        printf "\033c"
        printf "$prompt\n"
    done

    local selected_string
    selected_string=$(printf "%s " "${selected[@]}")
    printf -v "$outvar" "%s" "$selected_string"
}

build_images(){
    options=(
        "Build PocMYTV"
    )

    choose_multiple_menu "Please select the images to build (use arrow keys to navigate and right arrow to select):" selected_images "${options[@]}"

    if [[ " ${selected_images[@]} " =~ " Build PocMYTV " ]]; then        
        flutter pub get
        flutter build web --web-renderer html --release --base-href / 

        docker build -t televolution_frontend_lite:0.0.1 .
        docker run -d --restart=always -p 8001:8001 --name televolution_frontend_lite televolution_frontend_lite:0.0.1
    fi
}

save_images(){
    if [ ! -d "$BUILD_DIR" ]; then
        mkdir "$BUILD_DIR" || error_exit "Failed to create directory $BUILD_DIR."
    fi

    cd "$BUILD_DIR" || error_exit "Directory $BUILD_DIR does not exist."

    options=(
        "televolution_frontend_lite:0.0.1"
    )

    choose_multiple_menu "Please select the Docker images to save (use arrow keys to navigate and right arrow to select):" selected_images "${options[@]}"

    for image in $selected_images; do
        image_name=$(echo "$image" | cut -d':' -f1)
        image_name=$(echo "$image_name" | awk -F'/' '{print $NF}')
        echo "Saving Image $image as ${image_name}.tar ..."
        docker save -o "${image_name}.tar" "$image" || { error_continue "Cannot save $image."; continue; }
    done
    
    showSuccess "All Images saved successfully."
    cd ..
}

load_images(){
    cd "$BUILD_DIR" || error_exit "Directory $BUILD_DIR does not exist."
    options=(
        "televolution_frontend_lite"
    )
    choose_multiple_menu "Please select the Docker images to load (use arrow keys to navigate and right arrow to select):" selected_images "${options[@]}"

    for image in $selected_images; do
        echo "Loading Image $image..."
        docker load -i "${image}.tar" || { error_continue "Cannot load $image."; continue; }
    done

    cd ..

    echo "Running Frontend..."
    docker run -d --restart=always -p 8001:8001 --name televolution_frontend_lite televolution_frontend_lite:0.0.1

    showSuccess "All Images loaded successfully."
}

clean_docker(){
    docker builder prune || error_exit "Docker builder prune failed."
    # rm -rf "$BUILD_DIR" || error_exit "Failed to remove directory $BUILD_DIR."
    docker stop $(docker ps -q) || error_continue "Failed to stop all containers."
    docker rm $(docker ps -a -q) || error_continue "Failed to remove all containers."
    docker image prune -a || error_continue "Failed to remove all images."
    docker volume prune || error_continue "Failed to remove all volumes. We will retry another way to remove volumes."
    docker volume rm $(sudo docker volume ls -q) || error_continue "Failed to remove all volumes."
    # docker system prune -a || error_continue "Failed to remove all unused data."
}

download_release(){
    if [ -d "$BUILD_DIR" ]; then
        read -p "Directory $BUILD_DIR already exists. Do you want to delete it? (y/n): " delete_dir
        if [ "$delete_dir" != "y" ]; then
            error_exit "Directory $BUILD_DIR already exists. Please delete it and try again."
        fi
        echo "Deleting existing directory $BUILD_DIR..."
        rm -rf "$BUILD_DIR" || error_exit "Failed to delete directory $BUILD_DIR."
    fi
    
    mkdir "$BUILD_DIR" || error_exit "Failed to create directory $BUILD_DIR."
    cd "$BUILD_DIR" || error_exit "Directory $BUILD_DIR does not exist."

    options=(
        "televolution_frontend_lite"
    )

    choose_multiple_menu "Please select the Docker images to download (use arrow keys to navigate and right arrow to select):" selected_images "${options[@]}"

    failed_downloads=()

    for image in $selected_images; do
        download_image "$image" || failed_downloads+=("$image")
    done

    if [ ${#failed_downloads[@]} -ne 0 ]; then
        error_continue "Retrying failed downloads..."
        for failed_image in "${failed_downloads[@]}"; do
            download_image "$failed_image" || error_exit "Failed to download $failed_image again."
        done
    fi

    showSuccess "All releases downloaded successfully."
    cd ..
}

download_image() {
    image=$1
    
    echo "Downloading Image $image..."
    curl -L -O "$GITHUB_REPO/releases/download/0.0.1/${image}.tar" || {
        error_continue "Failed to download $image."
        return 1
    }

    return 0
}

build=false
save=false
load=false
clean=false
download=false
upload=false

if [ $# -eq 0 ]; then
    print_help
    exit 0
else
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            build)  build=true ;;
            save) save=true ;;
            load) load=true ;;
            clean) clean=true ;;
            download) download=true ;;
            help|-h|--help) print_help; exit 0 ;;
            *) echo "Unknown parameter passed: $1"; print_help; exit 1 ;;
        esac
        shift
    done
fi

if [ "$clean" = true ]; then
    clean_docker
fi

if [ "$build" = true ]; then
    build_images
fi

if [ "$save" = true ]; then
    save_images
fi

if [ "$load" = true ]; then
    load_images
fi

if [ "$download" = true ]; then
    download_release
fi
