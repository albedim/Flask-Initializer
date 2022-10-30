@echo off

GOTO START

:START
color 2
echo.
set /p choice=

IF %choice%==create-repo GOTO REPO
IF %choice%==help GOTO HELP
IF %choice%==create-controller GOTO CONTROLLER
IF %choice%==create-service GOTO SERVICE
IF %choice%==create-entity GOTO ENTITY
IF %choice%==create-project GOTO PROJECT

:REPO
    set /p projectName1=write the app name:
    set /p name=set your repository name EX. Example:
    BREAK > "../%projectName1%/model/repository/"%name%Repository.py"" 100
    echo [DONE] %name%Repository.py has been created
    echo from %projectName1%.model.entity.%name% import %name%>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo from sqlalchemy.sql import text>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo class %name%Repository():>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo. >> "../%projectName1%/model/repository/"%name%Repository.py""
    echo     def __init__(self, mysql):>> "../%projectName1%/model/repository/"%name%Repository.py""
    echo         self.mysql = mysql>> "../%projectName1%/model/repository/"%name%Repository.py""
    GOTO START

:CONTROLLER
    set /p projectName1=write the app name:
    set /p name=set your controller name EX. Example:
    set /p lowerName=set your controller name EX. example:
    BREAK > "../%projectName1%/controller/"%name%Controller.py"" 100
    echo [DONE] %name%Controller.py has been created
    echo from flask import Blueprint, request>> "../%projectName1%/controller/"%name%Controller.py""
    echo from flask_cors import cross_origin>> "../%projectName1%/controller/"%name%Controller.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.configuration.Config import mysql>> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.model.repository.%name%Repository import %name%Repository>> "../%projectName1%/controller/"%name%Controller.py""
    echo from %projectName1%.service.%name%Service import %name%Service>> "../%projectName1%/controller/"%name%Controller.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo. >> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName% = Blueprint('%name%Controller', __name__, url_prefix='/api')>> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName%Repository = %name%Repository(mysql)>> "../%projectName1%/controller/"%name%Controller.py""
    echo %lowerName%Service = %name%Service(mysql, %lowerName%Repository)>> "../%projectName1%/controller/"%name%Controller.py""
    GOTO START

:SERVICE
    set /p projectName1=write the app name:
    set /p name=set your service name EX. Example:
    set /p lowerName=set your service name EX. example:
    BREAK > "../%projectName1%/service/"%name%Service.py"" 100
    echo [DONE] %name%Service.py has been created
    echo import datetime>> "../%projectName1%/service/"%name%Service.py""
    echo from flask import jsonify>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo class %name%Service():>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo     def __init__(self, mysql, %lowerName%Repository):>> "../%projectName1%/service/"%name%Service.py""
    echo         self.mysql = mysql>> "../%projectName1%/service/"%name%Service.py""
    echo         self.%lowerName%Repository = %lowerName%Repository>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo     # Creates a json response for the endpoints>> "../%projectName1%/service/"%name%Service.py""
    echo. >> "../%projectName1%/service/"%name%Service.py""
    echo     @classmethod>> "../%projectName1%/service/"%name%Service.py""
    echo     def createResponse(cls, error, code, param):>> "../%projectName1%/service/"%name%Service.py""
    echo         return jsonify({>> "../%projectName1%/service/"%name%Service.py""
    echo             "date": str(datetime.datetime.now()),>> "../%projectName1%/service/"%name%Service.py""
    echo             "error": error,>> "../%projectName1%/service/"%name%Service.py""
    echo             "status": code,>> "../%projectName1%/service/"%name%Service.py""
    echo             "param": param,>> "../%projectName1%/service/"%name%Service.py""
    echo             "url": "/order">> "../%projectName1%/service/"%name%Service.py""
    echo         })>> "../%projectName1%/service/"%name%Service.py""
    GOTO START

:PROJECT
    set /p projectName=insert the app name:
    cd ..
    mkdir %projectName%
    cd %projectName%
    mkdir configuration
    cd configuration

    BREAK > Config.py 100
    echo from flask_sqlalchemy import SQLAlchemy>> Config.py
    echo from resources.config import config>> Config.py
    echo from flask import Flask>> Config.py
    echo.>> Config.py
    echo app = Flask(__name__)>> Config.py
    echo app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://' + config['username'] + ':' + config['password'] + '@' + config['host'] + '/' + config['db-name']>> Config.py
    echo app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False>> Config.py
    echo mysql = SQLAlchemy(app)>> Config.py

    cd ..
    mkdir controller
    mkdir model
    cd model
    mkdir entity
    mkdir repository
    cd ..
    mkdir service
    cd ..

    BREAK > app.py 100
    echo from %projectName%.configuration.Config import app>> app.py
    echo.>> app.py
    echo # controllers init>> app.py

    BREAK > start.bat 100
    echo @echo off>> start.bat
    echo GOTO START>> start.bat
    echo :START>> start.bat
    echo flask run>> start.bat
    echo pause > nul>> start.bat

    echo [DONE] The project has been created
    echo RESTART THE .BAT FILE TO CONTINUE
    pause > nul
    exit

:HELP
    echo create-repo
    echo create-service
    echo create-entity
    echo create-controller
    echo create-project
    GOTO START

:ENTITY
    set /p projectName1=write the app name:
    set /p name=set your entity name EX. Example:
    BREAK > "../%projectName1%/model/entity/"%name%.py"" 100
    echo [DONE] %name%.py has been created
    echo from %projectName1%.configuration.Config import mysql>> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo class %name%(mysql.Model):>> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo. >> "../%projectName1%/model/entity/"%name%.py""
    echo mysql.create_all()>> "../%projectName1%/model/entity/"%name%.py""
    GOTO START