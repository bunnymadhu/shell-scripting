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

NODEJS () {
  HEAD "Installing Nodejs\t\t\t"
  yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
  STAT $?

  HEAD "Add Roboshop  APP  User\t\t"
  id roboshop &>>/tmp/roboshop.log
  if [  $? -eq 0 ]; then
    echo User is already there, so avoid the User creation &>>/tmp/roboshop.log
    STAT $?
  else
    useradd roboshop &>>/tmp/roboshop.log
    STAT $?
  fi

  HEAD "Download from Github\t\t\t"
  curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
  STAT $?

  HEAD "Extract Downloaded Content\t\t"
  cd /home/roboshop && rm -rf catalogue &>>/tmp/roboshop.log
  STAT $?

  ## in root user cd /home/roboshop/
  ## ls ------ catalogue-main
  ## mv catalogue-main catalogue,,,the go to centos user

  HEAD "unzip the file\t\t\t\t"
  unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
  STAT $?

  HEAD "Install Nodejs Dependencies\t\t"
  cd /home/roboshop/catalogue &&  npm install --unsafe-perm &>>/tmp/roboshop.log
  STAT $?

  HEAD "Fix the permissions to the App Content"
  chown roboshop:roboshop /home/roboshop -R
  STAT $?

  HEAD "Update DNS Records in systemD file\t"
  sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service
  STAT $?

  HEAD "Setup SystemD service\t\t\t"
  mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log
  STAT $?

  HEAD "Start Catalogue service\t\t"
  systemctl daemon-reload && systemctl enable catalogue &>>/tmp/roboshop.log && systemctl restart catalogue &>>/tmp/roboshop.log
  STAT $?
}