# Tools UI

## ¿Qué es?

Se trata de un proyecto en Xcode 11.4 con ios 13.4 en el que se dessarrolla un menu flotante con opciones para ir a la vista 1 o la vista 2.

Se puede usar como plantilla para el desarrollo de aplicaciones. Personalmente ese uso le daré ya que está escrito.

## ¿Cómo usarlo?

Solo **descarga** el repositorio como **zip** y abre Tools.xcodeproj y listo. Támbien se puede hacer solo copiando los archivos de la vista y configurando la varibale del entorno.

## ¿Cómo Funciona?

Se trata de 4 vistas encimadas en un ZStack.

![](https://raw.githubusercontent.com/AOx0/Tools-UI/master/Pag1.png)

- La **primera** vista es un **inicializador** de variables que utilizan UserDefaults.
- La **segunda** vista es la que tiene que ver con el **menú**.
- La **tercera** y cuarta vista tienen que ver con **lo que el usuario verá** dependiendo de lo que se escoja en el menú.