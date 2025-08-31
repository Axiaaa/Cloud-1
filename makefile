all :
	ansible-inventory -i inventory.yaml --list
	ansible-playbook -i inventory.yaml playbook.yaml

multihost : up
	ansible-inventory -i ./multihost/inventory.yaml --list
	ansible-playbook -i ./multihost/inventory.yaml ./multihost/playbook.yaml

up : 
	vagrant up

re : clean all

rre : fclean all

vagrantssh : 
	vagrant ssh -- -L 8080:localhost:8080 

serverssh :
	ssh -L 8080:51.77.140.99:8080 -i ~/.ssh/ovh_key debian@51.77.140.99

clean :
	vagrant destroy -f
	rm -rf ~/.ssh/known_hosts

fclean : 
	vagrant destroy -f
	rm -rf ~/.ssh/known_hosts
	rm -rf .vagrant
	rm -rf "$(HOME)/VirtualBox VMs"
