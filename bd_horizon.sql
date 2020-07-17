create database bd_horizon

create table tbl_funcionario(
         cd_func int primary key identity,
		 nm_func varchar(50) not null,
		 ds_login varchar(20) not null,
		 senha_login varchar(8)not null,
)

create table tbl_reserva(
        no_passagem int primary key identity(1000,1),
		tipo_voo varchar(20) not null,
		local_orig varchar(20) not null,
		local_dest varchar(20) not null,
		cd_cliente int foreign key references tbl_cliente(cd_cliente),

)

create table tbl_cliente(
       cd_cliente int primary key identity,
	   no_passaport varchar(10),
	   nm_cliente varchar(50),
	   sg_sexo char(1)not null check(sg_sexo in('M','F')),
	   no_cpf char(11) not null,
	   no_cep char(8) not null,
	   pais_orig varchar(20) not null,
	   dt_nasc char(8) not null,
	   ddd_tel char(3) null,
	   tel_cliente char(8) null,
	  
)

create table tbl_pacote(
      cd_pacot int primary key identity,
	  local_hotel varchar(50) null,
	   quartos_hotel char(1) null,
	   categ_hotel char(1) null,
	   tipo_convenio varchar(20) null,
	   passeio_pacot varchar(20) null,
	    total_diarias int  null,
	   no_passagem int foreign key references tbl_reserva(no_passagem),
	  
	   
	 
)

create table tbl_agenda(
       cd_agenda int primary key identity,
	   dt_ida char(8) not null,
	   dt_volta char(8) null,
	    no_passagem int foreign key references tbl_reserva(no_passagem),
	   
)

create table tbl_pagamento(
     cd_paga int primary key identity,
	 preco_total decimal(10,2) not null,
	 forma_paga varchar(20) not null,
	 cd_agenda int foreign key references tbl_agenda(cd_agenda),
)

insert into tbl_pacote
(local_hotel,quartos_hotel,categ_hotel,tipo_convenio,passeio_pacot)
values('Maison Albar','3','5','Alimentação','Jardins de Monet')

insert into tbl_pacote
(local_hotel,quartos_hotel,categ_hotel,tipo_convenio,passeio_pacot)
values('Hotel Hiberia','2','3','Plano de Saúde','Coliseu')

select * from tbl_pacote

insert into tbl_funcionario(nm_func,ds_login,senha_login)
values ('Daniel','Daniel','123456')

insert into tbl_funcionario(nm_func,ds_login,senha_login)
values ('Leonardo','Leonardo','654321')


--comandos 

select * from tbl_pagamento
select * from tbl_agenda
select * from tbl_pacote
select * from tbl_reserva
select * from tbl_funcionario
select * from tbl_cliente



drop table tbl_pacote
drop table tbl_pagamento
drop table tbl_agenda
