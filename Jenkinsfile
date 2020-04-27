node {
   stage('Preparation') {
       // for display purposes
       echo "Preparing"
   }

   stage('Build') {
       // Build an image for scanning
        checkout scm

        docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
            def customImage = docker.build("fabianschnueriger/exnch-nginx-jenkins-secured-twistlock")
            /* Push the container to the custom Registry */
            customImage.push()
        }

   }

  stage('Scan') {
    twistlockScan ca: '', 
        cert: '', 
        compliancePolicy: 'warn', 
        containerized: false, 
        dockerAddress: 'unix:///var/run/docker.sock', 
        gracePeriodDays: 0, 
        ignoreImageBuildTime: false, 
        image: 'fabianschnueriger/exnch-nginx-jenkins-secured-twistlock', 
        key: '', 
        logLevel: 'true', 
        policy: 'warn', 
        requirePackageUpdate: false, 
        timeout: 10
    }

  stage('Publish') {
    twistlockPublish ca: '', 
        cert: '', 
        dockerAddress: 'unix:///var/run/docker.sock', 
        image: 'fabianschnueriger/exnch-nginx-jenkins-secured-twistlock', 
        key: '', 
        logLevel: 'true', 
        timeout: 10
    }
}