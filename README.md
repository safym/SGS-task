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
