select codigo_pelicula,count(*) from unc_esq_peliculas.renglon_entrega
group by codigo_pelicula having count(codigo_pelicula) between 3 and 5;