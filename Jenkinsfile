  pipeline {
    agent any

    stages {
      stage('fetch_latest_code') {
        steps {
          git credentialsId: '37554d98-5ab5-49c7-a08d-c4b23d1ab119', url: 'https://github.com/sstcheuffa/terraform-jenkins-ec2'                  
        }
      }

      stage('TF Init&Plan') {
        steps {
          sh 'terraform init'
          //sh 'terraform plan'
        }      
      }


      stage('TF Apply') {
        steps {
          sh 'terraform apply --auto-approve'
        }
      }
    } 
  }
