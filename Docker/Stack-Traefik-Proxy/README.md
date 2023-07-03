<div align="center">
<img alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" /> - <img alt="Shell Script" src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white"/> - <img alt="Git" src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white"/> - <img alt="GitHub" src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/> -  <img alt="Docker" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> - <img alt="Ansible" src="https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white"/>
</div>


#Traefik

Traefik is an open-source edge router that facilitates the easy deployment of services. One very interesting aspect is that it integrates natively with most cluster technologies, such as Kubernetes, Docker, Docker Swarm. 
Traefik brings significant advantages compared to commonly used reverse proxy software because it was born with Cloud Native practices in mind, meaning it is specifically designed for cloud computing.

To enhance the security of our dashboard, you can add an authentication middleware using the following labels:

"traefik.http.routers.traefik.middlewares=authtraefik"
"traefik.http.middlewares.authtraefik.basicauth.users=user:hashpassword"

To create an encrypted password for the user, you can use the htpasswd tool from the apache2-utils package. Here are the steps to generate the encrypted password:

Install the apache2-utils package on your system. You can use the package manager specific to your operating system. For example, on Ubuntu, you can run:

sudo apt-get install apache2-utils

Use the htpasswd tool to generate the encrypted password. Run the following command, replacing <devops> with the desired username:

For example, if the username is "devops" and the encrypted password is "devops", the label would look like:

echo $(htpasswd -nbB devops "devops") | sed -e s/\\$/\\$\\$/g
devops:$$2y$$05$$mUC2H0I4tDtlpW9j8c3E7uSFaQoQjsuHbPvPsou/nWBj2AcuMW0BC


#Docker Socket Proxy tecnativa

This is a security-enhanced proxy for the Docker Socket.
Giving access to your Docker socket could mean giving root access to your host, or even to your whole swarm, but some services require hooking into that socket to react to events, etc. Using this proxy lets you block anything you consider those services should not do.

#Portainer

Portainer is a web interface that interacts with the Docker socket to create new containers and monitor them.
Portainer can also be used to visualize the cluster, manage user authentication, and control access permissions to the cluster.
In summary, Portainer is an application for managing your containers, whether they are in a cluster or not.