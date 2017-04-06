
create table Envio(
	nro_envio smallint,
	cantidad smallint,
	peso decimal(7,2),
	fk_id_prod_quim smallint,
	fk_id_cliente smallint,
	primary key (nro_envio)
);
create table Cliente(
	id_cliente smallint not null,
	CUIT smallint unique not null,
	apellido character varying(50) not null,
	nombre character varying(50) not null,
	calle character varying(50) not null,
	puerta smallint not null,
	piso smallint not null,
	email character varying(70) null,
	telefono character varying(25) not null,
	fk_id_cliente_garante smallint not null,
	primary key(id_cliente)
);
create table Producto_quimico(
	id_prod_quim smallint,
	nombre_prod_quim character varying(30),
	formula character varying(100),
	tipo_pq bit not null,
	primary key (id_prod_quim)
);
create table Producto_quimico_X_Producto_quimico(
	fk_id_prod_quim_1 smallint not null,
	fk_id_prod_quim_2 smallint not null,
	porcentaje decimal(3,2) not null,
	primary key (fk_id_prod_quim_1,fk_id_prod_quim_2)
);
create table Pq_liquido(
	inflamable bit not null,
	tipo_envase character varying(20) not null,
	cond_traslado character varying(20) null,
	fk_id_prod_quim smallint not null
);
create table Pq_solido(
	forma character varying(20) not null,
	empaque_max int not null,
	fk_id_prod_quim smallint not null
);
alter table Producto_quimico_X_Producto_quimico 
	add constraint fk_pq_x_pq_producto_quimico 
	foreign key (fk_id_prod_quim_1) references Producto_quimico (id_prod_quim);
	
alter table Producto_quimico_X_Producto_quimico 
	add constraint fk_pq_x_pq_producto_quimico_2 
	foreign key (fk_id_prod_quim_2) references Producto_quimico (id_prod_quim);	

alter table Envio
	add constraint fk_envio_producto_quimico
	foreign key (fk_id_prod_quim) references Producto_quimico (id_prod_quim),
	add constraint fk_envio_cliente
	foreign key (fk_id_cliente) references Cliente (id_cliente);

alter table Cliente 
	add constraint fk_cliente_cliente
	foreign key (fk_id_cliente_garante) references Cliente (id_cliente);

alter table Pq_liquido
	add constraint fk_pq_liquido_producto_quimico
		foreign key (fk_id_prod_quim) references Producto_quimico (id_prod_quim),
	add constraint pk_pq_liquido
		primary key (fk_id_prod_quim);

alter table Pq_solido
	add constraint fk_pq_solido_producto_quimico
		foreign key (fk_id_prod_quim) references Producto_quimico (id_prod_quim),
	add constraint pk_pq_solido
		primary key (fk_id_prod_quim);