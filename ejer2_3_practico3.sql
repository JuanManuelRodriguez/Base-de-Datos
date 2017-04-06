select apellido
from unc_esq_voluntario.voluntario v, unc_esq_voluntario.tarea t
where v.id_tarea=t.id_tarea and t.nombre_tarea='ATENCION DE ROPERITOS' or t.nombre_tarea='ORGANIZACION CAMPAMENTOS RECREATIVOS'
 and v.horas_aportadas!=2500 and v.horas_aportadas!=3500 and v.horas_aportadas!=7000;
 