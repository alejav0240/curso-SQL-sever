# Ciencia de SQL

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white) ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

Este proyecto es un repositorio exhaustivo dedicado a la exploración y el dominio de SQL Server. 🚀 Desde las consultas `SELECT` más fundamentales hasta funcionalidades avanzadas como funciones, procedimientos almacenados, triggers, cursores y subconsultas, este recurso está diseñado para guiar a usuarios y desarrolladores a través de las complejidades de SQL Server. Con un enfoque práctico, ofrece ejemplos claros y ejercicios para solidificar el aprendizaje y la comprensión de las capacidades de SQL. Es ideal para quienes buscan entender la estructura y el comportamiento de SQL Server en profundidad.

## 🌟 Características Principales

*   **Cobertura Integral de SQL:** Aborda desde consultas fundamentales hasta temas avanzados, incluyendo manipulación de datos, DDL, DML, DCL y TCL.
*   **Funciones Definidas por el Usuario (UDFs):** Ejemplos y prácticas sobre cómo crear y utilizar funciones personalizadas para modular el código.
*   **Procedimientos Almacenados:** Implementación y ejecución de procedimientos almacenados para encapsular lógica de negocio y mejorar el rendimiento.
*   **Triggers:** Demostraciones de cómo usar triggers para automatizar acciones en la base de datos en respuesta a eventos específicos.
*   **Control de Flujo:** Ejemplos de `IF-THEN-ELSIF` y `LOOP` para implementar lógica condicional y repetitiva directamente en SQL.
*   **Cursores:** Uso de cursores para procesamiento fila por fila en escenarios donde las operaciones basadas en conjuntos no son óptimas.
*   **Manejo de Objetos de Base de Datos:** Creación y manipulación de diversos objetos de base de datos y tablas objeto.
*   **VARRAYS:** Exploración de VARRAYS para tipos de datos complejos.
*   **Ejercicios y Exámenes:** Incluye scripts de práctica y resolución de exámenes para reforzar el aprendizaje y evaluar la comprensión.
*   **Organización Temática:** Los scripts están estructurados lógicamente por tema, facilitando la navegación y el estudio autodirigido.

## 📋 Requisitos Previos

Para sacar el máximo provecho de este proyecto, necesitarás:

*   **SQL Server:** Una instancia de Microsoft SQL Server (versión 2017 o superior recomendada) instalada y en funcionamiento.
*   **Cliente SQL:** Una herramienta de gestión de bases de datos para ejecutar y administrar los scripts, como:
    *   [SQL Server Management Studio (SSMS)](https://docs.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms)
    *   [Azure Data Studio](https://docs.microsoft.com/es-es/sql/azure-data-studio/download-azure-data-studio)
*   **Python (Opcional):** Si planeas interactuar con SQL Server mediante Python para automatización o generación de informes, necesitarás:
    *   Python 3.x instalado.
    *   Librerías como `pyodbc`, `pymssql` o `SQLAlchemy` (instala con `pip install <nombre_de_libreria>`) junto con los controladores ODBC/DBAPI apropiados para SQL Server.

## 🚀 Instrucciones de Instalación

Sigue estos pasos para poner en marcha el proyecto en tu entorno:

1.  **Clonar el Repositorio:**
    ```bash
    git clone https://github.com/alejav0240/curso-SQL-sever.git # Reemplaza con la URL real de tu repositorio
    cd curso-SQL-sever
    ```

2.  **Configurar SQL Server:**
    *   Asegúrate de que tu instancia de SQL Server esté en ejecución.
    *   Puedes crear una nueva base de datos dedicada para este proyecto (ej. `CienciaDeSQL`) o utilizar una existente si lo prefieres.

3.  **Ejecutar Scripts SQL:**
    *   Abre tu cliente SQL preferido (SSMS, Azure Data Studio).
    *   Conéctate a tu instancia de SQL Server.
    *   Abre los archivos `.sql` del proyecto. Es recomendable ejecutarlos en un orden lógico: primero los scripts de creación de tablas, luego inserción de datos, y finalmente funciones, procedimientos, triggers, etc.
    *   Ejecuta cada script para crear los objetos de base de datos y poblar los datos necesarios para las prácticas.

## 💡 Guía de Uso

Los scripts están organizados temáticamente y pueden ser ejecutados secuencialmente o de forma individual para explorar funcionalidades específicas.

*   **Explorar Consultas Básicas:** Abre `PracticaUno.sql` o `Examen.sql` para ejemplos de sentencias `SELECT` y manipulación de datos.
*   **Entender Funciones:** Revisa `Funtions.sql` para ver cómo crear y utilizar funciones definidas por el usuario.
*   **Trabajar con Procedimientos Almacenados:** Examina `procedure.sql` para la implementación y ejecución de procedimientos.
*   **Implementar Triggers:** Consulta `Triggers.sql` para aprender sobre los triggers y su automatización.
*   **Resolver Ejercicios:** Utiliza `Practica.sql` y `Resolucion de la practica.sql` para practicar y verificar tus soluciones.

**Ejemplo de Ejecución de un Script (usando SQL Server Management Studio - SSMS):**

1.  Abre SSMS y conéctate a tu servidor SQL.
2.  Haz clic en `File` -> `Open` -> `File...` y selecciona un archivo `.sql` del proyecto (ej. `procedure.sql`).
3.  Asegúrate de que la base de datos correcta esté seleccionada en el menú desplegable de la barra de herramientas (ej. `CienciaDeSQL`).
4.  Haz clic en `Execute` (o presiona `F5`) para ejecutar el script y ver los resultados.

## 📂 Estructura del Proyecto
```
curso-SQL-sever/
├── nosql/
│   └── notas.txt
├── Examen.sql
├── Funtions.sql
├── IF-THEN-ELSIF.sql
├── LOOP.sql
├── Objetos.sql
├── Paquetes.sql
├── Practica.sql
├── PracticaLPSQL.sql
├── PracticaUno.sql
├── Resolucion de la practica.sql
├── TablasObjeto.sql
├── Triggers.sql
├── VARRAYS.sql
├── cursores.sql
├── examenDos.sql
├── exection.sql
├── procedure.sql
└── ubi.sql
```

## 🛠️ Tecnologías Utilizadas

*   **SQL Server:** El sistema de gestión de bases de datos relacionales principal del proyecto.
*   **SQL (Structured Query Language):** El lenguaje de consulta universal utilizado en todos los scripts para interactuar con la base de datos.
*   **Python:** Mencionada como el lenguaje principal para posibles interacciones programáticas con la base de datos, automatizaciones o generación de informes.