HEAD () {
  echo -n -e  "\e[1m $1 \e[0m \t\t ... "
  }

STAT () {
  if [ $1 -eq 0 ]
  then
    echo -e "\e[1;32m done\e[0m"
  else
    echo -e "\e[1;31m fail\e[0m"
    echo -e "\e[1;33m check the log file more detail ...log file : /tmp/roboshop.log "
    exit 1
  fi
  }

APP_USER_ADD() {
  HEAD "Add Roboshop  APP  User\t\t"
  id roboshop &>>/tmp/roboshop.log
  if [  $? -eq 0 ]; then
    echo User is already there, so avoid the User creation &>>/tmp/roboshop.log
    STAT $?
  else
    useradd roboshop &>>/tmp/roboshop.log
    STAT $?
  fi
}

SETUP_SYSTEMD() {
  HEAD "Update DNS Records in systemD file\t"
  sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/' /home/roboshop/$1/systemd.service
  sed -i -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/'  /home/roboshop/$1/systemd.service'
  STAT $?

  HEAD "Setup SystemD service\t\t\t"
  mv /home/roboshop/$1/systemd.service /etc/systemd/system/$1.service &>>/tmp/roboshop.log
  STAT $?

  HEAD "Start $1 service\t\t"
  systemctl daemon-reload && systemctl enable $1 &>>/tmp/roboshop.log && systemctl restart $1 &>>/tmp/roboshop.log
  STAT $?
}

NODEJS () {
  HEAD "Installing Nodejs\t\t\t"
  yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
  STAT $?

  APP_USER_ADD

## $1 is the first argument is passed through
  HEAD "Download from Github\t\t\t"
  curl -s -L -o /tmp/$1.zip "https://github.com/roboshop-devops-project/$1/archive/main.zip" &>>/tmp/roboshop.log
  STAT $?

  HEAD "Extract Downloaded Content\t\t"
  cd /home/roboshop && rm -rf catalogue &>>/tmp/roboshop.log
  STAT $?

  ## in root user cd /home/roboshop/
  ## ls ------ catalogue-main
  ## mv catalogue-main catalogue,,,the go to centos

  HEAD "unzip the file\t\t\t\t"
  unzip /tmp/$1.zip &>>/tmp/roboshop.log && mv $1-main $1
  STAT $?

  HEAD "Install Nodejs Dependencies\t\t"
  cd /home/roboshop/$1 &&  npm install --unsafe-perm &>>/tmp/roboshop.log
  STAT $?

  HEAD "Fix the permissions to the App Content"
  chown roboshop:roboshop /home/roboshop -R
  STAT $?

  SETUP_SYSTEMD "$1"
}