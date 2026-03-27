## Git Branches, Tags, and Commit Report Management ##
This assignment focuses on creating three useful Git management scripts to manage branches, tags, and commit reports. 

### Part A: Branch Management (gitBranches.sh) ###
This script helps us manage Git branches by allowing us to list, create, delete, merge, and rebase branches.

List Branches

Show all the branches in the repository.

```./gitBranches.sh -l```

Create a Branch

Create a new branch in the repository.

```./gitBranches.sh -b <branch_name>```

Delete a Branch

Delete an existing branch.

```./gitBranches.sh -d <branch_name>```

Merge Two Branches

Merge one branch into another.

```./gitBranches.sh -m -1 <branch_name1> -2 <branch_name2>```

Rebase Two Branches

Rebase one branch onto another.

```./gitBranches.sh -r -1 <branch_name1> -2 <branch_name2>```

## Part B: Tag Management (gitTags.sh) ##
This script helps us manage Git tags by allowing us to create, list, and delete tags.

Create a new tag in the repository.

```./gitTags.sh -t <tag_name>```

List Tags

List all tags in the repository.

```./gitTags.sh -l```

Delete a Tag

Delete a specific tag from the repository.

```./gitTags.sh -d <tag_name>```

## Part C: Commit Report Generation (gitCommitReport.sh) ##
This script generates a commit report for a Git repository based on a specified time period. 
The report includes commit details such as the commit ID, author information, commit message, and changed files.

Generate a Commit Report

Input the repository URL and the number of days for which to generate the report.

```./gitCommitReport.sh -u <url> -d <days>```

### How to Use These Scripts ###
Clone the Repository

Clone the Git repository where you want to manage branches, tags, and generate commit reports.

Make Scripts Executable

Make the scripts executable by running:
