const robot = require("robotjs");
const db = require('quick.db');
const lepikEvents = require('lepikevents');

/**
 *         OPCIONES
 *  @param intervalo : type: string, default: '3'
 *  @param inicio : type: string, default: '0'
 *  @param clicks : type: boolean, default: false
 *  @param autoapagado : type: boolean, default: false
 *  @param autolimite : type: boolean, default: false
 *  @param tiempolimite : type: string, default: '15'
 *  @param modoseguro : type: boolean, default: false
 *  @param modosegurotiempo : type: string, default: '501'
 * 
**/

// Opciones
const intervalo = '3' // El intervalo de tiempo en segundos para hacer click
const inicio = '0' // El tiempo que tomará para empezar a ejecutar los clicks una vez iniciado el script
const clicks = false // ¿Debería iniciarse/apagarse al hacer click, o después del tiempo de inicio/límite?
const autoapagado = false // ¿Debería apagarse el autoclick una vez se mueva el mouse?
const autolimite = false // ¿Debería apagarse el autoclick una vez pase cierto tiempo?
const tiempolimite = '15' // Si la opción "autolimite" está activada, ¿Al pasar cuánto tiempo se apagará el autoclick?
const modoseguro = false // ¿Deberían hacerse clicks en un intervalo semi-aleatorio de tiempo para no ser detectado?
const modosegurotiempo = '501' // Con modo seguro, esta será la variación del intervalo en ms en el que se harán los clicks.

db.set('clicksdb', false)

if(clicks) {
    console.log(
        'Logs: \n' +
        'Autoclick manual iniciando en 5 segundos.'
    )
    setTimeout(() => {
        console.log('Iniciado')
    lepikEvents.events.on('mouseClick', (data) => {
        const clicks = db.get('clicksdb')
        if(clicks === false) {
        if(data[2] == 1) {
            console.log('1 ejecutado')

            function click() {
                console.log('ads')
                robot.mouseClick();
                db.set('clicksdb', true)
            }
            
            clickevento = setInterval(click, intervalo * 1000);

        } else {
            console.log('Ya está activo')
        }
        }
        if(data[2] == 2) {
            if(clicks === false) {
                console.log('El autoclick manual aún no está activo')
            } else {
            console.log('Click finalizado')
            clearInterval(clickevento)
            clearTimeout(clickevento)
            db.set('clicksdb', false)
                

            }
        }
    })
}, 5000)

} else {
console.log(
    'Logs: \n' +
    `Intervalo: ${intervalo} segundos \n` +
    `Tiempo de inicio: ${inicio} segundos \n` +
    `Autoapagado: ${autoapagado} \n` +
    `Autolimite: ${autolimite} \n` +
    `Tiempo limite: ${tiempolimite} segundos \n` +
    `Modo seguro: ${modoseguro} \n` +
    `Modo seguro tiempo: ${modosegurotiempo} milisegundos`
)
console.log(`El autoclicker iniciará en ${inicio} segundos`)
setTimeout(() => {
function click() {
    robot.mouseClick();
}

if(modoseguro) {
    (function modosegurofuncion(){
            click();
            modosegurovariable = setTimeout(modosegurofuncion, intervalo * 1000 + Math.floor(Math.random() * modosegurotiempo));
    })();
    
} else {
    intervalofuncion = setInterval(click, intervalo * 1000);
}

if(autoapagado) {
    console.log('Auto apagado encendido.')
    var mousepos = robot.getMousePos();
    db.set(`mouseposition`, `${mousepos.x}`);
    const mousepositionget = db.get('mouseposition')

    setInterval(function(){
    var mousepos2 = robot.getMousePos();
    if(`${mousepos2.x}` !== mousepositionget){
        console.log('El mouse ha cambiado de posición, por lo que el clicker ha sido detenido')
        if(modoseguro) { 
            clearTimeout(modosegurovariable);
        } else {
            clearTimeout(intervalofuncion);
        }
        process.exit()
    } else {
        console.log('El mouse está en posición')
    }
    }, 2000)
}

if(autolimite) { 
    console.log('Auto apagado por límite de tiempo encendido.')
    setTimeout(function(){
        if(modoseguro) { 
            clearTimeout(modosegurovariable);
        } else {
            clearTimeout(intervalofuncion);
        }
        console.log('El autoclick ha sido detenido por tiempo límite')
        process.exit()
    }, tiempolimite * 1000)
}

}, inicio * 1000)
}