# Assignment

This project is about setting up a complete CI/CD pipeline for a basic Node.js "Hello World" web app. I used Jenkins as the CI/CD tool, Docker for containerization, AWS ECR to store images, and an EC2 instance for the staging environment.

The goal was to automate the entire process — from building the app to testing, containerizing, and deploying it to staging.

Tools Used:
    Node.js – Simple web app (Hello World example from Express repo)
    Docker – For containerizing the app
    Jenkins – For building CI/CD pipeline
    AWS ECR – To push and store Docker images
    EC2 instance (Staging server) – To run the app in a simulated staging environment
    SonarQube – For static code analysis

**CI/CD Flow** 

1) Code Push by Developer
The process starts when a developer pushes code to the main branch of the Git repository. This push automatically triggers a Jenkins pipeline through a webhook configured in GitHub.

2) Jenkins Starts the CI Build
Once Jenkins is triggered, it begins the CI process:

    - Reads the application version from package.json

    - Installs necessary Node.js dependencies using npm install

3) SonarQube Code Analysis
Before building the image, the code is scanned using SonarQube to check for any quality or security issues. This is integrated inside the Jenkins pipeline.

4) Docker Image Build
After a successful scan, Docker is used to containerize the application. The Docker image is tagged with the app version and built directly inside Jenkins.

5) Push to AWS ECR
Once the image is built, it is pushed to Amazon ECR (Elastic Container Registry). ECR also automatically performs a basic scan for known vulnerabilities when the image is pushed.

6) Deploy to Staging Server
After the image is successfully uploaded, Jenkins connects to the staging EC2 instance via SSH and performs the following:

    - Pulls the image from ECR

    - Stops and removes the old container if it exists

    - Runs the new container on port 8080

***Summary***

The whole flow is automated from code push to deployment.

This ensures faster delivery, cleaner code.

Everything is version-controlled and traceable (both code and Docker images).





