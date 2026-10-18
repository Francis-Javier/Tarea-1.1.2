# Tarea-1.1.2  

## Parte A. Investiga antes de modificar el entorno  

### 1. Vagrant y el Vagrantfile. Explica brevemente qué problema resuelve Vagrant y distingue el anfitrión, el proveedor de virtualización, la box y la máquina virtual. Averigua en qué lenguaje está escrito el `Vagrantfile`. Analiza el archivo inicial y, al terminar la práctica, comenta cada línea activa del archivo final: qué configura, por qué la añadiste y cómo compruebas que ha surtido efecto.  

### 2. Aprovisionamiento. Investiga qué es un provisioner, dónde se ejecuta el script, cuándo lo lanza Vagrant y qué diferencia hay entre `inline:` y `path:`. Explica qué ocurre si modificas el script después del primer `vagrant up` y cómo lo ejecutarías de nuevo.  

### 3. Interfaces y redes Investiga qué conexión de red configura Vagrant por defecto y para qué la utiliza. Averigua cómo se añade en el Vagrantfile una segunda interfaz con dirección IP fija. Compara NAT, red interna, red privada host-only y red pública: explica con quién puede comunicarse la máquina en cada caso y qué función cumple el reenvío de puertos.  
### Presta especial atención a la diferencia entre la red interna de VirtualBox y la red privada host-only de VMware. Investiga cómo se configura la segunda interfaz en el proveedor que utilices. ¿Añadirla elimina la NAT predeterminada? ¿El reenvío de puertos crea una interfaz nueva?  
### En la parte C configurarás una máquina con dos interfaces: NAT y red de laboratorio. Examina después sus direcciones y rutas de red, relaciona lo observado con el Vagrantfile e incluye un esquema de la arquitectura en tu README.md. Como solo hay una máquina, no se pide demostrar comunicación con otra VM.  

### 4. Órdenes y carpeta compartida. En una tabla breve, indica cuándo usarías `up`, `status`, `ssh`, `reload`, `provision`, `halt` y `destroy`; marca cuáles llegaste a ejecutar. Averigua qué es `/vagrant` y comprueba qué archivos aparecen allí.  

| Comando | Cuándo usarlo | ¿Ejecutado en la práctica? |
| :--- | :--- | :---: |
| **up** | Para crear y también encender la máquina virtual cuando este apagada | **Sí** |
| **status** | Para saber el estado actual de la máquina virtual, si esta encendida, apagada, funcionando, con un error, etc .. | **Sí** |
| **ssh** | Para conectarse desde el anfitrión (en la terminal) a la máquina virtual de forma segura | **Sí** |
| **reload** | Para reiniciar la máquina virtual, es necesario usarlo si se hacen cambios en los archivos de vagrant de la máquina | **Sí** |
| **provision** | Para forzar a que se ejecute el script de aprovisionamiento, el que instala apache | **Sí** |
| **halt** | Para apagar la máquina virtual de manera segura, deteniendo todos los procesos del sistema operativo | **Sí** |
| **destroy** | Para borrar por completo la máquina virtual así como sus archivos y sus discos duros | **Sí** |

## Parte B. Mi primera máquina en Vagrant  
Trabaja desde el directorio del `Vagrantfile`. Comprueba que el archivo es válido y arranca la máquina con el proveedor que tengas instalado: VirtualBox (Recomendada) o VMware Workstation Pro. **Entra por SSH. Comprueba el nombre de la máquina, la versión de Debian, las interfaces y las rutas de red.**  

En esta captura se puede ver que he usado el comando vagrant ssh para conectarme por ssh a la máquina virtual que he creado, y como se puede observar no hay ningun fallo y aparte cambia la ruta en terminal de la ruta de la carpeta de vagrant, a vagrant@javiervagrant el cual es el hostname que le puse a la máquina, por lo que funciona sin problemas, y tambien en la captura se puede observar que indica que versión de Debian esta instalada en este caso Debian 12 6.1.0-25-amd64.  
![Acceso con SSH a la máquina virtual](imagenes/Captura1)  

En esta captura se puede ver las interfaces de red con el comando ip a que tiene la máquina de vagrant que he creado, que como se puede ver hay tres, lo la cual es la interfaz local de la propia máquina, eth0 la cual es la interfaz de la red NAT, por eso su IP es la 10.0.2.15/24 ya que es una IP pública y la que va a necesitar Debian para poder comunicarse con internet, y la eth1 la cual es la red privada que se creo con la Ip 192.168.56.10/24.  
![Interfaces de red](imagenes/Captura2)  

En esta captura se puede ver que uso el comando ip route para ver las rutas de red que tiene la máquina de vagrant, como se puede ver en la linea default via 10.0.2.2 dev eth0 se define la puerta de enlace por defecto de la máquina la cual va a ser la interfaz NAT, por lo que todo el tráfico hacia el exterior pasara por ella, y en la linea 192.168.56.0/24 dev eth1, que todo el trafico de la red de laboratorio pase3 por la segunda interfaz que se añadió.(todas estas capturas se tomarón cuando ya se modifico el archivo de vagrant, por así decirlo sería el apartado B y C juntos).  
![Rutas de red](imagenes/Captura3)  


En esta captura se puede ver la máquina virtual en virtualbox cuando ya he acabado la práctica y esta apagada, la última la del nombre Máquina-vagrant-Javier.  
![Nombre de la máquina](imagenes/Captura6)  

## Parte C. Completa el Vagrantfile  
Modifica el archivo inicial para crear **una máquina Debian 12 con dos interfaces o adaptadores de red**:  

- Asigna un **hostname** identificable con tu nombre.  

- Conserva la **NAT que Vagrant configura por defecto** como primera interfaz. Identifica qué dirección y
ruta recibe dentro de Debian.  

- Añade una segunda interfaz con **IP fija en una red de laboratorio**. En VirtualBox configúrala como **red
interna**; en VMware Workstation Pro utiliza una red privada de tipo **host-only** y explica en `README.md`
la diferencia entre ambas modalidades. Puedes usar `192.168.56.10` como referencia si no entra en
conflicto con otra red del equipo.  

- Reenvía el puerto **80 de la máquina virtual al 8080 del anfitrión**, únicamente por `127.0.0.1`. Si el 8080
está ocupado, elige otro y justifícalo.  

- Vincular un script Bash de aprovisionamiento guardado en el repositorio

## Parte D. Aprovisiona Apache  
Crea un script Bash que instale Apache en Debian 12, active el servicio y escriba una página de inicio
sencilla. Esa página debe mostrar tu nombre y el hostname de la máquina. Investiga cómo volver a
ejecutar solo el aprovisionamiento después de modificarlo. Ejecútalo de nuevo y comprueba que el
servidor continúa funcionando.  

- 
