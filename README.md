<div align="center">
<img alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" /> - <img alt="Shell Script" src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white"/> - <img alt="Git" src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white"/> - <img alt="GitHub" src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/> -  <img alt="Docker" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> - <img alt="Ansible" src="https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white"/>
</div>


## Traefik no Docker com Proxy de Socket da Tecnativa, Cloudflare e Portainer

<p>Traefik é um roteador de borda de código aberto que facilita a implantação fácil de serviços. Um aspecto muito interessante é que ele se integra nativamente com a maioria das tecnologias de cluster, como Kubernetes, Docker e Docker Swarm. O Traefik traz vantagens significativas em comparação com o software de proxy reverso comumente usado, porque foi criado com as práticas nativas da nuvem em mente, ou seja, foi projetado especificamente para computação em nuvem.
 </p>

## Proxy de Socket do Docker da Tecnativa

Este é um proxy com melhorias de segurança para o Socket do Docker. Dar acesso ao seu Socket do Docker pode significar dar acesso de root ao seu host, ou até mesmo a todo o seu swarm, mas alguns serviços precisam se conectar a esse socket para reagir a eventos, etc. Usar este proxy permite bloquear qualquer coisa que você considere que esses serviços não devem fazer.

## Portainer

O Portainer é uma interface web que interage com o Socket do Docker para criar novos contêineres e monitorá-los. O Portainer também pode ser usado para visualizar o cluster, gerenciar autenticação de usuário e controlar permissões de acesso ao cluster. Em resumo, o Portainer é uma aplicação para gerenciar seus contêineres, estejam eles em um cluster ou não.

Para aumentar a segurança do nosso painel, você pode adicionar um middleware de autenticação usando as seguintes etiquetas:

<p>"traefik.http.routers.traefik.middlewares=authtraefik"</p>
<p>"traefik.http.middlewares.authtraefik.basicauth.users=user:hashpassword"</p>

Para criar uma senha criptografada para o usuário, você pode usar a ferramenta htpasswd do pacote apache2-utils. Aqui estão os passos para gerar a senha criptografada:

Instale o pacote apache2-utils no seu sistema. Você pode usar o gerenciador de pacotes específico para o seu sistema operacional. Por exemplo, no Ubuntu, você pode executar:

sudo apt-get install apache2-utils

Use a ferramenta htpasswd para gerar a senha criptografada. Execute o seguinte comando, substituindo com o nome de usuário desejado:

Por exemplo, se o nome de usuário for "devops" e a senha criptografada for "devops", a etiqueta ficaria assim:

echo $(htpasswd -nbB devops "devops") | sed -e s/\\$/\\$\\$/g

devops:$$2y$$05$$mUC2H0I4tDtlpW9j8c3E7uSFaQoQjsuHbPvPsou/nWBj2AcuMW0BC

## Iniciar Serviços

Iniciar Serviços

Execute: bash services <Opções>

### Opções: up, stop, restart, exclud

exemplo:

bash services.sh up

### Por favor, preencha as informações da sua conta Cloudflare, o domínio a ser usado e o endereço de e-mail para notificações

<p>CLOUDFLARE_EMAIL= email cloudflare</p>
<p>CLOUDFLARE_API_KEY= cloudflare key</p>
<p>HOSTNAME_TRAEFIK= traefik.mydomain.com</p>
<p>HOSTNAME_PORTAINER= portainer.mydomain.com</p>
<p>DOMAIN= *.mydomain.com</p>
<p>EMAIL= traefiknotify@mydomain.com</p>
