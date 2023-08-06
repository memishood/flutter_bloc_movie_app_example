Movie app (TMDB) with Flutter using BLoC
============================
> Clean way of usage Data / Domain / Presentation with BLoC


<div style="display: inline-block; margin-right: 20px;">
  <img src="screenshots/1.png" width="322.5" height="699" >
</div>
<div style="display: inline-block;">
  <img src="screenshots/2.png" width="322.5" height="699">
</div>

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
