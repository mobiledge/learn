import os
import re


def to_camel_case(text):
    """Convert a filename to CamelCase."""
    # Remove file extension and split by non-alphanumeric characters
    name_without_ext = os.path.splitext(text)[0]
    words = re.split(r'[^a-zA-Z0-9]', name_without_ext)

    # Capitalize each word and join them together
    return ''.join(word.capitalize() for word in words if word)


def rename_markdown_files(folder_path):
    """
    Rename all markdown files in the given folder to CamelCase format.
    Returns a list of tuples containing (old_name, new_name) for renamed files.
    """
    renamed_files = []

    try:
        # Iterate through files in the folder
        for filename in os.listdir(folder_path):
            # Check if file is a markdown file
            if filename.lower().endswith('.md'):
                # Get the new name in CamelCase
                new_name = to_camel_case(filename) + '.md'

                # Create full paths
                old_path = os.path.join(folder_path, filename)
                new_path = os.path.join(folder_path, new_name)

                # Rename the file if the new name is different
                if filename != new_name:
                    os.rename(old_path, new_path)
                    renamed_files.append((filename, new_name))

        return renamed_files

    except Exception as e:
        print(f"An error occurred: {e}")
        return []


def main():
    # Get folder path from user
    # folder_path = input("Enter the folder path: ")
    folder_path = "/Users/rabinjoshi/Developer/github/learn/ios"

    # Check if folder exists
    if not os.path.isdir(folder_path):
        print("Error: Invalid folder path")
        return

    # Rename files and get list of changes
    renamed_files = rename_markdown_files(folder_path)

    # Print results
    if renamed_files:
        print("\nRenamed files:")
        for old_name, new_name in renamed_files:
            print(f"  {old_name} -> {new_name}")
    else:
        print("\nNo files were renamed")


if __name__ == "__main__":
    main()
