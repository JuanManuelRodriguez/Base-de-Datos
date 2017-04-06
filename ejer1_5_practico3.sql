select (nombre||', '||apellido) as "nombre apellido", to_char(fecha_nacimiento,'dd/mm') as fecha_cumpleanos  
from unc_esq_peliculas.empleado 
order by to_char(fecha_nacimiento,'mm/dd') asc;