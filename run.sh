#!/bin/sh -x

#ansible-playbook -i inventory/hosts -s provision_instance.yml  -e "env=dev"

ansible-playbook -i inventory/hosts -s setup_instance.yml  -e env=dev -v --private-key=/opt/pari/test.pem

ansible-playbook -i inventory/hosts -s deploy_app.yml --extra-vars "env=dev artifact=/var/lib/jenkins/workspace/test/target/CounterWebApp.war" -v --private-key=/opt/pari/test.pem
