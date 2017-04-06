create table Aspirante(
	id_aspirante smallint not null,
	nombre character varying(50) not null,
	direccion character varying(50) not null,
	primary key (id_aspirante)
);
create table Curso(
	id_curso smallint not null,
	titulo character varying(50) not null,
	monto_cuota decimal(5,2) not null,
	cant_cuotas smallint not null,
	primary key (id_curso)
);
create table Inscripto_en(
	id_aspirante smallint not null,
	id_curso smallint not null,
	cant_cuotas_adeuddas smallint not null,
	fk_nombre_instructor character varying(50) not null,
	fk_id_curso smallint not null,
	primary key (id_aspirante, id_curso)
);
create table Instructor(
	nombre_instructor character varying(50) not null,
	telefono character varying(30) null,
	e_mail character varying(50) null,
	sueldo decimal(6,2) not null,
	sueldo_adicional decimal(6,2) null,
	primary key (nombre_instructor)
);
create table Participacion_curso(
	fk_nombre_instructor character varying(50) not null,
	fk_id_curso smallint not null,
	cargo character varying(30) not null,
	primary key (fk_nombre_instructor, fk_id_curso)
);

alter table Participacion_curso
	add constraint fk_participacion_curso_instructor
	foreign key (fk_nombre_instructor) references Instructor(nombre_instructor),
	add constraint fk_participacion_curso_curso
	foreign key (fk_id_curso) references Curso(id_curso);

alter table Inscripto_en
	add constraint fk_Inscripto_en_curso
	foreign key (id_curso) references Curso(id_curso),
	add constraint fk_Inscripto_en_aspirante
	foreign key (id_aspirante) references Aspirante(id_aspirante),
	add constraint fk_Inscripto_en_participacion_curso
	foreign key (fk_nombre_instructor,fk_id_curso) references Participacion_curso(fk_nombre_instructor,fk_id_curso);