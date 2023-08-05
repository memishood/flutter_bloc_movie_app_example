Movie app (TMDB) with Flutter using BLoC
============================
> Clean way of usage Data / Domain / Presentation with BLoC

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
            │   │   ├── datasources     
            │   │   ├── entities        
            │   │   ├── repositories   
            │   │   └── usecases        
            │   └── presentation       
            │       ├── bloc
            │       ├── widget
            │       └── page.dart
            └── ...
