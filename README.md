#  Тестовое задание (SGS)


## Task-1. Написать скрипты  по созданию таблиц и выборке данных.

## Task Requirements:

1. Таблица Контейнеров с полями 

+ 1.1 ИД - тип уникальный идентификатор
+ 1.2 Номер - тип числовой
+ 1.3 Тип – тип текстовый
+ 1.4 Длина – тип числовой               
+ 1.5 Ширина – тип числовой
+ 1.6 Высота – тип числовой
+ 1.7 Вес – тип числовой
+ 1.8 Пустой/не пустой – тип бит
+ 1.9 Дата поступления – тип дата/время

2. Таблица операций с полями:
+ 2.1 ИД - тип уникальный идентификатор
+ 2.2 ИД Контейнера - тип уникальный идентификатор
+ 2.3 Дата начала операции – тип дата/время
+ 2.4 Дата окончания операции – тип дата/время
+ 2.5 Тип операции - тип текстовый
+ 2.6 ФИО оператора - тип текстовый
+ 2.7 Место инспекции - тип текстовый

3. Написать запрос, выбирающий из первой таблицы все данные по контейнерам в формате JSON
4. Написать запрос, выбирающий из второй таблицы все данные по операциям для определенного контейнера в формате JSON

## Решение

1. Таблица Контейнеров с полями.
```
CREATE TABLE Container
(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Container_number BIGINT NOT NULL,
	Container_Type VARCHAR(50),
	Lenght REAL,
	Width REAL,
	Height REAL,
	Weight REAL ,
	Is_empty REAL,
	Arrival_date DATETIME  NOT NULL
)
```
[скрипт](task1-sql/1-1.sql)

2. Таблица операций с полями:
```
CREATE TABLE Operation
(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Container_id UNIQUEIDENTIFIER NOT NULL,
	Start_date DATETIME NOT NULL,
	End_date DATETIME,
	Operation_type VARCHAR(255),
	Operator_fullname VARCHAR(50),
	Inspection_location VARCHAR(50) ,
)
```
[скрипт](task1-sql/1-2.sql)

3. Запрос, выбирающий из первой таблицы все данные по контейнерам в формате JSON:
```
SELECT * FROM dbo.Container2
FOR JSON AUTO;
```
[скрипт](task1-sql/1-3-1.sql)


или более явно: 

```
SELECT  Id,
	Container_number AS [Number],
	Type,
	Lenght,
	Width,
	Height,
	Weight,
	Is_empty,
	Arrival_date
FROM dbo.Container2
FOR JSON AUTO;
```
[скрипт](task1-sql/1-3-2.sql)


4. Запрос выбирающий из второй таблицы все данные по операциям для определенного контейнера в формате JSON

Примечение: для поля Id таблицы Operation установлен тип данных GUID. По условию к данныму полю сделан запрос, поэтому данные сравниваются со тестовой строкой формата "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" (формат GUID)

```
SELECT  * FROM dbo.Operation
WHERE Id = '12345678-1234-1234-1234-123456789012'
FOR JSON AUTO;
```
[скрипт](task1-sql/1-4-1.sql)


```
SELECT  Id,
	Container_id,
	Start_date,
	End_date,
	Operation_type,
	Operator_fullname,
	Inspection_location
FROM dbo.Operation
WHERE Id = '12345678-1234-1234-1234-123456789012'
FOR JSON AUTO;
```
[скрипт](task1-sql/1-4-2.sql)


## Task-2. Выполнить форму ввода с зависимыми полями (VueJS).

## Task Requirements:

1. Создайте форму с использованием Html + JavaScript, на которой разместите поля ввода:
+ 1.1 Город – выпадающий список;
+ 1.2.  Цех – выпадающий список;
+ 1.3. Сотрудник – выпадающий список;
+ 1.4. Бригада – выпадающий список;
+ 1.5. Смена – выпадающий список:

2. Первые три поля зависят друг от друга, т.е. выбрали Город и список Цехов уменьшился.

3. Сохраните выбранные значения в Cookie в формате JSON.

## Установка пакетов

```
npm install
```

### Запуск
```
npm run serve
```

### Сборка
```
npm run build
