select (apellido||', '||nombre) as "Apellido y Nombre",e_mail as "Direccion de mail"
from unc_esq_peliculas.empleado
where telefono like '600%';