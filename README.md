# 📘 Enterprise Git – Practical Workflows and Collaboration Strategies

## 📌 Project Overview
This repository demonstrates **enterprise-level Git workflows** including repository setup, branching strategies, collaboration, release management, CI integration, and advanced Git operations.
These tasks simulate **real-world team scenarios** commonly used in professional software development.

---

## 🛠 Tools & Technologies
- Git
- GitHub
- Linux
- Jenkins (CI concept)
- Markdown

---

# 🔹 Part 1: Initial Setup and Repository Management

## ✅ Task 1: Setting Up a Git Repository
**Scenario:** Create a new Git repository for a project.
	
### Commands:
mkdir xyz-project
cd xyz-project
git init
git status
git add .
git commit -m "Initial commit"
```

---

## ✅ Task 2: Forking and Cloning a Project
**Scenario:** Contribute to an open-source project.

### Commands:
```bash
git clone https://github.com/your-username/repository-name.git
cd repository-name
```

---

# 🔹 Part 2: Branching and Collaboration

## ✅ Task 3: Branching Strategy (GitFlow)
**Scenario:** Create a feature branch for new development.

### Commands:
```bash
git checkout -b feature/new-feature
```

---

## ✅ Task 4: Collaboration and Pull Requests
**Scenario:** Push feature branch and create a Pull Request.

### Commands:
```bash
git add .
git commit -m "Added new feature"
git push origin feature/new-feature
```

---

## ✅ Task 5: Handling Merge Conflicts	
**Scenario:** Resolve conflicts between main and feature branch.

### Commands:
```bash
git checkout feature/new-feature
git pull origin master
```
Resolve conflicts manually, then:
```bash
git add .
git commit -m "Resolved merge conflict"
```

---

# 🔹 Part 3: Managing Releases and Tags

## ✅ Task 6: Creating a Release and Tagging
**Scenario:** Create version v1.0.

### Commands:
```bash
git tag v1.0
git push origin v1.0
```

---

## ✅ Task 7: Hotfix in Production
**Scenario:** Fix critical production issue.

### Commands:
```bash
git checkout -b hotfix/critical-fix master
git add .
git commit -m "Applied critical hotfix"
git checkout master
git merge hotfix/critical-fix
```

---

# 🔹 Part 4: Working with Git in Teams

## ✅ Task 8: Stashing Changes
**Scenario:** Save work temporarily before switching branches.

### Commands:
```bash
git stash
git checkout master
git stash apply
```

---

## ✅ Task 9: Cherry-Picking a Commit
**Scenario:** Apply a specific fix from another branch.

### Commands:
```bash
git cherry-pick <commit-hash>
```

---

# 🔹 Part 5: Continuous Integration with Git

## ✅ Task 10: Integrating Continuous Integration (CI)
**Scenario:** Trigger CI pipeline on code push.

### Commands:
```bash
git push origin main
```

---

# 🔹 Part 6: Advanced Git Operations

## ✅ Task 11: Rebase vs Merge
**Scenario:** Keep commit history clean.

### Commands:
```bash
git checkout feature/new-feature
git rebase master

---

## ✅ Task 12: Squashing Commits
**Scenario:** Combine multiple commits into one.

### Commands:
```bash
git rebase -i HEAD~3
```

---

# 🔹 Part 7: Auditing and Monitoring

## ✅ Task 13: Git Blame for Debugging
**Scenario:** Identify who introduced a bug.

### Commands:
```bash
git blame filename
```

---

## 🎯 Key Learnings
- GitFlow branching strategy
- Team collaboration via Pull Requests
- Merge conflict resolution
- Release and hotfix management
- Clean commit history
- CI/CD integration basics

---

## 👨‍💻 Author
**Sagar Raikwar**
