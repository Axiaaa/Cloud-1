all : up 
	ansible-inventory -i inventory.yaml --list
	ansible-playbook -i inventory.yaml playbook.yaml

up : 
	vagrant up

re : clean all

rre : fclean all

vagrantssh : 
	vagrant ssh -- -L 8080:localhost:8080 

clean :
	vagrant destroy -f
	rm -rf ~/.ssh/known_hosts

fclean : 
	vagrant destroy -f 
	rm -rf .vagrant
	rm -rf "$(HOME)/VirtualBox VMs"
