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

                sh 'terraform init'

            }

        }

        stage('Terraform Apply') {

            steps {

                sh 'terraform apply -auto-approve'

            }

        }

        stage('Run Ansible') {

            steps {

                sh 'ansible-playbook -i ansible/inventory.ini ansible/playbook.yml'

            }

        }

        stage('Validation') {

            steps {

                sh 'curl http://13.61.33.202'

            }

        }

    }

}
