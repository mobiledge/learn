import os
from pathlib import Path


def insert_text_at_start(folder_path):
    """
    Insert front matter text at the start of all files in the specified folder,
    using the capitalized filename (without extension) as the title.

    Args:
        folder_path (str): Path to the folder containing files
    """
    try:
        # Convert to Path object for better path handling
        folder = Path(folder_path)

        # Ensure folder exists
        if not folder.is_dir():
            raise NotADirectoryError(
                f"'{folder_path}' is not a valid directory")

        # Iterate through all files in the folder
        for file_path in folder.iterdir():
            # Skip if it's not a file
            if not file_path.is_file():
                continue

            try:
                # Get the filename without extension and capitalize it
                title = file_path.stem.capitalize()

                # Create the front matter text with the dynamic title
                text_to_insert = f"""---
title: {title}
parent: iOS
---

1. TOC
{{:toc}}
"""
                # Add newline to text if it doesn't end with one
                if not text_to_insert.endswith('\n'):
                    text_to_insert += '\n'

                # Read the original content
                with open(file_path, 'r', encoding='utf-8') as file:
                    original_content = file.read()

                # Write the new content with the inserted text
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(text_to_insert + original_content)

                print(f"Successfully modified: {file_path}")

            except Exception as e:
                print(f"Error processing file {file_path}: {str(e)}")

    except Exception as e:
        print(f"An error occurred: {str(e)}")


# Example usage
if __name__ == "__main__":
    # Get user input
    # folder_path = input("Enter the folder path: ")
    folder_path = "/Users/rabinjoshi/Developer/github/learn/ios"

    # Run the function
    insert_text_at_start(folder_path)
