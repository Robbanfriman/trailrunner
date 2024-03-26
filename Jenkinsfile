pipeline {
    agent any

    stages {
        stage('build trailrunner') {
            steps {
                dir('TrailrunnerProject'){
                    bat 'mvn compile'
            }
        }
    }

     stage('Test trailrunnerProject') {
            steps {
                dir('TrailrunnerProject') {
                    bat 'mvn test'
            }
        }
    }
    
    }
}