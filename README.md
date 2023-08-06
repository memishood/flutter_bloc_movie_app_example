Movie app (TMDB) with Flutter using BLoC
============================
> Clean way of usage Data / Domain / Presentation with BLoC

<img src="screenshots/1.png" width="322.5" height="699" > &nbsp; &nbsp; <img src="screenshots/2.png" width="322.5" height="699">

## Project architecture
<img src="screenshots/architecture.png">

## Folder structure of the project:
    ├── lib
    │   ├── app                   
    │   ├── core                
    │   │   ├── api                   
    │   │   ├── di                      
    │   │   ├── extension       
    │   │   └── route           
    │   └── features                  
    └── ... ├── feature_x
            │   ├── data
            │   │   ├── datasources   
            │   │   ├── models         
            │   │   └── repositories   
            │   ├── domain
            │   │   ├── entities        
            │   │   ├── repositories   
            │   │   └── usecases        
            │   └── presentation       
            │       ├── bloc
            │       ├── widget
            │       └── page.dart
            └── ...
