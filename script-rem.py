import os
import re


def process_markdown_file(file_path):
    """
    Process a markdown file by removing all content before the first h1 header.
    Returns True if file was modified, False otherwise.
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find the first h1 header (# followed by space)
        match = re.search(r'^#\s', content, re.MULTILINE)

        if not match:
            # No h1 header found, leave file unchanged
            return False

        # Get the position of the first h1 header
        header_pos = match.start()

        # Keep only the content from the h1 header onwards
        new_content = content[header_pos:]

        # Write the modified content back to the file
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)

        return True

    except Exception as e:
        print(f"Error processing {file_path}: {str(e)}")
        return False


def process_folder(folder_path):
    """
    Process all markdown files in the given folder.
    """
    try:
        # Get all files in the folder
        files = os.listdir(folder_path)

        # Filter for markdown files
        markdown_files = [f for f in files if f.lower().endswith('.md')]

        if not markdown_files:
            print(f"No markdown files found in {folder_path}")
            return

        processed_count = 0

        for md_file in markdown_files:
            file_path = os.path.join(folder_path, md_file)
            if process_markdown_file(file_path):
                processed_count += 1
                print(f"Processed: {md_file}")
            else:
                print(f"Skipped: {md_file} (no h1 header found)")

        print(f"\nSummary:")
        print(f"Total markdown files: {len(markdown_files)}")
        print(f"Files processed: {processed_count}")
        print(f"Files skipped: {len(markdown_files) - processed_count}")

    except Exception as e:
        print(f"Error accessing folder {folder_path}: {str(e)}")


if __name__ == "__main__":

    folder_path = "/Users/rabinjoshi/Developer/github/learn/ios"

    if not os.path.isdir(folder_path):
        print(f"Error: {folder_path} is not a valid directory")
        sys.exit(1)

    process_folder(folder_path)
