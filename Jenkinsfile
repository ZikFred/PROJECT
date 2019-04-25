pipeline {
    environment {
        registry = "agarim999/docker_test_repo"
        date = "date +%Y-%m-%d-%H"
    }
    parameters {
        string(name: 'repository_url', defaultValue: 'git@github.com:ZikFred/PROJECT.git', description: 'Github repository url')
        choice(name: 'repository_branch', choices: ['master', 'Jenkins_br', 'Docker_br'], description: 'Choice branch')
        booleanParam(name: 'remove', defaultValue: false, description: 'Remove Buiild package')
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git url: "${params.repository_url}", branch: "${params.repository_branch}"
            }
        }
        stage('Checking repository'){
            steps {
                    sh """
                    git branch
                    git checkout Docker_br
                    git branch
                    pwd
                    ls -l
                    whoami
                    """
            }
        }
        stage('Building image') {
            steps {
                sh "docker build --tag $registry:$BUILD_NUMBER-$BUILD_ID ."
            }
        }
        stage('Deploy Image') {
            steps{
                   sh """
                   docker login -u agarim999 -p 789632145Zik*-+
                   docker push $registry:$BUILD_NUMBER-$BUILD_ID
                   """
            }
        }
        stage('Run Docker Container') {
            steps {
                sh "docker run -id $registry:$BUILD_NUMBER-$BUILD_ID"
            }
        }
        stage('Check Conteiner') {
            steps {
                sh "docker ps -a"
            }
        }
        stage('Remove Unused docker image') {
            when {
                expression {params.remove == true}
            }
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER-$BUILD_ID"
            }
        }
    }
}