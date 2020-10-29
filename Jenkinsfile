def ORG = "mayadataio"
def REPO = "kubera-charts"

pipeline {
    agent {
      label {
        label ""
          customWorkspace "/var/lib/jenkins/workspace/${REPO}"
      }
    }
    stages {
        stage('test') {
            steps {
                script {
                    sh "pwd && helm lint"
                }
            }
        }
        stage('publish charts ') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == '3.0' )  {
		             withCredentials([usernamePassword( credentialsId: 'dd46bd83-0e93-492b-bc43-fcb671b135c3', usernameVariable: 'user', passwordVariable: 'pass')]) {
                               sh """
                                   helm package ./kubera-charts
				   helm package ./kubera-enterprise
                                   git clone https://${user}:${pass}@github.com/mayadata-io/${REPO}.git
                                   cd  ${REPO}
                                   git checkout gh-pages
                                   mv ../*.tgz .
                                   helm repo index .  --url https://charts.mayadata.io 
                                   git add .
                                   git commit -m "release new charts"
                                   git push https://${user}:${pass}@github.com/mayadata-io/${REPO}.git --all
                                
                                  """
                           }
                        }
                    }
                }
            }
        }
    post {
        always {
            echo 'This will always run'
            deleteDir()
        }
        success {
            echo 'This will run only if successful'
            // slackSend channel: '#jenkins-builds',
            // color: 'good',
            // message: "The pipeline ${currentBuild.fullDisplayName} completed successfully :dance: :thumbsup: "
        }
        failure {
            echo 'This will run only if failed'
            // slackSend channel: '#jenkins-builds',
            // color: 'RED',
            // message: "The pipeline ${currentBuild.fullDisplayName} failed. :scream_cat: :japanese_goblin: "
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
            // slackSend channel: '#jenkins-builds',
            // color: 'good',
            // message: "The pipeline ${currentBuild.fullDisplayName} is unstable :scream_cat: :japanese_goblin: "
        }
        changed {
/*            slackSend channel: '#jenkins-builds',
                   color: 'good',
                   message: "Build ${currentBuild.fullDisplayName} is now stable :dance: :thumbsup: "
            echo 'This will run only if the state of the Pipeline has changed'
*/          echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
