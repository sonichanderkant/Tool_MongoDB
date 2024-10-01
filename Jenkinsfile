pipeline {
  agent any

  parameters {
  
    booleanParam(name: 'auto_approve', defaultValue: false, description: 'Automatically apply Terraform changes')
    choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action: Apply or Destroy')
  }

  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    TF_VAR_region = "${params.AWS_REGION}"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/sonichanderkant/Tool_MongoDB.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      when {
        expression { return params.ACTION == 'apply' }
      }
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      when {
        expression { return params.ACTION == 'apply' }
      }
      steps {
        script {
          if (params.auto_approve) {
            sh 'terraform apply -auto-approve tfplan'
          } else {
            input(message: 'Do you want to apply these changes?', ok: 'Apply')
            sh 'terraform apply tfplan'
          }
        }
      }
    }

    stage('Terraform Destroy') {
      when {
        expression { return params.ACTION == 'destroy' }
      }
      steps {
        script {
          if (params.auto_approve) {
            sh 'terraform destroy -auto-approve'
          } else {
            input(message: 'Do you want to destroy the infrastructure?', ok: 'Destroy')
            sh 'terraform destroy -auto-approve'
          }
        }
      }
    }
  }
}
