select id_departamento, count(id_departamento) from unc_esq_peliculas.empleado
group by id_departamento
order by id_departamento;