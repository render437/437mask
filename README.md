# 437mask (Bash Edition)

A simple command-line tool written entirely in Bash to mask URLs, allowing users to create custom, shorter links for sharing.

This tool is designed to run directly from your terminal and provides an interactive menu for masking URLs. It simulates the process of creating a masked URL by generating a unique or custom alias associated with a placeholder domain (`https://437.link/`).

## Features

*   **Mask URLs:** Convert long URLs into short, memorable links.
*   **Custom Aliases:** Choose your own alias for the masked URL (e.g., `https://437.link/my-promo`).
*   **Random Aliases:** Generate a unique, random alias if no custom one is provided.
*   **Terminal-Based:** Easy to use directly from your Linux or macOS terminal (or WSL on Windows).
*   **No External Dependencies:** Written purely in Bash, requiring only standard shell utilities.

## Setup and Installation

### Prerequisites

*   A Linux or macOS environment (or Windows Subsystem for Linux - WSL).
*   Standard Bash shell and core utilities (`clear`, `read`, `echo`, `tr`, `head`, `fold`, `shuf`, etc.).

### Steps

1.  **Clone the Repository:**
    Open your terminal and clone the `437mask` repository from GitHub:
    ```bash
    git clone https://github.com/render437/437mask.git
    cd 437mask
    ```

2.  **Make the Script Executable:**
    Grant execution permissions to the main script.
    ```bash
    chmod +x 437mask.sh
    ```

## Usage

To run the `437mask` tool, execute the script from your terminal:

```bash
./437mask.sh
