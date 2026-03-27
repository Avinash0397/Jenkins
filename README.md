# FileManager.sh - Directory and File Utility Script

This script helps in managing files and directories using simple Linux commands. 
It can create, list, move, copy, or delete files and directories, and can also read specific lines from a file.

---

## 1. Directory Operations

### Create a Directory  
Creates a new directory inside the specified path.

````./FileManager.sh addDir /tmp dir1````

````./FileManager.sh addDir /tmp dir2````

![Screenshot 2025-04-21 193842](https://github.com/user-attachments/assets/e6ef8de9-5109-4473-9c55-ee50ae0e9bbb)


### List Only Files  
Lists only the files (not folders) inside the given directory.

````./FileManager.sh listFiles /tmp````

![Screenshot 2025-04-18 005223](https://github.com/user-attachments/assets/b6238dc7-107c-49bf-be41-14964a3a97d1)


### List Only Directories  
Lists only the directories (folders) inside the given path.

````./FileManager.sh listDirs /tmp````

![Screenshot 2025-04-18 005316](https://github.com/user-attachments/assets/c6134901-81a1-42c2-8e16-d7d780126da6)


### List All (Files + Directories)  
Lists everything (both files and folders) inside the specified directory.

````./FileManager.sh listAll /tmp````

![Screenshot 2025-04-18 005410](https://github.com/user-attachments/assets/7159b1ca-ed6f-4723-a4de-280363d08c4d)


### Delete a Directory  
Deletes the specified directory from the given location.

````./FileManager.sh deleteDir /tmp dir1````

![Screenshot 2025-04-18 005500](https://github.com/user-attachments/assets/da31cc38-b971-4544-8019-17fdd59f10c0)

---

## 2. File Operations

### Create a File  
Creates an empty file in the given directory.

````./FileManager.sh addFile /tmp/dir1 file1.txt````

![Screenshot 2025-04-18 005616](https://github.com/user-attachments/assets/2b8f771e-8b1e-4dd8-a35c-b725f362e87d)


### Create a File with Content  
Creates a file with the specified initial content.

````./FileManager.sh addFile /tmp/dir1 file1.txt "Initial Content"````

![Screenshot 2025-04-18 005722](https://github.com/user-attachments/assets/f0b617d9-d43d-45d3-809d-80d9435f036e)



### Add Content at the End of File  
Adds more content at the bottom of the file.

````./FileManager.sh addContentToFile /tmp/dir1 file1.txt "Additional Content"````

### Add Content at the Beginning of File  
Adds content to the top (first line) of the file.

````./FileManager.sh addContentToFileBegining /tmp/dir1 file1.txt "Additional Content"````

![Screenshot 2025-04-18 005822](https://github.com/user-attachments/assets/a7f574b3-4038-4381-a642-dd36f5ef5b06)


---

## 3. Reading File Content

### Show Top N Lines  
Displays the first N lines of the file.

````./FileManager.sh showFileBeginingContent /tmp/dir1 file1.txt 5````

![image](https://github.com/user-attachments/assets/1c9f9213-3afc-4ae7-98a9-6db5ca7f7a18)



### Show Last N Lines  
Displays the last N lines from the file.

````./FileManager.sh showFileEndContent /tmp/dir1 file1.txt 5````

![Screenshot 2025-04-21 195036](https://github.com/user-attachments/assets/69b37164-4504-4b33-8911-2e3e5640d180)



### Show Specific Line Number  
Displays the content of a specific line in the file.

````./FileManager.sh showFileContentAtLine /tmp/dir1 file1.txt 10````

![Screenshot 2025-04-21 195156](https://github.com/user-attachments/assets/a9ca11e9-f65a-44c7-a913-bdb6aa8cc013)



### Show Line Range  
Shows content from a specific line range (example: lines 5 to 10).

````./FileManager.sh showFileContentForLineRange /tmp/dir1 file1.txt 5 10````

---

## 4. Moving and Copying Files

### Rename or Move a File  
Renames a file or moves it to a different name in the same folder.

````./FileManager.sh moveFile /tmp/dir1/file1.txt /tmp/dir1/file2.txt````


### Move File to Another Directory  
Moves the file to a different directory.

````./FileManager.sh moveFile /tmp/dir1/file2.txt /tmp/dir2/````


### Copy File to Another Directory  
Copies the file to another folder, keeping the same name.

````./FileManager.sh copyFile /tmp/dir2/file2.txt /tmp/dir1/````


### Copy and Rename File  
Copies the file and also renames it in the new location.

````./FileManager.sh copyFile /tmp/dir1/file2.txt /tmp/dir1/file3.txt````


---

## 5. Cleaning and Deleting Files

### Clear File Content  
Removes all text from the file, but keeps the file.

````./FileManager.sh clearFileContent /tmp/dir1 file3.txt````

![Screenshot 2025-04-21 200257](https://github.com/user-attachments/assets/ae4147a7-c35a-4993-afcb-e0a722a89faf)



### Delete a File  
Deletes the specified file from the directory.

````./FileManager.sh deleteFile /tmp/dir1 file2.txt````


![Screenshot 2025-04-21 200327](https://github.com/user-attachments/assets/b9728f26-7f21-4e3b-87e1-29a2d273dd06)


---

## Notes:
- Avoid using the `sed` command.
- Give execute permission to the script before using it:
````chmod +x FileManager.sh````
