## Provisionando as máquinas no EC2 da AWS
----------

### Com o aws-cli instalado e configurado, deverá ser realizado os passos abaixo para o provisionamento das máquinas no EC2 da AWS.

###### Para os procedimentos abaixo, o terraform já tem que está instalado.

`./terraform init` - Baixa os plugins necessários para executar o código.


`./terraform plan` - Mostra o que o Terraform irá realizar.


`./terraform apply` - Executa tudo que foi definido no arquivo de configuração.

`./terraform destroy` - Vai destruir tudo que foi criado no provider pelo arquivo de configuração.

---

## Instalação do wordpress e o mysql
#### Na instância **telemetria0**
```docker
docker run --name meubanco -e MYSQL_ROOT_PASSWORD=SENHA -p 3306:3306 -d mysql:latest
```
#### Na instância **telemetria1**
##### Lembre-se de substituir IP-DB pelo IP da instância onde está rodando o banco de dados.
```docker
$ docker run --name mywordpress -p 8080:80 -e WORDPRESS_DB_HOST=IP-DB:3306 -e WORDPRESS_DB_PASSWORD=SENHA -e WORDPRESS_DB_NAME=dbwordpress -e WORDPRESS_TABLE_PREFIX=wpblog -d wordpress:latest
```
