# Fake store app

A new Flutter project.

## Descripción
Esta es una aplicación Flutter destinada  a la recreación de una tienda online, donde se pueden visualizar productos, agregarlos al carrito y realizar una compra simulada.

## Estructura del Proyecto
La aplicación sigue una arquitectura limpia, utilizando  `Riverpod` para manejar el estado y la lógica de negocio. El proyecto está dividido en las siguientes capas mediante segregación de carpetas:
- **domain**: Contiene  los  repository,los usecases con su referencia al repository en este caso gran parte de los modelos se importaron del package fakeStore.
- **infraestructure**: Contiene nuestros driven adapters que contienes la implementación de la api con el package fakeStore , accediendo solo a la capa de dominio mediante el repository.
- **presentation**: Contiene las vistas o pantallas de la aplicación ( HomeScreen,DetailsScreen,SearchScreec,CatalogScreen,Support Screen,Login,register) que se crearon usando el package de atomicDesign.
- **config**: Contiene los providers de Riverpod para manejar el estado de la aplicación y los notifier.

## Funcionalidades Principales
- crear una cuenta.
- acceder a la cuenta mediante el login.
- visualizar home con sus ofertas y productos destacados.
- acceder a un catalogo de productos y filtrarlos por categoria 
- acceder a una pantalla de busqueda y buscar productos por nombre o descripción.
- acceder a una pantalla de detalle con tocar cualquier producto de las pantallas anteriores.
- agregar productos al carrito.
- visualizar el carrito, sumar o restar la cantidad de productos y eliminar productos del mismo o todo el carrito.
- realizar una compra simulada.
- acceder a una pantalla de soporte .
- cerrar sesión.

## Consideraciones
- la aplicación usa  la librería 'Go router' para manejar la navegación entre pantallas.
- la aplicación usa el package fakeStore para el consumo de la api y manejo de los datos y modelos de la misma.
- la aplicación usa la package AtomicDesig  para construir toda la Ui de la aplicación.
- la aplicación usa la librería 'url_launcher' para acceder al numero o email de soporte.
- la api fakestore simula gran parte de sus acciones no guarda en su base de datos cuentas creadas ni carritos por ende estas funcionalidades 
se pidieron a la api pero se simularon en local .
