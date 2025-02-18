# Git & GitHub Collaboration Guide

## 1. Setting Up Git & GitHub

### Install Git
- Download and install Git from [git-scm.com](https://git-scm.com/).
- Verify installation:
  ```bash
  git --version
  ```

### Configure Git
After installation, configure Git with your GitHub username and email:
```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
```

### Create a GitHub Repository
1. Go to [GitHub](https://github.com/).
2. Click on the **+** in the top-right corner and select **New repository**.
3. Enter a **repository name** and description.
4. Choose **Public** or **Private**.
5. Click **Create repository**.

## 2. Cloning the Repository
To work locally, clone the repository using:
```bash
git clone https://github.com/yourusername/yourrepository.git
```
Navigate into the repository:
```bash
cd yourrepository
```

## 3. Adding Collaborators
1. Go to the repository on GitHub.
2. Click **Settings** > **Collaborators and Teams**.
3. Add the GitHub username/email of your collaborator.
4. They will receive an invitation and need to accept it.

## 4. Basic Git Workflow for Collaboration

### Making Changes
1. Create a new branch:
   ```bash
   git checkout -b feature-branch
   ```
2. Make changes to the files.
3. Add changes to staging:
   ```bash
   git add .
   ```
4. Commit changes:
   ```bash
   git commit -m "Added new feature"
   ```
5. Push to GitHub:
   ```bash
   git push origin feature-branch
   ```

### Pull Requests (PRs)
1. Go to the repository on GitHub.
2. Click **Pull Requests** > **New Pull Request**.
3. Select **feature-branch** as the source and **main** as the target.
4. Add a description and click **Create Pull Request**.
5. Review and merge when approved.

## 5. Keeping Your Local Repo Updated
Before working on new changes, always pull the latest updates:
```bash
git pull origin main
```

If you are working on a branch, first switch to `main`:
```bash
git checkout main
```
Then, pull updates and rebase your branch:
```bash
git pull origin main
```
```bash
git checkout feature-branch
```
```bash
git rebase main
```

## 6. Resolving Merge Conflicts
If there are conflicts:
1. Open the conflicting file.
2. Edit and remove the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).
3. Stage the resolved file:
   ```bash
   git add filename
   ```
4. Complete the merge:
   ```bash
   git commit -m "Resolved merge conflict"
   ```
5. Push changes:
   ```bash
   git push origin feature-branch
   ```

## 7. Branching Strategy
- **main**: Stable, production-ready code.
- **develop**: Active development branch.
- **feature-branch**: Individual features or fixes.

Use `git branch` to view branches and `git checkout branch-name` to switch.

## 8. Deleting a Branch After Merging
Once merged, delete old branches:
```bash
git branch -d feature-branch
```
To delete it on GitHub:
```bash
git push origin --delete feature-branch
```

## 9. Undoing Changes
### Undo Last Commit (Before Pushing)
```bash
git reset --soft HEAD~1
```

### Undo Last Commit (After Pushing)
```bash
git revert HEAD
```

## 10. Best Practices
- **Commit often** with meaningful messages.
- **Pull latest changes** before starting new work.
- **Use branches** to avoid breaking the main branch.
- **Review PRs carefully** before merging.
- **Keep repositories clean** by deleting old branches.

## Conclusion
This guide provides all the necessary steps for effective collaboration on GitHub. Following this workflow will ensure smooth teamwork and version control. Happy coding!

