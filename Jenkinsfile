pipeline {
    agent any
    tools {
        terraform 'terraform-1.14.2'
    }
    stages {
        stage('getting Config File'){
            steps {
                configFileProvider([configFile(fileId: 'mytest-np-backend.conf', targetLocation: 'mytest-np-backend.conf')]) {
                    // some block
                }
            }
        }
        stage('getting tfvars File'){
            steps {
                configFileProvider([configFile(fileId: 'mytest-np.tfvarsfile', targetLocation: 'terraform.tfvars')]) {
                    // some block
                }
            }
        }
        stage('TF Init') {
            steps {
                script {
                    echo 'Generating provider.tf...'
                     withCredentials([azureServicePrincipal("mytest-np-sp-terraform")]) {
                        sh '''
                            terraform init -upgrade -backend-config=mytest-np-backend.conf -no-color
                        '''
                    }
                }
            }
        }
        stage('TF Plan') {
            steps {
                script {
                    withCredentials([azureServicePrincipal("mytest-np-sp-terraform")]) {
                        env.$ARM_CLIENT_ID = AZURE_CLIENT_ID
                        env.$ARM_CLIENT_SECRET = AZURE_CLIENT_SECRET                         
                        env.$ARM_TENANT_ID = AZURE_TENANT_ID
                        env.$ARM_SUBSCRIPTION_ID = AZURE_SUBSCRIPTION_ID

                        sh '''
                        echo $
                            
                            # aws sts get-caller-identity --query Account

                            echo "----- Creating plan to validate -----"
                            terraform plan -var "subscriptionID=$AZURE_SUBSCRIPTION_ID" -var "clientid=$AZURE_CLIENT_ID" -var "clientsecret=$AZURE_CLIENT_SECRET" -var "tenantid=$AZURE_TENANT_ID" -out=tfplan -input=false -no-color -out=tfplan -input=false
                            terraform show -no-color -json tfplan > tfplan.json
                        '''
                    }
                }
            }
        }

        stage('TF Apply') {
            input {
                message "Do you want to proceed with the deployment?"
            }
            steps {
                script {
                    sh '''
                        echo "----- Apply validated plan on the infrastructure -----"
                        terraform apply -no-color tfplan
                    '''
                }
            }
        }

        stage('remove .tf files') {
            steps {
                script {
                    sh '''
                        rm -rf .terraform
                    '''
                }
            }
        }
        stage("cleanworkspace"){
            steps{
                cleanWs()
            }
        }
    }
}