pipeline {
    environment {
        registry = "agarim999/docker_test_repo"
    }
    parameters {
        string(name: 'repository_url', defaultValue: 'git@github.com:ZikFred/PROJECT.git', description: 'Github repository url')
        booleanParam(name: 'remove', defaultValue: false, description: 'Remove Buiild package')
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git "${params.repository_url}"
                git checkout Docker_br
            }
        }
        stage('Checking repository'){
            steps {
                    sh """
                    pwd
                    ls -l
                    whoami
                    """
            }
        }
        stage('Building image') {
            steps {
                sh "docker build --tag $registry:$BUILD_NUMBER ."
            }
        }
        stage('Deploy Image') {
            steps{
                   sh """
                   docker login -u agarim999 -p 789632145Zik*-+
                   docker push $registry:$BUILD_NUMBER
                   """
            }
        }
        stage('Remove Unused docker image') {
            when {
                expression {params.remove == true}
            }
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}