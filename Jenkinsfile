pipeline {

    agent any

    stages {

        stage('Git Pull') {

            steps {

                checkout scm

            }

        }

        stage('Terraform Init') {

            steps {

                bat 'terraform init'

            }

        }

        stage('Terraform Apply') {

            steps {

                bat 'terraform apply -auto-approve'

            }

        }

        stage('Run Ansible') {

            steps {

                bat 'wsl ansible-playbook -i ansible/inventory.ini ansible/playbook.yml'

            }

        }

        stage('Validation') {

            steps {

                bat 'curl http://13.61.33.202'

            }

        }

    }

}
