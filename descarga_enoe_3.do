** Do file para calcular indicadores de ENOE;

		#delimit;
						clear all;
						set mem 1g;
						log close _all;
						set more off;
						set timeout1 60;
	
**Directorio de trabajo;
cd "C:\";

*Se crea carpeta;
capture mkdir "datos";

cd "C:\datos";
*Se crea carpeta;
capture mkdir "enoe";
*Se cambia nuevamente el directorio de trabajo incorporando carpeta creada;
cd "C:\datos\enoe";

***Esta primera parte corresponde a la descarga de los archivos TRIMESTRALES SDEMT de la ENOE de 2005 a 2021;
***En esta descarga NO se incluyen los datos de la ETOE;


***********************************************;
***Descarga de datos de 2005 a 2009;
***********************************************;
quietly forvalues i=5(1) 9 {;
quietly forvalues j=1(1) 4 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/200`i'trim`j'_csv.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "COE1T`j'0`i'.csv";
capture erase "COE2T`j'0`i'.csv";
capture erase "VIVT`j'0`i'.csv";
capture erase "HOGT`j'0`i'.csv";

};
};


**Borrar zip;
capture erase "archivos.zip";
