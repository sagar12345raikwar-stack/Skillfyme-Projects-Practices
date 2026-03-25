# 🚀 Jenkins Production-Grade Assignment (With Commands)

### Enterprise Jenkins Pipeline for Resilient CI/CD

---

## 📌 Objective

Build a **fault-tolerant, scalable, and secure Jenkins pipeline** with real-world scenarios using commands.

---

# 🧱 Task 1: Jenkins Infrastructure Setup

## 🔹 Install Jenkins (Master)

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y

# Add Jenkins repo
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins
```

👉 Get initial password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## 🔹 Setup Jenkins Agents (Slaves)

### Install Java on Agent:

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
```

### From Jenkins UI:

* Manage Jenkins → Nodes → New Node
* Add agent → Launch via SSH

---

## 🔹 Simulate Limited Resource Agent

```bash
# While creating EC2 / VM
# Set:
# CPU: 1
# RAM: 1GB
```

---

# 🔐 Task 2: Secure Jenkins

## 🔹 Install RBAC Plugin

```bash
# Install via UI:
Manage Jenkins → Plugins → Install:
Matrix Authorization Strategy
```

---

## 🔹 Create Users

```bash
# Manage Jenkins → Manage Users → Create User
```

---

## 🔹 Assign Roles

* Admin → Full access
* Developer → Build permission
* Auditor → Read-only

---

## 🔒 IP Restriction (Firewall)

```bash
sudo ufw allow from <YOUR_IP> to any port 8080
sudo ufw enable
```

---

# ⚙️ Task 2: Jenkins Pipeline (Jenkinsfile)

## 🔹 Jenkinsfile Code

```groovy
pipeline {
    agent any

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'master', description: 'Git branch')
        booleanParam(name: 'FAIL_BUILD', defaultValue: false, description: 'Fail test?')
    }

    stages {

        stage('Checkout') {
            steps {
                script {
                    try {
                        git branch: params.BRANCH_NAME, url: 'https://github.com/Sonal0409/myproject-13Sep-25-sonal.git'
                    } catch (e) {
                        echo "❌ Branch not found!"
                        error("Stopping pipeline")
                    }
                }
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building..."'
            }
        }

        stage('Test') {
            steps {
                script {
                    retry(2) {
                        if (params.FAIL_BUILD) {
                            error("❌ Test failed")
                        } else {
                            echo "✅ Test passed"
                        }
                    }
                }
            }
        }

        stage('Deploy') {
            when {
                expression { currentBuild.currentResult == 'SUCCESS' }
            }
            steps {
                sh 'echo "Deploying..."'
            }
        }
    }

    post {

        success {
            echo "✅ Build Success"
            slackSend(
                color: 'good',
                message: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
            )
            archiveArtifacts artifacts: '*.log', allowEmptyArchive: true
        }

        failure {
            echo "❌ Build Failed"
            slackSend(
                color: 'danger',
                message: "❌ FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
            )
        }
    }
}
```

---

# 🔗 Task 3: Job Dependency Chain

## 🔹 Job A (Fetch Code)

```bash
git clone https://github.com/Sonal0409/myproject-13Sep-25-sonal.git'
```

---

## 🔹 Job B (Depends on A)

```bash
echo "Running Tests..."
```

---

## 🔹 Job C (Depends on B)

```bash
echo "Deploy Step"
```

---

## 🔹 Add Manual Approval (Pipeline Alternative)

```groovy
input message: "Approve to proceed?"
```

---

# 🎯 Parameterized Job Trigger

```bash
# In Job C (Execute Shell)
echo "Environment: $DEPLOY_ENV"

if [ "$DEPLOY_ENV" = "dev" ]; then
  echo "Deploying to Development"
elif [ "$DEPLOY_ENV" = "stage" ]; then
  echo "Deploying to Staging"
elif [ "$DEPLOY_ENV" = "prod" ]; then
  echo "Deploying to Production (Approval Required)"
fi
```

---

# 🔌 Task 4: Plugin Management

## 🔹 Install ThinBackup Plugin

```bash
# Via UI → Plugins → Install ThinBackup
```

---

## 🔹 Backup Jenkins

```bash
# Backup location:
/var/lib/jenkins/
```

---

## 🔹 Simulate Plugin Conflict

```bash
# Install older Git plugin via UI
# Then update to latest version
```

---

# ⚡ Performance Optimization

## 🔹 Keep Last 5 Builds

```bash
# Job → Configure → Discard Old Builds → Keep 5
```

---

## 🔹 Increase JVM Memory

Edit:

```bash
sudo nano /etc/default/jenkins
```

Add:

```bash
JAVA_ARGS="-Xms1g -Xmx2g"
```

Restart:

```bash
sudo systemctl restart jenkins
```

---

## 🔹 Disk Cleanup Script

```bash
#!/bin/bash

USAGE=$(df -h /var/lib/jenkins | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt 10 ]; then
  echo "Cleaning Jenkins..."
  rm -rf /var/lib/jenkins/workspace/*
  rm -rf /var/lib/jenkins/jobs/*/builds/*
fi
```

---

## ▶️ Run Script

```bash
chmod +x cleanup.sh
./cleanup.sh
```

---

# 📂 Deliverables

* Screenshots
* Jenkinsfile
* Logs
* ZIP file

---

# 🎯 Outcome

You learned:

* HA Jenkins setup
* Secure RBAC system
* Pipeline with error handling
* Job dependencies
* Performance tuning

---

## 🙌 Author

**Sagar**

---
