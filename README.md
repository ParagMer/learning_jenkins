"# learning_jenkins" 

    1 - create aws instance ec2
    2 - using ssh open ec2 instance

command
    1 - sudo apt-get update -y
    2 - sudo apt-get upgrade -y
    3 - sudo apt-get install openjdk-11-jre

come to local pc
    create project of django and enviromental
        python -m venv env
        env\scripts\activate

    create requirements.txt
        django 
        gunicorn
    pip install -r requirements.txt



    install jenkins
        create new file with name initial-setup.sh and command are
        sudo apt update

        sudo apt install openjdk-17-jre

        java -version
        
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null

        sudo apt-get update

        sudo apt-get install jenkins

        sudo systemctl start jenkins.service

        sudo systemctl status jenkins

    create .gitignore file and mention all code from https://github.com/github/gitignore/blob/main/Python.gitignore

Aws server
    install jenkins on aws server using same command

    Now open jenkins on browser using aws ip and port number 8080
    before trying on browser bond port number 8080 on aws server steps are
    - security > security groups url > edit inbound rules > add rule > port range = 8080, source 0.0.0.0/0 and save rules

    Now open in browser with instance public ipv4 address:8080 
    They will ask for password for password path they already given path over there which is
    sudo su
    vim var/lib/jenkins/secrets/initialAdminPassword
    
    
Local pc
    1 - enter password at unlock jenkins
    2 - Install suggested plugins
    3 - Let them install all package till that

    create new file with name envsetup.sh with code are
    
    if [-d "env"]
    then
        echo "Python virtual env exists"
    else
        python3 -m venv env
    fi

    echo $pwd
    source env/bin/activate

    pip3 install -r requirements.txt

    if [-d "logs"]
    then
        echo "Log folder exists"
    else
        mkdir logs
        touch logs/error.log logs.access.log
    fi

    sudo chmod -R 777 logs
    echo "envsetup finishes"

    4 - create First Admin User in aws server and in Jenkins URL - http://publicip4v:8080/
        Now you are in dashboard of jenkins
    5 - Create new file with name Jenkinsfile and code are
        pipeline{
            agent any
            stages {
            
                stage('Setup Python Virtual ENV for dependencies'){
            
            steps  {
                    sh '''
                    chmod +x envsetup.sh
                    ./envsetup.sh
                    '''}
                }
                stage('Setup Gunicorn Setup'){
                    steps {
                        sh '''
                        chmod +x gunicorn.sh
                        ./gunicorn.sh
                        '''
                    }
                }
                stage('setup NGINX'){
                    steps {
                        sh '''
                        chmod +x nginx.sh
                        ./nginx.sh
                        '''
                    }
                }
            }
        }
    6 -  Commit this first to use url
    7 - Go to jenkins website > Click on New item select pipeline click ok > select Discard old build > Change pipiline(Defition) from Pipeline script to pipeline script from SCM > change SCM None to Git > Repositry Url with commit
     - create gunicorn.sh file and code are
