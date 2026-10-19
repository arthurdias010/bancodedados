-- Atividade de Banco de Dados - 2°D
-- Arthur Alexandre Dias Silva, n°7


-- Criação do banco de dados
create database bd_2infod__26
go
use bd_2infod__26
go

create table funcionario
(
  idfuncionario int,
  nome varchar(50) not null,
  endereco varchar(100),
  cidade varchar(50),
  estado char(2),
  email varchar(100) unique,
  datanascto date,
  cargo char(2),
  salario decimal(10,2),
  ativo bit
  primary key(idfuncionario)
  )
go
  select * from funcionario
go
  insert into funcionario(idfuncionario,
  nome, endereco,cidade, estado, email,
  datanascto, cargo,salario, ativo)
 values (1, 'José da Silva', 'Av. São Paulo', 'Itu', 'SP', 'zesilva@yahoo.com.br',
'1991-02-24', 'Al',1000, 0),
(2, 'Byuhl Gueittys', 'Av. Maicroçofiti, 95', 'Janela', 'SP',
 'emeiodobiu@epow.com', '1965-12-25', 'PC', 2000,1),
(3,'Ana Pimenta','Rua da Saúde, 11','Jundiaí','SP','pimentinha@hotmail.com','1987-01-01','TI',750,1),
(4,'Mário Lopes','Rua Angélica, 143','Jundiaí','SP','mlopes@hotmail.com','1985-04-10','TI',750,0),
(5, 'Ana Maria Souza', 'Av. das Nações da Paz', 'ONU', 'US', 'iloveny@boom.com',
'1950-01-01','TI', 5000,1),
(6, 'Maria de Fátima', 'Rua das Maçãs', 'Apple City', 'US', 'me@me.com',
'1990-01-01','AL',2000,1), 
(7, 'José Maria de Oliveira', 'Av. das Nações da Paz', 'ONU', 'US', 'iloveny5@boom.com',
'1950-01-01','TI',5000,1),
(8, 'André dos Santos Maria', 'Rua das Maçãs', 'Apple City', 'US', 'me@me12.com',
'1990-01-01','AL',2400,0),
(9,'Jorge Luis Rodrigues','Av. da Saudade,1989','São Paulo','SP','jorgeluiz@yahoo.com.br',
'1990-05-05','PC',3000,1),
(10,'Ana Paula Camargo','Rua Costa e Silva, 33','Jundiaí','SP','apcamargo@gmail.com',
'1991-06-20','TI',1100,1),
(11,'Ivo Cunha','Rua Nicolau Coelho, 22','São Paulo', 'SP','cis@bol.com.br','1988-04-30',
'PC',2200,1) 
go

select * from funcionario

-- 1 - exiba o cargo e quantidade de funcionários por cargo em ordem crescente de quantidade.
select cargo, count(*) as quantidade_funcionarios from funcionario group by cargo order by count(*) asc;

-- 2 - exiba o cargo e a quantidade de funcionários por cargo, eliminando os cargos nulos.
select cargo, count(*) as quantidade_funcionarios from funcionario where cargo is not null group by cargo;

-- 3 - apresente o cargo e a média de salários (denominando de “media_salarios_cargos”) dos funcionários por cargo.
select cargo, avg(salario) as media_salarios_cargos from funcionario group by cargo;

-- 4 - exiba o cargo e a soma dos salários dos funcionários por cargos maiores quer 3.000,00.
-- interpretação: mostrar cargos cuja soma dos salários seja maior que 3.000,00.
select cargo, sum(salario) as soma_salarios from funcionario group by cargo having sum(salario) > 3000.00;

-- 5 - apresente o cargo e a soma dos salários dos funcionários por cargos do estado de sp.
select cargo, sum(salario) as soma_salarios from funcionario where estado = 'sp' group by cargo;

-- 6 - altere para verdadeiro (1) o campo ativo dos funcionários das cidades de jundiaí e são paulo.
update funcionario set ativo = 1 where cidade in ('jundiaí', 'são paulo', 'săo paulo');

-- 7 - altere para falso (0) o campo ativo dos funcionários que não são das cidades de jundiaí e são paulo.
update funcionario set ativo = 0 where cidade not in ('jundiaí', 'são paulo', 'săo paulo');

-- 8 - exiba a cidade e a média diferente de nula dos salários dos funcionários por cidade.
select cidade, avg(salario) as media_salarios from funcionario group by cidade;

-- 9 - mostre o cargo, a soma e a média dos salários dos funcionários por cargo, cuja soma seja menor que 5.000.
select cargo, sum(salario) as soma_salarios, avg(salario) as media_salarios from funcionario group by cargo having sum(salario) < 5000;

-- 10 - exiba a cidade, o cargo, a soma e a média dos salários dos funcionários por cidade e cargo.
select cidade, cargo, sum(salario) as soma_salarios, avg(salario) as media_salarios from funcionario group by cidade, cargo;

-- 11 – exiba o nome dos quatro primeiros funcionários.
select top 4 nome from funcionario order by idfuncionario;

-- 12 – exiba todos os dados de dois funcionários de valinhos.
select top 2 * from funcionario where cidade = 'valinhos' order by idfuncionario;

-- 13 – apresente nome e data de nascimento de um funcionário mais velho.
select top 1 nome, datanascto from funcionario where datanascto is not null order by datanascto asc;

-- 14 – exiba duas cidades e quantidade de funcionários por cargo. interpretação: mostrar no máximo duas cidades e a quantidade por cargo em cada uma.
with cidades as ( select top 2 cidade from funcionario group by cidade order by cidade ) select f.cidade, f.cargo, count(*) as quantidade_funcionarios from funcionario as f inner join cidades as c on c.cidade = f.cidade group by f.cidade, f.cargo order by f.cidade, f.cargo;

-- 15 – apresente dois cargos e quantidade de funcionários por cargo.
select top 2 cargo, count(*) as quantidade_funcionarios from funcionario group by cargo order by cargo;

-- 16 – exiba todos os dados de 30% dos funcionários.
select top (30) percent * from funcionario order by idfuncionario;

-- 17 – mostre o nome e o email de 6 funcionários.
select top 6 nome, email from funcionario order by idfuncionario;

-- 18 – exiba idfuncionario, cargo e ativo de 70% dos funcionários.
select top (70) percent idfuncionario, cargo, ativo from funcionario order by idfuncionario;

-- 19 – exiba idfuncionario e salário do menor salário não nulo de um funcionário.
select top 1 idfuncionario, salario from funcionario where salario is not null order by salario asc, idfuncionario asc;

-- 20 – exiba todos os dados de 90% dos funcionários.
select top (90) percent * from funcionario order by idfuncionario;

-- 21- apresente todos os dados de um funcionário da cidade de são paulo.
select top 1 * from funcionario where cidade in ('são paulo', 'săo paulo') order by idfuncionario;

-- 22 – mostre nome, endereço cidade e estado de 20% dos funcionários.
select top (20) percent nome, endereco, cidade, estado from funcionario order by idfuncionario;

-- 23 - exiba a menor data de nascimento dos funcionários.
select min(datanascto) as menor_nascimento from funcionario;

-- 24 - exiba a maior data de nascimento dos funcionários, denominando-a ‘maior_nascimento’.
select max(datanascto) as maior_nascimento from funcionario;

-- 25 - mostre a quantidade de funcionários da cidade de valinhos, denominando-a ‘quantidade_de_valinhos’.
select count(*) as quantidade_de_valinhos from funcionario where cidade = 'valinhos';

-- 26 - exiba a soma dos salários dos funcionários da cidade de campinas.
select sum(salario) as soma_salarios from funcionario where cidade = 'campinas';

-- 27 - mostre a média dos salários dos funcionários da cidade de são paulo.
select avg(salario) as media_salarios from funcionario where cidade in ('são paulo', 'săo paulo');

-- 28 - exiba a soma dos salários dos funcionários cujos nomes começam com ‘ana’.
select sum(salario) as soma_salarios from funcionario where nome like 'ana%';

-- 29 - exiba a quantidade de funcionários que apresentam ‘luis” no nome.
select count(*) as quantidade_funcionarios_luis from funcionario where nome like '%luis%';

-- 30 - mostre o menor e o maior salários dos funcionários que moram na ‘av. são paulo’.
select min(salario) as menor_salario, max(salario) as maior_salario from funcionario where endereco like 'av. são paulo%';