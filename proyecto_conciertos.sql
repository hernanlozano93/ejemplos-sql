
-- Ejemplo filtro de conciertos.
DROP TABLE IF EXISTS conciertos;
CREATE TABLE conciertos (
	nombre VARCHAR(80) NOT NULL DEFAULT '',
	grupos VARCHAR(160) NOT NULL DEFAULT '',
	lugar VARCHAR(160) NOT NULL DEFAULT '',
	poblacion VARCHAR(40) NOT NULL DEFAULT '',
	fecha DATE NOT NULL,
	hora TIME,
	precio VARCHAR(60) NOT NULL,
	PRIMARY KEY (grupos,fecha)
);

insert into conciertos (nombre,grupos,lugar,poblacion,fecha,hora,precio) values
("Sant Joan a Valls 16","La Pegatina,Mostassa,Dr.Calypso,Smoking Souls","Aparcament Barri Antic","Valls",'2016-06-24','23:30:00',"Gratuit"),
("Canet Rock","Els Pets,La Pegatina,Manels,Els Catarres,","Recinte Canet Rock","Canet de Mar",'2016-07-03','23:30:00',"35 euros"),
("Musikn Viu","Els Catarres,Doctor Prats,Catfolkin,La Banda Biruji","Aparcament Barri Antic","Granollers",'2016-07-01','23:30:00',"Gratuit");
("Clownia 2016","Tex & Sun Flower Seed,Tiken Jah Fakoly,Els Catarres,Doctor Prats,Vendetta,Dj Txako","Recinte Clownia","Sant Joan de les Abadesses",'2016-06-24','23:30:00',"40 euros");
("Rebrot","Roba estesa,El Veïnat,KOP,Ebri Knight,La Banda Biruji,F.R.A.C.","Cardedeu","Cardedeu",'2016-07-02','22:00:00',"24 euros anticipasa, 28 euros taquilla.");
("FIRETA SANT JAUME 2016","Ebri Knight,Pepet i Marieta,TARANNÀ,Macondo PD","PLAÇA DE L'ESGLÉSIA","Campello (el)",'2016-07-02','22:30:00',"Gratuit");
("Festes Majors Sant Pere de Ribes 2016","Buhos,Veneno en la piel,PD KOP","Pl.Marcer.Ribes","Sant Pere de Ribes",'2016-06-29','01:30:00',"Gratuit");

-- Mostrar los conciertos gratis (Gratuit).
select * from conciertos where precio='Gratuit';

-- Mostrar los conciertos en un intérvalo de fechas.
select * from conciertos where fecha>='2016-06-28' and fecha<='2016-07-01';

-- Más adelante estableceré filtro por municipios y/o provincias

-- Más adelante hay que crear otra tabla de grupos; para poder hacer filtros por grupos.
-- Y mucho más adelante tavlas de de usuarios y de eventos.