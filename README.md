# Ser Manos by equipo_estrella

Desarrollamos la aplicacion de Ser Manos en Flutter con Riverpod para manejo de estado y utilizando como backend a Firebase . Firebase Auth para la autenticación de usuarios, Firestore para el guardado de datos, es decir como base de datos no relacional para el proyecto, FirebaseStorage para almacenar las imagenes de perfil que decidan subir los usuarios y RemoteConfig para configurar feature flagging.

## Getting Started

Antes de ejecutar el proyecto se debe correr la linea:

```
flutter pub get
flutter pub run build_runner watch -d
```

Esto es para que se creen unos generators para Riverpod, posterior a esto, ya se puede ejecutar la app.

## Estructura de datos para el backend

Para la estructura de datos tenemos 3 colecciones importantes, `users`, `news` y `volunteerings`.

#### Users

En la tabla de `users` se inserta un nuevo documento con el id creado por `FirebaseAuth` para ese usuario y se completa con algunos datos llenados durante el proceso de registro. Pero despues puede adicionarsele los campos en la pantalla de `/editProfile`. Los campos de este documento son:

```
currVolunteering(string): "",
email(string):"pdey@itba.edu.ar",
id(string):"GfB62zZfEjadHXcg2hJBIKnNfpm1",
lastname(string):"dey",
name(string):"pat",
favVolunteering(Array): []

```

En el campo `favVolunteering` se almacenan los ids de los voluntariados que el usuario clickeo para que este en sus favoritos. Se tomo esta decision porque te de esta forma cuando se trae la informacion del usuario ya se sabe que voluntariados son los favoritos.

#### News

En la coleccion de `news` estan insertadas una noticia por documento. Donde cada documento contiene los siguientes campos:

```
body(string):"En un esfuerzo...",
category(string):"Reporte 2820",
imageUrl(string):"https://www.goog...",
subtitle(string):"Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
title(string):"Ser donante voluntario "
```

#### Volunteerings

En la coleccion de `volunteerings` esta insertado en cada documento un voluntariado. El id del voluntariado es el id del documento. Cada documento contiene los siguientes campos:

```
availability(string):"Disponible para personas mayores de edad con capacidad física.",
body(string):"Únete a nos...",
category(string):"Construcción"
id(string):"8jbK1Sd3iY2dQouMdnWG"
imageUrl(string):"https://t3.ftcdn.n..."
location(string):"Calle Solidaridad 123, Ciudad Esperanza"
pending(array): [], //lista de userids
requirements(string):"Edad mínima de 18 añ...",
subscribed(array): [],
subtitle(string):"La misión d...",
title(string):"Construyendo Hogares",
vacancies(number):8
```

Los campos `pending` y `subscribed` son ambos arrays en donde se listan ids de usuarios. En `pending` se anotan a las personas que se postulan para el voluntariado pero que no estan todavia inscriptos ya que requieren confirmacion del administrador. Luego cuando el administrador decide aprobar a un usuario lo quita de la lista `pending` y lo agrega a la lista `subscribed`. A su vez cada vez que un usuario se inscribe para un voluntariado, el mismo se registra en el campo `currVolunteering` en el documento del usuario en la coleccion `users`. Esto es porque asi se permite busqueda de datos mas rapida para mostrar el voluntariado actual del usuario en la pantalla principal. El numero de `vacancies` se modifica cada vez que alguien se inscribe o desinscribe en la lista de pending.
