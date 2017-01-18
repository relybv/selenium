node {
   properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '3')), pipelineTriggers([pollSCM('H/15 * * * *')])])
   stage('Checkout') { // for display purposes
      // Clean workspace before checkout
      step ([$class: 'WsCleanup'])
      // Get some code from a GitHub repository
      git 'https://github.com/relybv/selenium.git'
   }
   stage('Selenium') {
      sh 'xvfb-run -a ruby test1.rb'
   }
}

