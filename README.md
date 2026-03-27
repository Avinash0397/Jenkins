# UserManager.sh - Team and User Management Utility Script

This script help us to create and manage the users and teams (groups) using basic Linux commands. 
It handles user directories, permissions, team collaboration, and shared folders like `team` and `ninja`.

---

## 1. Team Operations

### Create a Team  
Creates a group.

````./UserManager.sh addTeam amigo````

````./UserManager.sh addTeam unixkings````

![Screenshot 2025-04-27 153218](https://github.com/user-attachments/assets/c98f2d56-56f8-489a-b7fd-b50d92fd3be5)


### Delete a Team
Removes the specified group and its configurations.

````./UserManager.sh delTeam amigo````

![Screenshot 2025-04-27 153252](https://github.com/user-attachments/assets/c4329a26-d3ea-4122-9a37-1365c1230bee)


## 2. User Operations
Add a User to a Team
Creates a new user under the given team with a home directory and shared folders.

````./UserManager.sh addUser Rakesh amigo````

````./UserManager.sh addUser Sandeep unixkings````

When a user is added, the following directory structure is created:


The user has full (read/write/execute) access to their own home.
Same-team users get read and execute access.
Other users get only execute access.
team folder: accessible fully by same-team members.
ninja folder: accessible fully by all users.

### Delete a User
Deletes the specified user and their home directory.

````./UserManager.sh delUser Rakesh````

## 3. User Account Management
### Change User Password
Updates the password for the specified user.

````./UserManager.sh changePasswd Rakesh````
### Change User Shell
Changes the default login shell of a user.

````./UserManager.sh changeShell Rakesh /bin/bash````

## 4. Listing Users and Teams
### List All Users
Displays all users created with this script.

````./UserManager.sh ls User````

### List All Teams
Displays all teams created.

````./UserManager.sh ls Team````

---
