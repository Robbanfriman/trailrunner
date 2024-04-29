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
        stage ("run robot"){
            steps {
                dir("Selenium"){
                    bat "robot adminPageTest.robot"
                    bat "robot eventTest.robot"
                    
                }
            }
        }
    }
    post {
        always {
            dir('TrailrunnerProject') {
                junit  '**/target/surefire-reports/*.xml'
            }
            dir ("Selenium"){    
                robot outputPath: 'C:/ProgramData/Jenkins/.jenkins/workspace/robert_friman/Selenium', passThreshold: 80.0   
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

