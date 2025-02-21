
Algoritmo Proyecto4
	
	
	//Definición de variables globales.
	Definir opcion Como Entero;
	Definir ingresoTeclado Como Caracter;
	Definir tipoTarifa Como Entero;
	Definir horaEntrada Como Entero;
	Definir contadorVehiculos Como Entero;
	Definir guardarHoraEntrada Como Entero;
	Definir montoPagar Como Entero;
	Definir montoRecaudado Como Entero;
	
	// Incialización de variables globales
	ingresoTeclado = ' ';
	tipoTarifa = 0;
	horaEntrada = 0;
	contadorVehiculos = 0;
	guardarHoraEntrada = 0;
	montoPagar = 0;
	montoRecaudado = 0;
	
	//Definición de matrices
	Definir matrizEstacionamiento Como Entero;
	Definir matrizHoraEntrada Como Entero;
	
	//Dimensionar las matrices.
	Dimension matrizEstacionamiento[6,10];
	Dimension matrizHoraEntrada[6,10];
	
	//Invoca los subproceseos.
	LlenarEstacionamiento(matrizEstacionamiento);
	EstablecerHoras(matrizHoraEntrada, matrizEstacionamiento);
	
//-------------Menú Principal------------------------------------------
	
	Repetir
		
		Limpiar Pantalla;
		Escribir "Menú Principal";
		Escribir "1. Visualizar Estacionamiento";
		Escribir "2. Ingresar Vehículo";
		Escribir "3. Retirar Vehículo";
		Escribir "4. Reporte Diario";
		Escribir "5. Salir";
		Escribir "Ingrese la opción deseada: ", Sin Saltar;
		Leer opcion;
		
		Segun opcion Hacer
			1:
				MostrarMatriz( matrizEstacionamiento, matrizHoraEntrada);
			2:
				IngresarVehiculo( matrizEstacionamiento, matrizHoraEntrada, tipoTarifa, horaEntrada );
			3:
				RetirarVehiculo( matrizEstacionamiento, matrizHoraEntrada, tipoTarifa, guardarHoraEntrada, montoPagar, contadorVehiculos, montoRecaudado );
			4: 
				ReporteDiario(montoRecaudado, contadorVehiculos);
			5:
				Escribir "Saliendo del Programa...";
				Escribir "Click en el icono de la X para cerrar el programa.";
			De Otro Modo:
				Escribir "Opción Inválida";
		FinSegun
		
		Leer ingresoTeclado;
	Hasta Que ingresoTeclado <> ''; // Espera un enter por parte del usuario.
	
	
	
FinAlgoritmo

//--------------------------------------------------------------------
//Definición de Sub Procesos.

//Función LlenarEstacionamiento.
SubProceso LlenarEstacionamiento (matrizEstacionamiento)
	
	Definir f Como Entero;
	Definir c Como Entero;
	
//Inicialización de variables.
	f = 0;
	c = 0; 
	
	//Llenado de la matrizEstacionamiento
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			matrizEstacionamiento[f, c] = Azar(3); //numeros aleatrios entre 0 y 2.
		FinPara
	FinPara
	
FinSubProceso


//Función EstablecerHoras.
SubProceso EstablecerHoras (matrizHoraEntrada, matrizEstacionamiento)
	
	Definir f Como Entero;
	Definir c Como Entero;
	
	//Inicialización de variables.
	f = 0;
	c = 0; 
	
	//Llenado de la matrizHoraEntrada
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			//Asigna 00 a la matrizHoraEntrada si hay una tarifa diaria, caso contrario le asigna un número aleatrio entre 6 y 21.
			Si matrizEstacionamiento[f, c] = 2 Entonces
				matrizHoraEntrada[f, c] = 0;
			SiNo
				matrizHoraEntrada[f, c] = Azar(16) + 6; //numeros aleatrios entre 6 y 21.
			FinSi
		FinPara
	FinPara
	
FinSubProceso

//Función MostrarMatriz.
SubProceso MostrarMatriz ( matrizEstacionamiento, matrizHoraEntrada )
	
	Definir f Como Entero;
	Definir c Como Entero;
	
	//Inicialización de variables.
	f = 0;
	c = 0; 
	
	Limpiar Pantalla;
	Escribir "Estado del Estacionamiento";
	Escribir "0 = Disponible, 1 = T Hora, 2 = T Diaria";
	Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
	Escribir "------------------------------------------------------------------------------------------";
	
	//Llenado de la matrizEstacionamiento.
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Segun f Hacer
			0:
				Escribir  Sin Saltar "F0     ";
			1:
				Escribir Sin Saltar "F1     ";
			2:
				Escribir Sin Saltar "F2     ";
			3:
				Escribir Sin Saltar "F3     ";
			4:
				Escribir Sin Saltar "F4     ";
			5:
				Escribir Sin Saltar "F5     ";
				
			De Otro Modo:
				Escribir "Fuera de rango";
		FinSegun
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			Escribir  "0", matrizEstacionamiento[f, c], "       ", Sin Saltar;
		FinPara
		Escribir "";
	FinPara
	
	Escribir "";
	Escribir "Hora de Entrada (Tarifa x Hora)";
	Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
	Escribir "-------------------------------------------------------------------------------------------";
	
	//Llenado de la matrizHoraEntrada.
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Segun f Hacer
			0:
				Escribir  Sin Saltar "F0     ";
			1:
				Escribir Sin Saltar "F1     ";
			2:
				Escribir Sin Saltar "F2     ";
			3:
				Escribir Sin Saltar "F3     ";
			4:
				Escribir Sin Saltar "F4     ";
			5:
				Escribir Sin Saltar "F5     ";
				
			De Otro Modo:
				Escribir "Fuera de rango";
		FinSegun
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			Si matrizHoraEntrada[f, c] < 10 Entonces
				Escribir  "0", matrizHoraEntrada[f, c], "       ", Sin Saltar;
			SiNo
				Escribir matrizHoraEntrada[f, c], "       ", Sin Saltar;
			FinSi
			
		FinPara
		Escribir "";
	FinPara
	
	
FinSubProceso

//Función IngresarVehiculo.
SubProceso IngresarVehiculo ( matrizEstacionamiento, matrizHoraEntrada, tipoTarifa, horaEntrada )
	
	Limpiar Pantalla;
	
	Definir f Como Entero;
	Definir c Como Entero;
	Definir ultimaFila Como Entero;
	Definir ultimaColumna Como Entero;
	
	//Incialización de variables
	
	f = 0;
	c = 0;
	ultimaFila = 0;
	ultimaColumna = 0;
	
	//Genera aleatoriamente la hora (06-21) de entrada de los vehículos 
	horaEntrada = Azar(16) + 6;
	
	//Valida y busca el último espacio en el la matrizEstacionamiento.
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			Si matrizEstacionamiento[f, c] == 0 Y matrizEstacionamiento[f, c] == 0 Entonces
				ultimaFila = f;
				ultimaColumna = c;
			FinSi
		FinPara
	FinPara
	
	Escribir "---------------------------------- Ingresar Vehículo --------------------------------------";
	Escribir "Fila: ", ultimaFila, "  Estacionamiento: ", ultimaColumna;	
	Escribir "Tipo de Tarifa: 1-Horas     2-Días";
	Leer tipoTarifa;
	
	//Validación y asignación de la variable tipoTarifa y horaEntrada.
	Repetir
		Segun tipoTarifa Hacer
			1:
				matrizEstacionamiento[ultimaFila, ultimaColumna] = tipoTarifa;
				matrizHoraEntrada[ultimaFila, ultimaColumna] = horaEntrada;
			2:
				matrizEstacionamiento[ultimaFila, ultimaColumna] = tipoTarifa;
				matrizHoraEntrada[ultimaFila, ultimaColumna] = 0;
			De Otro Modo:
				Escribir "Tarifa no existente, ingrese de nuevo el tipo de tarifa. Tipo de Tarifa: 1 -Horas     2-Días";
				Leer tipoTarifa;
				Si tipoTarifa == 2 Entonces
					matrizEstacionamiento[ultimaFila, ultimaColumna] = tipoTarifa;
					matrizHoraEntrada[ultimaFila, ultimaColumna] = 0;
				SiNo
					matrizEstacionamiento[ultimaFila, ultimaColumna] = tipoTarifa;
					matrizHoraEntrada[ultimaFila, ultimaColumna] = horaEntrada;
				FinSi
				
		FinSegun
	Hasta Que tipoTarifa >= 1 Y tipoTarifa <= 2;
	
	//Validación de imprimir la varible horaEntrada == 0 si tipoTarifa == 2 	
	Si tipoTarifa == 2 Entonces
		horaEntrada = 0;
	SiNo
		horaEntrada = horaEntrada;
	FinSi
	
	
	Escribir "Hora de Entrada: ", horaEntrada;
		
		//Muestra las matrices.
		Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
		Escribir "------------------------------------------------------------------------------------------";
		
		//Llenado de la matrizEstacionamiento.
		Para f = 0 Hasta 5 Con Paso 1  Hacer
			Segun f Hacer
				0:
					Escribir  Sin Saltar "F0     ";
				1:
					Escribir Sin Saltar "F1     ";
				2:
					Escribir Sin Saltar "F2     ";
				3:
					Escribir Sin Saltar "F3     ";
				4:
					Escribir Sin Saltar "F4     ";
				5:
					Escribir Sin Saltar "F5     ";
					
				De Otro Modo:
					Escribir "Fuera de rango";
			FinSegun
			Para c = 0 Hasta 9 Con Paso 1  Hacer
				Escribir  "0", matrizEstacionamiento[f, c], "       ", Sin Saltar;
			FinPara
			Escribir "";
		FinPara
		
		Escribir "";
		Escribir "";
		Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
		Escribir "-------------------------------------------------------------------------------------------";
		
		//Llenado de la matrizHoraEntrada.
		Para f = 0 Hasta 5 Con Paso 1  Hacer
			Segun f Hacer
				0:
					Escribir  Sin Saltar "F0     ";
				1:
					Escribir Sin Saltar "F1     ";
				2:
					Escribir Sin Saltar "F2     ";
				3:
					Escribir Sin Saltar "F3     ";
				4:
					Escribir Sin Saltar "F4     ";
				5:
					Escribir Sin Saltar "F5     ";
					
				De Otro Modo:
					Escribir "Fuera de rango";
			FinSegun
			Para c = 0 Hasta 9 Con Paso 1  Hacer
				Si matrizHoraEntrada[f, c] < 10 Entonces
					Escribir  "0", matrizHoraEntrada[f, c], "       ", Sin Saltar;
				SiNo
					Escribir matrizHoraEntrada[f, c], "       ", Sin Saltar;
				FinSi
				
			FinPara
			Escribir "";
		FinPara
		

	
	
FinSubProceso

//Función RetirarVehiculo.
SubProceso RetirarVehiculo ( matrizEstacionamiento, matrizHoraEntrada, tipoTarifa, guardarHoraEntrada, montoPagar, contadorVehiculos Por Referencia, montoRecaudado Por Referencia )
	
	Limpiar Pantalla;
	//Definición de variables.
	Definir f Como Entero;
	Definir c Como Entero;
	Definir fila Como Entero;
	Definir columna Como Entero;
	Definir ultimaFila Como Entero;
	Definir ultimaColumna Como Entero;

	
	//Incialización de variables.
	f = 0;
	c = 0;
	fila = 0;
	columna = 0;

	//Muestra las matrices.
	Escribir "---------------------------------- Retirar Vehículo --------------------------------------";
	Escribir "";
	Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
	Escribir "------------------------------------------------------------------------------------------";
	
	//Llenado de la matrizEstacionamiento.
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Segun f Hacer
			0:
				Escribir  Sin Saltar "F0     ";
			1:
				Escribir Sin Saltar "F1     ";
			2:
				Escribir Sin Saltar "F2     ";
			3:
				Escribir Sin Saltar "F3     ";
			4:
				Escribir Sin Saltar "F4     ";
			5:
				Escribir Sin Saltar "F5     ";
				
			De Otro Modo:
				Escribir "Fuera de rango";
		FinSegun
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			Escribir  "0", matrizEstacionamiento[f, c], "       ", Sin Saltar;
		FinPara
		Escribir "";
	FinPara
	
	Escribir "";
	Escribir "";
	Escribir "       ", "E0", "       ", "E1", "       ", "E2", "       ", "E3", "       ", "E4", "       ", "E5", "       ", "E6", "       ", "E7", "       ", "E8", "       ", "E9";
	Escribir "-------------------------------------------------------------------------------------------";
	
	//Llenado de la matrizHoraEntrada.
	Para f = 0 Hasta 5 Con Paso 1  Hacer
		Segun f Hacer
			0:
				Escribir  Sin Saltar "F0     ";
			1:
				Escribir Sin Saltar "F1     ";
			2:
				Escribir Sin Saltar "F2     ";
			3:
				Escribir Sin Saltar "F3     ";
			4:
				Escribir Sin Saltar "F4     ";
			5:
				Escribir Sin Saltar "F5     ";
				
			De Otro Modo:
				Escribir "Fuera de rango";
		FinSegun
		Para c = 0 Hasta 9 Con Paso 1  Hacer
			Si matrizHoraEntrada[f, c] < 10 Entonces
				Escribir  "0", matrizHoraEntrada[f, c], "       ", Sin Saltar;
			SiNo
				Escribir matrizHoraEntrada[f, c], "       ", Sin Saltar;
			FinSi
			
		FinPara
		Escribir "";
	FinPara
	
	Escribir "";
	
	//Solicita al usuario la fila y la columna donde se encuentra el vehículo,
	//valida también que la fila y la columna ingresada por el uusario no esten fuera de rango de la matriz.
	Repetir
		Escribir "Ingrese la fila dónde está estacionado el vehículo: (0-5)";
		Leer fila;
		Si fila >= 6 Entonces
			Escribir "Error la fila ingresada está fuera de rango: (0-5)";
		FinSi
	Hasta Que fila >= 0 Y fila <= 5
	
	Repetir
		Escribir "Ingrese el número de estacionamiento: (0-9)";
		Leer columna;
		Si columna >= 10 Entonces
			Escribir "Error la columna ingresada está fuera de rango: (0-9)";
		FinSi
	Hasta Que columna >= 0 Y columna <= 9
	
	//Valida que la posición del estacionamiento no este vacia.
	Repetir
		Si matrizEstacionamiento[fila, columna] == 0 Entonces
			Escribir "Error, esa posición del estacionamiento esta vacia, Buscar una posición ocupada ";
			Escribir "Ingrese la fila donde está estacionado el vehículo: (0-5)";
			Leer fila;
			Escribir "Ingrese el número de estacionamiento: (0-9)";
			Leer columna;
		FinSi
	Hasta Que matrizEstacionamiento[fila, columna] <> 0 
	
	guardarHoraEntrada = matrizHoraEntrada[fila, columna];
	matrizEstacionamiento[fila, columna] = 0;
	matrizHoraEntrada[fila, columna] = 0;
	
	Escribir "TARIFA POR HORA";
	
	Si guardarHoraEntrada == 0 Entonces
		montoPagar = 5000;
		Escribir "Monto a pagar: ", montoPagar;
	SiNo
		Escribir "Hora de Entrada: ", guardarHoraEntrada;
		Escribir "Hora de Salida: ", guardarHoraEntrada + 1;
		montoPagar = (guardarHoraEntrada + 1 - guardarHoraEntrada) * 1000;
		Escribir "Monto a pagar: ", montoPagar;
	FinSi
	
	contadorVehiculos = contadorVehiculos + 1; //Contador de Vehículos procesados.
	montoRecaudado = montoRecaudado + montoPagar;
	
FinSubProceso

//Función ReporteDiario.
SubProceso ReporteDiario (montoRecaudado, contadorVehiculos)
	
	Limpiar Pantalla;
	Escribir "Reporte Diario";
	Escribir "---------------------------------------------------------";
	Escribir "Vehículos Procesados: ", contadorVehiculos;
	Escribir "Monto Recaudado: ", montoRecaudado;
	Esperar Tecla;

FinSubProceso