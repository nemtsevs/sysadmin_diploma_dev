
nano ~/.bashrc
```

export YC_TOKEN=$(yc iam create-token) # iam авторизация суточная
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

```
source ~/.bashrc



# terraform
cd ~/sysadmin_diploma_dev/terraform
terraform init


terraform validate
terraform plan

terraform apply -auto-approve 
```
Outputs:

vm_ip = {
  "vm1" = "192.168.10.26"
  "vm2" = "192.168.10.3"
  "vm3" = "192.168.10.30"
}
vm_nat_ip = {
  "vm1" = "89.169.185.238"
  "vm2" = "89.169.186.8"
  "vm3" = "89.169.180.207"
}
```


# ansible
cd ~/sysadmin_diploma_dev/ansible

nano inventory.yaml

nano ansible.cfg

yamllint inventory.yaml

ansible all -m ping -i inventory.yaml


nano playbook.yaml
ansible-galaxy init default_packages

yamllint playbook.yaml
yamllint default_packages/vars/main.yml
yamllint default_packages/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="default_packages"

ssh -l s20691161 89.169.185.238
ssh -l s20691161 89.169.186.8
ssh -l s20691161 89.169.180.207
echo $HOSTNAME
sudo su


nano playbook.yaml
ansible-galaxy init nginx_custom

yamllint playbook.yaml
yamllint nginx_custom/tasks/main.yml
yamllint nginx_custom/handlers/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="nginx_custom"

http://89.169.185.238
http://89.169.186.8
http://89.169.180.207


nano playbook.yaml
ansible-galaxy init nginx_proxy

yamllint playbook.yaml
yamllint nginx_proxy/tasks/main.yml
yamllint nginx_proxy/handlers/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="nginx_proxy"

http://89.169.185.238:3000
for i in {1..10}; do curl http://89.169.185.238:3000; done


nano playbook.yaml
ansible-galaxy init update_upgrade

yamllint playbook.yaml
yamllint update_upgrade/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="update_upgrade"


nano playbook.yaml
ansible-galaxy init pg_install

yamllint playbook.yaml
yamllint pg_install/tasks/main.yml
yamllint pg_install/handlers/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="pg_install"


echo "vault_password" > ~/.vault_pass
chmod 600 ~/.vault_pass

nano ansible.cfg
```
vault_password_file = ~/.vault_pass
```

mkdir -p vars/vault
ansible-vault create vars/vault/postgres_vault.yml
```
postgres_wikiuser_password: "wikiuser"
```
ansible-vault edit vars/vault/postgres_vault.yml
ls -lh vars/vault/postgres_vault.yml


nano ansible.cfg
```
ansible_remote_tmp = /tmp/.ansible-{{ uid }}
```


nano playbook.yaml
ansible-galaxy init pg_mediawiki

yamllint playbook.yaml
yamllint pg_mediawiki/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="pg_mediawiki"


nano playbook.yaml
ansible-galaxy init php_install

yamllint playbook.yaml
yamllint php_install/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="php_install"

http://89.169.186.8
http://89.169.180.207


nano playbook.yaml
ansible-galaxy init mediawiki_install

yamllint playbook.yaml
yamllint mediawiki_install/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="mediawiki_install"

http://89.169.186.8
http://89.169.180.207


nano playbook.yaml
ansible-galaxy init mediawiki_settings

mkdir mediawiki_settings/templates
nano mediawiki_settings/templates/local_settings.j2
```
"{{ hostvars['vm2']['ansible_host'] }}"
```

ansible-vault create vars/vault/mediawiki_vault.yml
```
mediawiki_admin_password: "admin_pass"
```

yamllint playbook.yaml
yamllint mediawiki_settings/tasks/main.yml
ansible-playbook --syntax-check -i inventory.yaml playbook.yaml

ansible-playbook playbook.yaml -i inventory.yaml --tags="mediawiki_settings"
