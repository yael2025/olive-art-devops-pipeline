pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'wsl bash -lc "cd ~/olive-art-devops && terraform init"'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'wsl bash -lc "cd ~/olive-art-devops && terraform apply -auto-approve"'
            }
        }

        stage('Run Ansible') {
            steps {
                bat 'wsl bash -lc "cd ~/olive-art-devops && ansible-playbook -i ansible/inventory.ini ansible/playbook.yml"'
            }
        }

        stage('Validation') {
            steps {
                bat 'curl -I http://13.61.33.202'
            }
        }

        stage('Website URL') {
            steps {
                echo '================================'
                echo 'OLIVE ART WEBSITE READY'
                echo 'http://13.61.33.202'
                echo '================================'
            }
        }
    }
}
