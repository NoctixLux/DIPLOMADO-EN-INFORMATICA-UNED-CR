Algoritmo Proyecto2
	
	//Declaración de variables del programa.
	Definir opcion Como Caracter;
	Definir consumokWh Como Entero;
	Definir puntaAleatorio Como Entero;
	Definir valleAleatorio Como Entero;
	Definir nocturnoAleatorio Como Entero;
	Definir montoTRE Como Real;
	Definir montoTREH Como Real;
	Definir tarifaCobrar Como Real;
	Definir mensajeTarifa Como Cadena;
	Definir tarifaPunta Como Real;
	Definir tarifaValle Como Real;
	Definir tarifaNocturno Como Real;
	Definir bloque1 Como Real;
	Definir bloque2 Como Real;
	Definir bloque3 Como Real;
	Definir bloque4 Como Real;
	Definir tributoBomberos Como Real;
	Definir iva Como Real;
	Definir total Como Real;
	Definir facturasProcesadas Como Entero;
	Definir contadorSubtotal Como Real;
	Definir contadorTributoBomberos Como Real;
	Definir contadorIVA Como Real;
	Definir contadorTotal Como Real;
	
	//Inicialización de variables.
	bloque1 = 2107.8; //Monto Fijo.
	bloque2 = 0.0;
	bloque3 = 0.0;
	bloque4 = 0.0;
	facturasProcesadas = 0;
	contadorSubtotal = 0.0;
	contadorTributoBomberos = 0.0;
	contadorIVA = 0.0;
	contadorTotal = 0.0;
	
	Repetir
		
		//Operaciones para incluir el rango de los KWh, se agrega un +1 para incluir todo el rango.
		bloque2 = 70.26 * (200 - 31 + 1);
		bloque3 = 107.83 * (300 - 201 + 1);
		
		//Generar de manera aleatoria la cantidad de kWh.
		puntaAleatorio = Azar(200) + 1;
		valleAleatorio = Azar(200) + 1;
		nocturnoAleatorio = Azar(200) + 1;
		
		consumokWh = (puntaAleatorio + valleAleatorio + nocturnoAleatorio); // Consumo Total de kWh.
		bloque4 = 111.48 * (consumokWh - 301 + 1); //Operaciones para incluir el rango de los KWh.
		
		Escribir "Consumo kWh: ", consumokWh;
		Escribir "-------------------------------";
		Escribir "TARIFA RESIDENCIAL (TRE)";
		Escribir "Bloque 1: 0kWh-30kWh:", bloque1, " colones.";
		Escribir "Bloque 2: 31kWh-200kWh: ", bloque2, " colones.";
		Escribir "Bloque 3: 201kWh-300kWh: ", bloque3, " colones.";
		Escribir "Bloque 4: 301kWh y superior: ", bloque4, " colones.";
		montoTRE = bloque1 +  bloque2 + bloque3 + bloque4; // Calculo total de TRE
		Escribir "MontoTRE: ", montoTRE;
		Escribir "-------------------------------";
		
		//Cálculo para TREH
		tarifaPunta = puntaAleatorio * 162.66;
		tarifaValle = valleAleatorio * 66.68;
		tarifaNocturno = nocturnoAleatorio * 27.90;
		montoTREH = tarifaPunta + tarifaValle + tarifaNocturno;
		
		Escribir "TARIFA RESIDENCIAL HORARIA (TREH)";
		Escribir "Periodo Punta ", "(", puntaAleatorio, " kWh", "): ", tarifaPunta, " colones.";
		Escribir "Periodo Valle ", "(", valleAleatorio," kWh", "): ", tarifaValle,  " colones.";
		Escribir "Periodo Nocturno ", "(", nocturnoAleatorio, " kWh", "): ", tarifaNocturno, " colones.";
		Escribir "MontoTREH: ", montoTREH;
		Escribir "-------------------------------";
		
		//Compara cuál tarifa es menor.
		Si montoTRE < montoTREH Entonces
			tarifaCobrar = montoTRE;
			mensajeTarifa = " TARIFA RESIDENCIAL (TRE) ";
		SiNo
			tarifaCobrar = montoTREH;
			mensajeTarifa = " TARIFA RESIDENCIAL HORARIA (TREH) ";
		FinSi
		
		//Cálculo Tributo a Bomberos:
		tributoBomberos = (tarifaCobrar * 1.75) / 100;
		
		//Cálculo IVA:
		iva = (tarifaCobrar * 13) / 100;
		
		//Cálculo IVA:
		total = tarifaCobrar + tributoBomberos + iva;
		facturasProcesadas = facturasProcesadas + 1; //Contador de Tarifas Procesadas.
		Escribir "La tarifa a cobrar es la", mensajeTarifa, tarifaCobrar;
		contadorSubtotal = contadorSubtotal + tarifaCobrar; //Contador de Subtotal.
		Escribir "SubTotal: ", tarifaCobrar;
		contadorTributoBomberos = contadorTributoBomberos + tributoBomberos; // Contador de Tributo a Bomberos.
		Escribir "Tributo a Bomberos: ", tributoBomberos;
		contadorIVA = contadorIVA + iva; // Contador de IVA
		Escribir "IVA: ", iva;
		contadorTotal = contadorTotal + total;
		Escribir "Total: ", total;
		Escribir "-------------------------------";
		Escribir "¿Desea procesar otra factura? [S/N] " Sin Saltar;
		Leer opcion;
		//Validación de ingreso realizada por el usuario.
		Mientras opcion <> 's' Y opcion <> 'S' Y opcion <> 'n' Y opcion <> 'N' Hacer
			Escribir "ERROR ingrese S s N n " Sin Saltar;
			Leer opcion;
		FinMientras
		
	Hasta Que opcion = 'n' o opcion = 'N';
	
	Limpiar Pantalla;
	//Despliega en Pantalla un informe final.
	Escribir "Cantidad de facturas procesadas: ", facturasProcesadas;
	Escribir "Acumulado SubTotal: ", contadorSubtotal;
	Escribir "Acumulado Tributo Bomberos: ", contadorTributoBomberos;
	Escribir "Acumulado IVA: ", contadorIVA;
	Escribir "Acumulado Total: ", contadorTotal;
	
	
FinAlgoritmo