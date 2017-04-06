select min(horas_aportadas), max(horas_aportadas), avg(horas_aportadas)
from unc_esq_voluntario.voluntario 
where extract(year from fecha_nacimiento)>=1990;