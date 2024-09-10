#!/bin/bash

# Function untuk menentukan pilihan komputer
get_computer_choice() {
    choices=("gunting" "batu" "kertas")
    computer_choice=${choices[$RANDOM % 3]}
}

# Function untuk menentukan pemenang
determine_winner() {
    if [[ $user_choice == $computer_choice ]]; then
        echo "Seri!"
    elif [[ ($user_choice == "gunting" && $computer_choice == "kertas") || 
            ($user_choice == "batu" && $computer_choice == "gunting") || 
            ($user_choice == "kertas" && $computer_choice == "batu") ]]; then
        echo "Kamu menang!"
    else
        echo "Skill issue!"
    fi
}

# Function utama permainan
play_game() {
    echo "Pilih: gunting, batu, atau kertas?"
    read user_choice

    # Validasi input pengguna
    if [[ $user_choice != "gunting" && $user_choice != "batu" && $user_choice != "kertas" ]]; then
        echo "Pilihan tidak valid. Coba lagi."
        return
    fi

    # Komputer memilih
    get_computer_choice
    echo "Komputer memilih: $computer_choice"

    # Tentukan pemenang
    determine_winner
}

# Jalankan permainan
play_game
