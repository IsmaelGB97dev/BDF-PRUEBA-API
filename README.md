# WEB API REST
------------
## Información General
La solución cuenta con las siguientes capas, las cuales fueron creadas como distintos proyectos de tipo Biblioteca de clases (.NET Framework 4.8) y un proyecto de tipo Aplicación Web ASP.NET (.NET Framework 4.8) con plantilla de API Web, a continuación se explican las capas:

#### Capas en la solución
- **DataAccess**: Esta capa contiene una clase llamada DA la cual posee un metodo, el cual retorna la cadena de conexion definida en el WebConfig, también tiene las diversas clases categorizadas según las entidades con las que se interactuara con la base de datos (Cliente, Catalogos, Prestamos, etc), en estas clases unicamente se realiza la comunicación directa con la Base de Datos, mediante ADO.NET.

- **LogicaNegocio**: Esta capa contiene las clases igualmente categorizadas que en la capa de accesos a datos, está capa es la intermediaria entre el cliente y los datos, en ella validamos y aplicamos las diversas reglas de negocio

- **Models**: Es la capa que posee todas las clases que representan las diversa entidades, con sus respectivas propiedades, esto para poder encapsular las diversas respuestas o solicitud de datos.

- **Utils**: En esta capa podemos agregar todas las utilidades generales para el proyecto, en ella tenemos la clase Respuesta, la cual usamos en la todas las capas para encapsular los resultados, para dar un solo formato de respuesta en nuestros EndPoints, dicha clase posee los metodos necesarios para el registro de errores (se crea un archivo con las Exceptions, en la raiz del proyecto web en la carpeta ~/Logs, agregar carpeta si no existe).

- **Test**: Este es el proyecto Web ASP.NET, con plantilla de API Rest, para una mejor documentación y referencia de la API y sus EndPoints se agrega la libreria SWAGGER y se configura la ruta inicial del proyecto, ejemplo(https://localhost:1200/swagger).

**Nota:** En el archivo WebConfig debemos de definir la cadena de conexión, según el Server (Data Source) y el nombre de la base de datos (Initial Catalog).



