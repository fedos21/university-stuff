# Гайд на прогу (main.exe)

Прога ест файл `data.txt`
формат:  
```
номер_входного_узла   номер_выходного_узла
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
Номер_Узла_А   Номер_Узла_Б   стоимость
...
```
получаем выход:  
- Веса узлов
- Путь

# Вывод
```
node_id: 4
weight: 0
---
node_id: 6
weight: 1
---
node_id: 8
weight: 2
---
node_id: 5
weight: 4
---
node_id: 2
weight: 6
---
node_id: 7
weight: 6
---
node_id: 1
weight: 7
---
node_id: 3
weight: 9
---
Path: [end - start]
1 - 7 - 5 - 8 - 6 - 4



Ctrl+C to exit
```