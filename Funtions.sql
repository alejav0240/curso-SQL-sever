create or replace function f_duplicavalor (
    valor number
) return number is
begin
    return valor * 2;
end f_duplicavalor;

select f_duplicavalor(
    1000
) 
from dual;


create or replace function f_costo (
    valor number
) return varchar is
    texto varchar(20);
begin
    texto := ' ';
    if valor <= 500 then
        texto := 'Precio Moderado';
    else
        texto := 'Precio Alto';
    end if;
    return texto;
end f_costo;

select titulo,
    autor,
    precio,
    f_costo(precio) as costo
from libros;