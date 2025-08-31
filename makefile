all :
	ansible-inventory -i inventory.yaml --list
	ansible-playbook -i inventory.yaml playbook.yaml --key-file "~/.ssh/ovh_key.pub"

multihost : up
	ansible-inventory -i ./multihost/inventory.yaml --list
	ansible-playbook -i ./multihost/inventory.yaml ./multihost/playbook.yaml

up : 
	vagrant up

re : clean all

rre : fclean all

vagrant_re: vagrant_clean up multihost

vagrant_re: vagrant_fclean up multihost

vagrantssh : 
	vagrant ssh lcamerlyS2 -- -L 8080:localhost:8080

serverssh :
	ssh -L 8080:51.77.140.99:8080 -i ~/.ssh/ovh_key debian@51.77.140.99

vagrant_clean :
	vagrant destroy -f
	rm -rf ~/.ssh/known_hosts

vagrant_fclean : 
	vagrant destroy -f
	rm -rf ~/.ssh/known_hosts
	rm -rf .vagrant
	rm -rf "$(HOME)/VirtualBox VMs"

clean :
	ansible-playbook -i inventory.yaml delete_playbook.yaml --key-file "~/.ssh/ovh_key.pub"
