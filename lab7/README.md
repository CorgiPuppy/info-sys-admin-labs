# Лабораторная работа 8

## Задание 1
### Вариант 15

*Задание*: написать скрипт <em>sed</em>, который заменяет в файле все теги < div > на < p >, а теги < /div > удаляет. Протестировать скрипт на различных файлах, показав, что поставленная задачи решена верно.

## Задание 2
### Вариант 32

Содержимое файла atoms.xyz:
<table style="width:100%">
    <tr>
        <th style="text-align:center; vertical-align:middle">Atom</th>
        <th style="text-align:center; vertical-align:middle">X</th>
        <th style="text-align:center; vertical-align:middle">Y</th>
        <th style="text-align:center; vertical-align:middle">Z</th>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">Ir</td>
        <td style="text-align:center; vertical-align:middle">0.99437992990524</td>
		<td style="text-align:center; vertical-align:middle">-0.34269845108108</td>
		<td style="text-align:center; vertical-align:middle">-3.09726116046547</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">C</td>
        <td style="text-align:center; vertical-align:middle">-1.78523435834955</td>
		<td style="text-align:center; vertical-align:middle">-0.80128428317708</td>
		<td style="text-align:center; vertical-align:middle">-6.59331044461245</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">C</td>
        <td style="text-align:center; vertical-align:middle">-3.31598719563957</td>
		<td style="text-align:center; vertical-align:middle">-0.92733718351966</td>
		<td style="text-align:center; vertical-align:middle">-6.50054352181805</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">C</td>
        <td style="text-align:center; vertical-align:middle">-1.40950141330235</td>
		<td style="text-align:center; vertical-align:middle">0.64386728136198</td>
		<td style="text-align:center; vertical-align:middle">-6.98255100716577</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">O</td>
        <td style="text-align:center; vertical-align:middle">-1.16164771974228</td>
		<td style="text-align:center; vertical-align:middle">-1.22773178801588</td>
		<td style="text-align:center; vertical-align:middle">-5.44314154793957</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-1.49733129676448</td>
		<td style="text-align:center; vertical-align:middle">-1.42721354486802</td>
		<td style="text-align:center; vertical-align:middle">-7.48249131009368</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-3.59159398532618</td>
		<td style="text-align:center; vertical-align:middle">-1.96049032471667</td>
		<td style="text-align:center; vertical-align:middle">-6.27578865140234</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-3.68778595322297</td>
		<td style="text-align:center; vertical-align:middle">-0.29518726167605</td>
		<td style="text-align:center; vertical-align:middle">-5.68835685788211</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-3.81524644395587</td>
		<td style="text-align:center; vertical-align:middle">-0.62800602683343</td>
		<td style="text-align:center; vertical-align:middle">-7.42846940234560</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-0.32436472113108</td>
		<td style="text-align:center; vertical-align:middle">0.76472964945055</td>
		<td style="text-align:center; vertical-align:middle">-7.02744643337563</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-1.82844016240678</td>
		<td style="text-align:center; vertical-align:middle">0.92188046399308</td>
		<td style="text-align:center; vertical-align:middle">-7.95536084618941</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">H</td>
        <td style="text-align:center; vertical-align:middle">-1.77902163220926</td>
		<td style="text-align:center; vertical-align:middle">1.34747072213403</td>
		<td style="text-align:center; vertical-align:middle">-6.23401704120998</td>
    </tr>
    <tr>
        <td style="text-align:center; vertical-align:middle">K</td>
        <td style="text-align:center; vertical-align:middle">1.07103536196612</td>
		<td style="text-align:center; vertical-align:middle">-1.81284456700227</td>
		<td style="text-align:center; vertical-align:middle">-6.52587649854301</td>
    </tr>
</table>


С помощью <em>awk</em> обработать исходный файл atoms.xyz в соответствии с заданием. Итоговые переменные/файл вывести на экран.  

*Задание*: считать вещественное число с консоли (с помощью <em>read</em>) и заменить этим числом все значения координаты <em>Y</em>, меньшие 0, в исходном файле.

## Задание 3
### Вариант 49

*Задание*: напишите калькулятор на <em>awk</em>, умеющий выполнять четыре основных арифметических действия для всех примеров, введённых в файл. В примерах операнды вводятся через пробел, в одной строке - один пример, например, "3.29 + 5.28".
