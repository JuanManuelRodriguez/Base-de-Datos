drop table if exists Articulo;
drop table if exists Palabra;
drop table if exists Articulo_x_Palabra;
create table Articulo(
	id_articulo smallint,
	titulo character varying(120) unique,
	autor character varying(30),
	fecha_pub date,
	nacional character(10),
	primary key (id_articulo)
);
create table Palabra(
	cod_p smallint,
	idioma character(2),
	descrip character varying(25),
	primary key(cod_p,idioma)
);
create table Articulo_x_Palabra(
	fk_palabra_cod_p smallint,
	fk_palabra_idioma character(2),
	fk_articulo_id_arcticulo smallint,
	primary key (fk_palabra_cod_p, fk_palabra_idioma, fk_articulo_id_arcticulo)
);
alter table Articulo_x_Palabra 
	add constraint fk_articulo_x_palabra_palabra 
		foreign key(fk_palabra_cod_p,fk_palabra_idioma) references Palabra(cod_p, idioma),
	add constraint fk_articulo_x_palabra_articulo 
		foreign key(fk_articulo_id_arcticulo) references Articulo(id_articulo);

