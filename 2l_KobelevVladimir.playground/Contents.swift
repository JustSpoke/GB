import Foundation
//1. Написать функцию, которая определяет, четное число или нет.
func evenOrNot(n: Int) -> [Int] { // функция для массивов, вывести все числа которые соответствуют параметрам
    var evenArray: [Int] = []
    var oddArray: [Int] = []
    for i in 0...n {
        if i % 2 == 0 {
            evenArray.append(i) //массив четных
        }else if i % 2 != 0{
            oddArray.append(i) //по желанию можно вывести массив не четных
        }
    }
    return evenArray
}
print(evenOrNot(n: 10))

//var 2 в это млучает будет выводиться только true or false для одного числа
func isEven(_ num : Int) -> Bool {
    return (num % 2 == 0)
}
isEven(5)


//2. Написать функцию, которая определяет, делится ли число без остатка на 3
//var1
func divByThree (num: Int) ->  Bool {
    return (num % 3 == 0)
    }
print(divByThree(num: 6))

    //var 2 (работает с массивом)
func divide(n: Int) -> [Int] {
    var exactDivide: [Int] = []
    var notExact: [Int] = []
    for i in 0...n {
        if i % 3 == 0 {
            exactDivide.append(i)
        }else if i % 3 != 0{
            notExact.append(i)
        }
    }
    return exactDivide
}
print(divide(n: 7))
    

//3. Создать возрастающий массив из 100 чисел.
var array5: [Int] = []
for t in 0...99 {
    array5.append(t)
}
print(array5)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for t in array5  {
    if (t % 2) == 0 {
        array5.remove(at: array5.firstIndex(of: t)!)
    }else if(t % 3) != 0{
        array5.remove(at: array5.firstIndex(of: t)!)
    }
}
print(array5)
 //вариант 2
var removed = array5.filter {$0 % 2 != 0  && $0 % 3 == 0}
print(removed)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
    //первый
func fibonacci(numSteps: Int) -> [Int] {
    var mas = [0, 1] //создаем массив из первых двух чисел
    if numSteps < 1 { //если
        return mas
    }
    for _ in 0...numSteps {
        let f = mas[mas.count - 2] // ставим условие что бы отсчет начинался не с первых двух элементов, в противном случае мы получим бесконечную единицу (подсказали товарищи американцы ;) )
        let s  = mas.last!
        mas.append(f + s) //Fn=Fn-1 + Fn-2.
    }
    return mas
}
print(fibonacci(numSteps: 5))

    //второй (рекурсия) в этом варианте будет традиционное исполнение функции, то есть начало будет не с 0, а с 1
func fibRec(numStep: Int, f: Int, s: Int) -> [Int] {
    if numStep == 0 {
        return []
    }
    return [f + s] + fibRec(numStep: numStep - 1, f: s, s: f + s)
}
print(fibRec(numStep: 3, f: 0, s: 1))

/*6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/
var array: [Int] = []
var p = 0
var x = 0
for i in 2...101{
    array.append(i)
}
while x < array.count {
    p < array[x]
    p = array[x]
    for i in stride(from: p*p, through: 101, by: p){
        if let j = array.firstIndex(of: i){
            array.remove(at: j)
        }
    }
    x += 1
}
print(array)

    // variant 2
func primeNumbers(someNumber: [Int]) -> [Int] {
    var massive: [Int] = []
    var notprime = someNumber
    while let p = notprime.first {
        massive.append(p)
        notprime = notprime.filter {$0 % p != 0}
    }
    return massive
}
print(primeNumbers(someNumber: Array(2...101)))

