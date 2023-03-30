# Практическая работа №10

### Тема: Работа с Firestorage
### Цель работы: произвести первичную настройку Firestore во Flutter, реализовать сохранение данных при регистрации пользователя в Firestore, редактирование данных пользователя, работу с данными CRUD, динамическое обновление данных.

###
### Ход работы:
### Для начала работы необходимо настроить проект в Firebase и подключить его Flutter-проекту, в котором будет реализовано приложение. На картинке показан Firebase с подключенным проектом во Flutter.
![image](https://user-images.githubusercontent.com/99389490/227343402-0ef22b5d-f8c8-44ec-9d05-5bf0c6d39cfb.png)
###
### Также необходимо скачать конфиг-файл «google-service.json» для Android и поместить в проект. 
![image](https://user-images.githubusercontent.com/99389490/227343475-b44e3bad-2baa-426b-87d6-303846ad313c.png)
### 
### В файл «build.gradle» в dependencies необходимо добавить строчку «classpath 'com.google.gms:google-services:4.3.15».
![image](https://user-images.githubusercontent.com/99389490/227343568-a266ff91-9d50-430b-8a2c-17f42051541a.png)
### 
### На уровне app в файле «build.gradle» необходимо отредактировать «compileSdkVersion» и «buildToolsVersion». Также необходимо отредактировать defaultConfig, и добавить «Multidex» в defaultConfig и dependencies. 
##
![image](https://user-images.githubusercontent.com/99389490/227343675-235e940c-98fd-4ea3-8252-e1795a125baa.png)
###
### В файле «pubspec.yaml» должны быть добавлены «firebase_core» и «cloud_firestore».
![image](https://user-images.githubusercontent.com/99389490/227343771-87cd747c-2429-45a3-94bd-723f6f4585de.png)
###
### После необходимо создать базу данных в Cloud Firestore. 
![image](https://user-images.githubusercontent.com/99389490/227343866-bdca21ee-84ee-4dd6-ab44-55d2ecc73dd5.png)
###
### В проекте необходимо создать страницы для взаимодействия с Cloud Firestore. В данном проекте содержатся страницы с регистрацией пользователя, страницей со всеми пользователями, с редактированием и удалением информации о пользователе. 
![image](https://user-images.githubusercontent.com/99389490/227344021-642f210f-5e1a-454f-b92a-a7177a5cf99e.png)
###
### Также можно увидеть отображение нового пользователя в Firebase.
![image](https://user-images.githubusercontent.com/99389490/221419542-2a0f1ffd-7375-4a4b-a632-b218d56c0476.png)
###
### На данном рисунке изображен код с запуском программы и связью с Firebase.
![image](https://user-images.githubusercontent.com/99389490/227344133-49fd8b7e-877b-478b-861d-1bd1ee43e768.png)
###
### Код реализации просмотра всех пользователей, сохраненных в Firestore на странице всех пользователей в приложении. 
![image](https://user-images.githubusercontent.com/99389490/227344284-866f9652-6fa4-4892-99f6-5d1ba2a208d3.png)
###
###
![image](https://user-images.githubusercontent.com/99389490/227344400-a97d57b7-5801-40c3-af40-b65a0d8d4273.png)
###
### Также код таблицы с пользователями представлен в файле «list_user_ page.dart». Также в данном файле представлено удаление пользователя.
![image](https://user-images.githubusercontent.com/99389490/227344481-6db296e7-9107-4206-b038-36b944298cbd.png)
![image](https://user-images.githubusercontent.com/99389490/227344508-d6d2703a-87ed-4853-a0c6-fcc87413efd3.png)
###
### Код реализации регистрации пользователей, которые после будут отображаться в базе Firestore. В данном коде представлен действия добавления новой коллекции в Firestore и последующем добавлении документа «users» с различными полями.
![image](https://user-images.githubusercontent.com/99389490/227344621-b362d5f3-db94-493c-9c19-5f3f8da24e72.png)
###
### Пример реализации регистрации пользователей. Также можно отменить действие, нажав по кнопке «Отменить» и после сотрутся все данные полей.
![image](https://user-images.githubusercontent.com/99389490/227344726-97809324-afa9-41d0-b397-7feceeb14f50.png)
###
![image](https://user-images.githubusercontent.com/99389490/227344776-2d7bff91-d5ab-46d7-b2c2-583f0f93fd79.png)
###
![image](https://user-images.githubusercontent.com/99389490/227344817-4afecfde-9c05-4695-b4bb-d38064a8ab4a.png)
###
### Код реализации редактирования пользователей, которые после будут отображаться в базе Firestore. 
![image](https://user-images.githubusercontent.com/99389490/227344934-55e6b315-6bb0-4d4d-952c-67afa421e0fc.png)
###
![image](https://user-images.githubusercontent.com/99389490/227344975-284b91f5-4931-4087-af5e-1dabddd3d54b.png)
###
![image](https://user-images.githubusercontent.com/99389490/227345018-1a05f109-4293-46a2-91a5-035e50f11b99.png)
###
![image](https://user-images.githubusercontent.com/99389490/227345043-eb37a1db-3772-4399-a50b-f99da2d6f077.png)
###
![image](https://user-images.githubusercontent.com/99389490/227345065-8c7d53e3-c4ed-426e-95ce-f7cf053156b6.png)
###
![image](https://user-images.githubusercontent.com/99389490/227345085-754979c2-fe49-44ce-b3ec-2980c8883b0e.png)

### Вывод: В данной практической работе была произведена первичная работа с Firestore. Были реализованы функции: сохранение данных при регистрации пользователя в Firestore, редактирование данных пользователя, работа с данными CRUD, динамическое обновление данных.
