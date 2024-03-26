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
    post {
        always {
            dir('TrailrunnerProject') {
                junit  '**/target/surefire-reports/*.xml'
            }
        }
        success{
            dir('TrailrunnerProject') {
                jacoco(
                    execPattern: '**/target/*.exec',
                    classPattern: '**/target/classes/se/iths',
                    sourcePattern: '**/src/main/java/se/iths'
                )
            }
        }
    }
}
