# Практическая работа №10

### Тема: Работа с Firestorage
### Цель работы: необходимо реализовать функционал для загрузки и удаления картинок в Firebase Storage, а также отображения списка всех картинок, находящихся в Firebase Storage. В списке должны быть следующие атрибуты: название картинки, сама картинка, размер и ссылка на картинку. Связать Cloud Firestore с Firebase Storage.В  FireStore хранить все данные картинки. Связать Cloud Firestore с Firebase Storage и FirebaseAuth. Реализовать авторизацию и регистрацию. У пользователя есть свои реальные картинки, которые он может выводить, удалять и изменять. Все данные хранятся в Cloud Firestore, а сама картинка хранится в Firebase Storage.

###
### Ход работы:
### Для начала работы необходимо настроить проект в Firebase и подключить его Flutter-проекту, в котором будет реализовано приложение. На картинке показан Firebase с подключенным проектом во Flutter.
![image](https://user-images.githubusercontent.com/99389490/228985691-abea544b-fdb7-4fd2-ae4f-0ba3693c967a.png)
###
### Также необходимо скачать конфиг-файл «google-service.json» для Android и поместить в проект. 
![image](https://user-images.githubusercontent.com/99389490/228985719-f76b7e49-1460-4ccb-a2da-4c8ca9c3f269.png)
### 
### На уровне app в файле «build.gradle» необходимо отредактировать «compileSdkVersion» и «buildToolsVersion». Также необходимо отредактировать defaultConfig, и добавить «Multidex» в defaultConfig.
![image](https://user-images.githubusercontent.com/99389490/228985742-7230d4ac-d5d7-4190-b703-328fc5aea076.png)
### 
### После необходимо создать базу данных в Cloud Firestore.
##
![image](https://user-images.githubusercontent.com/99389490/228985806-13f360e3-846a-4efc-b55d-f15793ab3b23.png)
###
### А также добавить к проекту Firebase Storage, где будут храниться фотографии.
![image](https://user-images.githubusercontent.com/99389490/228985877-4884bbd3-e3f6-4d6a-bf22-19f3687a9779.png)
###
### На данном рисунке изображен вход в приложение с помощью почты и пароля.
![image](https://user-images.githubusercontent.com/99389490/228985937-bcf286b6-2a56-45bb-acc4-0e17aadb9954.png)
###
### Также работает скрытие пароля с помощью иконка глаза.  
![image](https://user-images.githubusercontent.com/99389490/228985973-966f84f3-1274-447e-9f88-3c00aa079cc2.png)
###
### Успешная регистрация пользователя.
![image](https://user-images.githubusercontent.com/99389490/228985993-fc829e5d-43b4-4981-a7ee-12fccea800b8.png)
###
### Подтверждение в базе того, что пользователь был зарегистрирован.
![image](https://user-images.githubusercontent.com/99389490/228986054-12048092-0b9f-4100-8c70-8f93019e4a50.png)
###
### Успешный вход. 
![image](https://user-images.githubusercontent.com/99389490/228986067-c289ef0a-4369-439f-af59-db1fc8c97e52.png)
###
### На рисунке ниже продемонстрировано добавление фотографии в приложение.
![image](https://user-images.githubusercontent.com/99389490/228986113-b8b986d8-41bf-4a20-8cc5-b4b63fbf0077.png)
###
### В приложении реализовано редактирование и удаление фотографии и данных о ней из Firestore.
![image](https://user-images.githubusercontent.com/99389490/228986147-51890ef5-efd5-4d59-ae4c-14132fc21609.png)
![image](https://user-images.githubusercontent.com/99389490/228986176-6891282c-8cc4-4689-9e18-38554fac62c8.png)
###
### Успешное удаление фото из Firestorage.
![image](https://user-images.githubusercontent.com/99389490/228986223-d10fdd2a-5fe9-4a06-8969-9606d05e4ded.png)
###
### На рисунке ниже показан результат удаления фото из приложения и базы.
![image](https://user-images.githubusercontent.com/99389490/228986258-a87bc841-6901-4986-aae2-343b03bf083b.png)
###
### Аккаунт пользователя.
![image](https://user-images.githubusercontent.com/99389490/228986316-66ea80e7-dcf4-4657-89bb-e71825370150.png)
###
### Успешное обновление пароля.
![image](https://user-images.githubusercontent.com/99389490/228986333-3c23f173-589a-481b-a9e3-7d20a61fbd5a.png)
###
### Успешное удаление аккаунта.
![image](https://user-images.githubusercontent.com/99389490/228986398-5661c850-219f-4762-bf00-ee6f58dd1cbd.png)
###
### Информация в Firestore о фотографиях.
![image](https://user-images.githubusercontent.com/99389490/228986459-b4c943bc-5006-4d07-babe-9d5088c3af92.png)

### Вывод: В данной практической работе была произведена первичная работа с Firestorage. Были реализованы функции: функционал для загрузки и удаления картинок в Firebase Storage, а также отображения списка всех картинок, находящихся в Firebase Storage. Связь Cloud Firestore с Firebase Storage. В FireStore хранятся все данные картинки. Связь Cloud Firestore с Firebase Storage и FirebaseAuth. Реализованы авторизация и регистрация. У пользователя есть свои реальные картинки, которые он может выводить, удалять и изменять. Все данные хранятся в Cloud Firestore, а сама картинка хранится в Firebase Storage.
