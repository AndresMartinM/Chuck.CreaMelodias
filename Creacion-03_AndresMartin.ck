/*
Generador de melodias
Andres Martin
ChucK 2022
*/

// nota inicial
432.0 => float fUno;

// cantidad de notas
20 => int pasos;
//cantidad de notas en la melodia
8 => int modo;

//notas a generar
float notas[pasos];

//notas a tocar
float escala[modo];

// medida de los pasos de la escala de fracuencias
Math.pow(2, 1.0/pasos) => float multiplo;

//Generación de la escala
for (0 => int i; i < notas.cap(); i++) {
    
    fUno *
    Math.pow(multiplo, i) => notas[i];
    
}
//Selección de las frecuencias a usar para la melodía
for (0 => int i; i < escala.cap(); i++) {
    notas[Math.random2( 0, notas.cap()-1)] => escala[i];
    <<<escala[i]>>>;
}

//Instrumento

SinOsc oscilador => dac;
0.45 => oscilador.gain;

for (0 => int i; i <= 12; i++) {
    escala[Math.random2(0, escala.cap() -1)]
    => oscilador.freq;
    0.2 :: second => now;
}
