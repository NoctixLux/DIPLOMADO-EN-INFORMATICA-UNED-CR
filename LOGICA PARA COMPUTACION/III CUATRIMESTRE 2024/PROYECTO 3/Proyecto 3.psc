Algoritmo Proyecto3
	
	//Definci�n de Variables
	Definir opcion Como Entero;
	Definir ingresoTeclado Como Caracter;
	Definir contador Como Entero;
	Definir contador2 Como Entero;
	Definir diasSemana Como Entero; //Fila.
	Definir horariosLectura Como Entero; //Columna.
	
	//Definici�n de vectores y matriz.
	Definir matrizTemperaturas Como Entero;
	Definir temperaturaMinima Como Entero;
	Definir temperaturaMaxima Como Entero;
	Definir promedioTemperatura Como Real;
	
	//Inicializaci�n de variables globales.
	contador = 0;
	contador2 = 0;
	ingresoTeclado = ' ';
	
	//Definici�n de la Dimension de las matrices y vectores.
	Dimension temperaturaMinima[7] = 0;
	Dimension temperaturaMaxima[7] = 0;
	Dimension promedioTemperatura[7] = 0.0;
	Dimension matrizTemperaturas[7, 8];
	
	Repetir
		
		Limpiar Pantalla;
		Escribir "Men� Principal";
		Escribir "1. Inicializar matrices y vectores";
		Escribir "2. Cargar Temperaturas";
		Escribir "3. Reporte Temperaturas";
		Escribir "4. Salir";
		
		Leer opcion;
		
		Segun opcion Hacer
			//Opci�n 1 del Men�	.
			1:
				Limpiar Pantalla;
				Escribir "                                   Control de Temperatura AV - Data Center";
				
				//Inicializaci�n de Variables.
				diasSemana = 0;
				horariosLectura = 0;
				contador = 0;
				
				//Incializacion de la matriz en cero.
				Para diasSemana = 0 Hasta 6 Con Paso 1 Hacer
					Para horariosLectura = 0 Hasta 7 Con Paso 1 Hacer
						matrizTemperaturas[diasSemana, horariosLectura] = 0;
					FinPara
				FinPara
				
				Escribir "";
				Escribir "       ", "00", "       ", "03", "       ", "06", "       ", "09", "       ", "12", "       ", "15", "       ", "18", "       ", "21", "       ", "Min", "       ", "May", "       ", "Promedio";
				Escribir "____________________________________________________________________________________________________________";
				
				//Mostrar en Pantalla el contenido de la matriz.
				Para diasSemana = 0 Hasta 6 Con Paso 1 Hacer
					contador = contador + 1;
					Segun diasSemana Hacer
						0:
							Escribir  Sin Saltar "Lun    ";
						1:
							Escribir Sin Saltar "Mar    ";
						2:
							Escribir Sin Saltar "Mi�    ";
						3:
							Escribir Sin Saltar "Jue    ";
						4:
							Escribir Sin Saltar "Vie    ";
						5:
							Escribir Sin Saltar "S�b    ";
						6:
							Escribir Sin Saltar "Dom    ";
						De Otro Modo:
							Escribir "Fuera de rango";
					FinSegun
					
					Para horariosLectura = 0 Hasta 7 Con Paso 1 Hacer
						Escribir Sin Saltar matrizTemperaturas[diasSemana, horariosLectura], "        "; //Imprime cada elemento seguido de un espacio.
					FinPara
					Escribir " "; //Salto de l�nea al final de cada fila.
				FinPara
				
			//Opci�n 2 del Men�		
			2:
				Limpiar Pantalla;
				
				Si contador <> 0 Entonces
					Para diasSemana = 0 Hasta 6 Con Paso 1 Hacer
						Para horariosLectura = 0 Hasta 7 Con Paso 1 Hacer
							matrizTemperaturas[diasSemana, horariosLectura] = Azar(26) + 10; //Genera numeros aleatorios entre 10 y 35.
						FinPara
					FinPara
					
					Escribir "                                   Control de Temperatura AV - Data Center";
					Escribir "";
					Escribir "       ", "00", "       ", "03", "       ", "06", "       ", "09", "       ", "12", "       ", "15", "       ", "18", "       ", "21", "       ", "Min", "       ", "May", "       ", "Promedio";
					Escribir "____________________________________________________________________________________________________________";
					
					//Mostrar en Pantalla el contenido de la matriz.
					Para diasSemana = 0 Hasta 6 Con Paso 1 Hacer
						contador = contador + 1;
						contador2 = contador2 + 1;
						Segun diasSemana Hacer
							0:
								Escribir  Sin Saltar "Lun    ";
							1:
								Escribir Sin Saltar "Mar    ";
							2:
								Escribir Sin Saltar "Mi�    ";
							3:
								Escribir Sin Saltar "Jue    ";
							4:
								Escribir Sin Saltar "Vie    ";
							5:
								Escribir Sin Saltar "S�b    ";
							6:
								Escribir Sin Saltar "Dom    ";
							De Otro Modo:
								Escribir "Fuera de rango";
						FinSegun
						
						Para horariosLectura = 0 Hasta 7 Con Paso 1 Hacer
							Escribir Sin Saltar matrizTemperaturas[diasSemana, horariosLectura], "       "; //Imprime cada elemento seguido de un espacio.
						FinPara
						Escribir " "; //Salto de l�nea al final de cada fila.
					FinPara
					
				SiNo
					Escribir "Inicialice primero los vectores y matrices en la opci�n 1.";
				FinSi
			
			//Opci�n 3 del Men�	
			3:
				Limpiar Pantalla;
				Si contador2 <> 0 Entonces
					
					Escribir "                                   Control de Temperatura AV - Data Center";
					Escribir "";
					Escribir "       ", "00", "       ", "03", "       ", "06", "       ", "09", "       ", "12", "       ", "15", "       ", "18", "       ", "21", "       ", "Min", "       ", "May", "       ", "Promedio";
					Escribir "____________________________________________________________________________________________________________";
					
					Para diasSemana = 0 Hasta 6 Con Paso 1 Hacer
						
						temperaturaMinima[diasSemana] = 999; // Inicializa con un valor muy alto, para encontrar asi el m�nimo valor.
						temperaturaMaxima[diasSemana] = -999; // Inicializa con un valor muy bajo, para encontrar asi el m�ximo valor.
						promedioTemperatura[diasSemana] = 0;
						
						Segun diasSemana Hacer
							0:
								Escribir  Sin Saltar "Lun    ";
							1:
								Escribir Sin Saltar "Mar    ";
							2:
								Escribir Sin Saltar "Mi�    ";
							3:
								Escribir Sin Saltar "Jue    ";
							4:
								Escribir Sin Saltar "Vie    ";
							5:
								Escribir Sin Saltar "S�b    ";
							6:
								Escribir Sin Saltar "Dom    ";
							De Otro Modo:
								Escribir "Fuera de rango";
						FinSegun
						
						Para horariosLectura = 0 Hasta 7 Con Paso 1 Hacer
							// Calcula m�nimo y m�ximo
							Si matrizTemperaturas[diasSemana, horariosLectura] < temperaturaMinima[diasSemana] Entonces
								temperaturaMinima[diasSemana] = matrizTemperaturas[diasSemana, horariosLectura];
							FinSi
							Si matrizTemperaturas[diasSemana, horariosLectura] > temperaturaMaxima[diasSemana] Entonces
								temperaturaMaxima[diasSemana] = matrizTemperaturas[diasSemana, horariosLectura];
							FinSi
							
							// Acumular para el promedio
							promedioTemperatura[diasSemana] = promedioTemperatura[diasSemana] + matrizTemperaturas[diasSemana, horariosLectura];
							Escribir Sin Saltar matrizTemperaturas[diasSemana, horariosLectura], "       "; //Imprime cada elemento seguido de un espacio.
							
						FinPara
						
						// Calcula el promedio
						promedioTemperatura[diasSemana] = promedioTemperatura[diasSemana] / 8;
						
						// Mostrar resultados
						Escribir, "", temperaturaMinima[diasSemana], "        ", temperaturaMaxima[diasSemana], "         ", promedioTemperatura[diasSemana];
						Escribir "   "; //Salto de l�nea al final de cada fila.
					FinPara
					
				SiNo
					Escribir "No puede ingresar a la opci�n 3 del men�, sin haber cargado las temperaturas de la matriz.";
				FinSi
				
			4: 
				Limpiar Pantalla;
				Escribir "Presione 4 de nuevo para salir.";
				
			De Otro Modo:
				Escribir "Opci�n Inv�lida, presione enter para continuar.";
		FinSegun
		
		Leer ingresoTeclado;
	
	Hasta Que ingresoTeclado <> ''; // Espera un enter por parte del usuario.
	
	
FinAlgoritmo
