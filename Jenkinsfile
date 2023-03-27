pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    
    environment 
    {
        DOCKERHUB_PWD=credentials('CredentialID_DockerHubPWD')
    }

    stages {
        stage('Check out'){
            steps {
                git branch: 'main', url: 'https://github.com/Ilyas-Ismail/COMP367_Lab2_Q3'
            }
        }
        
        stage('Build maven project') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
            
        stage('Unit test'){
            steps {
                sh "mvn test"
            }
        }
        
        stage('Docker build') {
            steps {
                script {
                    sh 'docker build -t lab3question1 .'
                }
            }
        }
        
        stage("Docker login") {
            steps {
                script {
                    sh 'docker login -u ilyasismail -p ${DOCKERHUB_PWD}'
                }
            }
        }
        
        stage("Docker push") {
            steps {
                script {
                    sh 'docker push lab3question1'
                }
            }
        }
    }
}
