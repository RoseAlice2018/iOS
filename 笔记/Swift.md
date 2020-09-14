## iOS开发
### 2_Swift

1. Swift语言基础
	
	- Swift兼容Objective-C。一定程度上，被视为没有C的objective-C
	
2. Swift的三大特性
	- 安全：提供多种安全措施，如值在使用前初始化，自动内存管理
	- 强大：高度优化的LLVM编译器生成，如低级的类似C语言的函数等
	- 现代：采纳了许多现代语言的特性，如闭包，泛型，元组，函数式编程
	
3. 常量和变量
	Declaring Constants and Variables（let 和 var）
	
	```
	let maximun = 100
	var x = 0.0
	var welcomeMessage: String //Type Annotations
	```
	Tips:
	
	1. don't begin with a number
	2. can't contain whitespace characters,mathematical symbols,arrows, private-use Unicode scalar values, or line- and box-drawing characters

4. Standard I/O

   1. print()

      ```
      print("Hello world!")
      ```

   2. readline()

      ```
      let input = readline()?.split(separator:" ")
      if let inp = input {
      	for item in inp{
      		print(item)
      }
      }
      ```

5. ;

   1. Swift doesn't require you to write a semicolon(;) after each statement , although you can
   2. semicolons are required if you want to wirte multiple separate statements on a single line

6. 基本数据类型

   1. 整数
      - 无小数部分的数字
      - Int，Int8，Int16，Int32，Int，UInt
      - Int的位数与操作系统一致。有可能，尽量用Int
      - Int.min,Int.max
   2. 实数
      - 有小数部分的数字
      - Float（32位，精度6位），Double（64位，精度15位）
   3. Bool
      - Bool型文字：true，false

7. 类型转换和类型推导

   1. 类型推导

      ```
      let meaningOfLife = 42
      // meaningOfLife is inferred to be of type Int
      let pi = 3.14159
      // pi is inferred to be of type Double
      ```

   2. 类型转换

      ```
      let three=3
      let pp=0.141596l
      let pi = Double(three) + pp
      
      ```

8. String and Character

   1. String Literal : surrounded by double quotation marks ("")

      ```
      let string1="hello"
      let string2="there"
      var welcome = string1 + string2
      ```

   2. Character Literal

      ```
      let exclamationMark: Character = "!"
      welcome.append(exclamationMark)
      ```

   3. String Interpolation

      ```
      let multiplier = 3
      let message = "\(multiplier)times 2.5 is \(Double(multiplier)*2.5)"
      // message is "3 times 2.5 is 7.5"
      ```

9. String and Unicode

   1. Unicode

   2. Counting Characters: .count

      ```
      var word = "cafe"
      print("the number of characters in \(word) is \(word.count)")
      
      ```

10. String Index

    1. You can access any character(of type Character) in a String using [] notation. But the indexes inside the [] are not Int, they are a type called String.Index.

       ```
       let s:String = "hello"
       let firstIndex:String.Index = s.startIndex
       
       let firstChar:Character = s[firstIndex]
       
       let fifthChar:Character = s[s.index(firstIndex,offsetBy:4)]
       
       let substring = s[firstIndex...secondIndex]
       ```

11. Tuples(元组)

    1. Tuples group multiple values into a single compound value. The values within a tuple can be of any type.

       ```
       let http404Error = (404."Not Found")
       // http404Error is of type (Int,String), and equals (404,"Not Found")
       ```

    2. decompose a tuple's contents into separate constants or variables

       ```
       let (statusCode, statusMessage) = http404Error
       print("The status code is \(statusCode)")
       //prints "The status code is 404"
       
       let (justTheStatusCode,_) = http404Error
       
       ```

    3. name the individual elements in a tuple when the tuple is defined
    
       ```
       let http200Status = (statusCode:200, description: "OK")
       print("The status code is \(http200Status.statusCode)")
       //Prints "The status code is 200"
       ```
    
    4. Tuples are particularly useful as the return values of functions.
    
12. Control Flow

    1. 顺序执行
    2. 循环
       1. for in
       2. while
       3. while repeat
    3. 条件
       1. if
       2. switch
    4. 控制转移
       1. break
       2. continue
       3. fall through
       4. return
       5. throw
    5. Early Exit
       1. guard

13. for in 

    1. 用来更简单的遍历数组（array），字典（dictionary），区间（range），字符串（string）和其他序列类型

       ```
       for index in 1...5{
       	print("\(index)times 5 is \(index*5)")
       }
       ```

    2. 不需要区间序列内每项的值，用下划线（_)替代变量名

       ```
       let base = 3 , power = 10
       var answer = 1
       for_ in 1...power{
       	answer *= base
       }
       ```

14. Range Operator

    1.  ..< (exclusive of the upper bound) : 半闭合

    2. ... (inclusive of both bounds): 闭合

    3. CountableRange is enumeratable with for in.

       ```
       for i in 0..<20 {}
       ```

    4. Floating point numbers don't stride by Int, they stride by a floating point value . There's a global function that will create a CountableRange from floating point values!

       ```
       for i in stride(from:0.5,through:15.25,by:0.3){}
       ```

15. while 

    ```
    while condition{
    	statements
    }
    ```

16. repeat-while

    ```
    repeat{
    	statements
    }while condition
    ```

17. if 

    ```
    var temperatureInFahrenheit = 30
    if temperatureInFahrenheit <= 32{
    	//
    }
    if t <= 32{
    
    }else if t >= 86 {
    	
    }else{
    
    }
    ```

18. switch

    1. swift的switch语句比C语言中更加强大安全。

    2. 在C语言中，如果某个case不小心漏写了break，这个case就会贯穿至下一个case，swift无需写break，不会发生这种贯穿的情况。

    3. case还可以匹配很多不同的模式，包括间隔匹配（interval match），元组（tuple）和转换到特定类型。switch语句的case中匹配的值可以绑定成临时常量或变量，在case体内使用，也可以用where来描述更复杂的匹配条件

    4. switch语句必须是完备的。这就是说，每一个可能的值都必须至少有一个case分支与之对应。在某些不可能涵盖所有值的情况下，你可以使用默认（default）分支来涵盖其它所有没有对应的值，这个默认分支必须在switch语句的最后面。

    5. 区间匹配

       ```
       let approximateCount = 62
       switch approximateCount{
       	case 0:
       		naturalCount="no"
       	case 1..<5:
       		naturalCount="a few"
       	case 5..<12
       		naturalCount="several"
       	case 12..<100
       		naturalCount="dozens of"
       	case 100..<1000:
       		naturalCount="hundreads of"
       	default:
       		naturalCount = "many"
       }
       
       
       let somePoint = (1,1)
       switch somePoint{
       
       }
       ```

    6. Tuple
    
       ```
       let somePoint=(1,1)
       switch somePoint{
       	case (0,0):
       		print("(0,0)is at the origin")
       	case (_,0):
       		...
       	case (0,_):
       		...
       	case (-2...2,-2...2):
       		...
       	default:
       		...
       }
       ```
    
    7. value bingdings
    
       ```
       let anotherPoint = (2,0)
       switch anotherpoint{
       	case (let x,0):
       		...
       	case (0,let y):
       		...
       	case let(x,y):
       		...
       	default:
       		...
       }
       ```
    
    8. where
    
       ```
       let yetAnotherPoint = (1,-1)
       switch yetAnotherPoint{
       	case let(x,y) where x==y:
       		...
       	case let(x,y) where x==-y:
       		...
       	case let(x,y):
       		...
       }
       ```
    
    9. compound cases
    
       ```
       let someCharacter: Character = "e"
       switch someCharacter{
       	case "a","e","i","o","u":
       		...
       	case "b","c","d","f":
       		...
       	default:
       		...
       }
       
       
       let stillAnotherPoint = (9,0)
       switch stillAnotherPoint{
       case (let distance,0),(0,let distance):
       	print
       default:
       	...
       	}
       ```
    
19. fallthrough

    1. 每个需要贯穿特性的case分支使用fall through

       ```
       let integer=5
       var description = "the number \(integer) is"
       switch integer{
       	case 2,3,4,5,7:
       		description += "a prime number,and also"
       		fallthrough
       	default:
       		description +="an integer."
       }
       print(description)
       ```

20. continue

    1. continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环

       ```
       let puzzleinput="great minds think alike"
       var puzzleOutput=""
       for character in puzzleInput.characters{
       	switch character{
       		case "a","e","i","o","u"," ":
       			continue
       		default:
       			puzzleOutput.append(character)
       	}
       }
       print(puzzleOutput)
       ```

21. break

    1. break语句会立刻结束整个控制流的执行。要更早的结束一个代码块或者一个循环体时，使用break语句。

       ```
       let number=3
       switch number{
       	case 3:
       		break;
       }
       ```

22. guard(early exit)

    1. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed.(check illegal condition)

    2. like an if statement,executes statements depending on the Boolean value of an expression.Unlike an if statement, a guard statement always has an else clause---the code inside the else clause is excuted if the condition is not true.

       ```
       guard let score >= 0 else{
       	return
       }
       ```

23. Optionals(可选类型)

    1. 数据类型？ 可能是某类型的值或没有值nil

       ```
       let optionalInt:Int? = 9
       ```

24. unwrap(强制解包)

    1. 强制解包操作，使用！

       ```
       let x:String? = "hello"
       let y = x!
       ```

    2. 如果不合法，可能报错

       ```
       let x : String ?
       let y = x!
       ```

25. 隐式解包可选类型

    1. 数据类型 ！

       ```
       let x : String! = "Hello"
       let y = x
       ```

    2. 使用时不需要强制解包

26. optional default

    ```
    let s:String?= ... //might be nil
    display.text = S ?? ""
    ```

27. if let 可选绑定

    1. 使 可选绑定（optional binding， 使用let）来判断可选类型是否包含值，如果包含就把值赋给个临时常量或者变量

       ```
       var optionalName:String? = "John Appleseed"
       var greeting = "Hello!"
       if let name = optionalName{
       	greeting = "Hello,\(name)"
       }
       ```

28. Chained

    ```
    没看懂
    ```

29. Array

    1. An array stores values of the same type in an ordered list

    2. declare

       ```
       var shoppintList = ["Eggs","Milk"]
       // var shoppintList:[String] = ["Eggs","Milk"]
       // var shoppintList:Array<String> = ["Eggs","Milk"]
       // shoppintList has been initialized with two initial items
       //var someInts = [Int]()
       
       ```

    3. 索引和下标：基于0

       ```
       shoppingList[0]
       let array = ["a","b","c","d"]
       let a = array[2..3] //["b","c"]
       ```

    4. 其他方法和属性

       - count,first,last
       - isEmpty,append,insert,+,=,.....

30. Set

    1. A set stores distinct values of the same type in a collection with no defined ordering

    2. 声明

       ```
       var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
       // favoriteGenres has been initialized with three initial items
       ```

    3. 集合操作

       ```
       let oddDigits: Set = [1, 3, 5, 7, 9] 
        let evenDigits: Set = [0, 2, 4, 6, 8] 
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7] 
        
        oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted() // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // [1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]
        if favoriteGenres.contains("Funk") { 
        print("I get up on the good foot.”)
        } 
       ```

31. dictionary

    1. A *dictionary* stores associations between keys of the same type 

       and values of the same type in a collection with no defifined 

       ordering.（Hashable）

    2. 声明

       ```
       var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB":"Dublin"]
       ```

    3. 通过key访问

       ```
       airports["LHR"] = "London"
        for (airportCode, airportName) in airports { 
        print("\(airportCode): \(airportName)") 
        }
       ```

32. Function

    1. ```
       func greet(to person: String)-> String{
       	let greeting = "Hello" + person + "!"
       	return  greeting
       }
       
       greet(to:"Bob")
       ```

    2. 函数定义和调用

       1. func
       2. 函数名
       3. 参数列表，每个参数有外部名（label，调用）和内部名（name）
       4. 返回值：->类型

    3. Argrument Label

       1. 参数标签的使⽤能够让⼀个函数在调⽤时更有表达⼒(调⽤者更好理解)，

          更类似⾃然语⾔，并且仍保持了函数内部的可读性

       2. 忽略外部参数

          ```
          func greet(_ person: String) -> String { 
           let greeting = "Hello " + person + "!"
           return greeting 
          } 
          greet("Bob")
          ```

       3. 如果参数只有⼀个名字，那么内外同名

          ```
          func greet(person: String) -> String { 
           let greeting = "Hello " + person + "!"
           return greeting 
          } 
          greet(person:"Bob")
          ```

33. 输入输出参数

    1. 函数参数默认是常量。试图在函数体中更改参数值将编译错误

    2. 定义时，使⽤inout关键字；调⽤时，参数名前加 & 

       ```
       func swap(first a : inout Int,second b : inout Int){
       	let temp = a
       	a = b 
       	b= temp
       }
       var x=10,y=20
       swap(first: &x, second: &y)
       print(x,y)
       ```

34. 可变参数

    1. 一个可变参数（variadic parameter）可以接受零个或多个值。

    2. 在变量类型名后面加入（...)的方式来定义可变参数。调⽤时,可以传⼊不

       确定数量的参数。可变参数的传⼊值在函数体中变为此类型的⼀个数组。

       ```
       func arithmeticMean(_ numbers:Double...)->Double{
       	var total: Double = 0
       	for number in numbers{
       		total += number
       	}
       	return total/Double(numbers.count)
       }
       arithmeticMean(1,2,3,4,5)
       ```

35. 函数返回值

    1. 函数可以没有返回值。也可以使⽤元组(tuple)类型让多个值作为⼀个复合

       值从函数中返回

       ```
       func minMax(array:[Int])->(min:Int,max:Int){
       	var currentMin = array[0]
       	var currentMax = array[0]
       	for value in array[1..<array.count]{
       		if value < currentMin {
       			currentMin = value
       		}else if value > currentMax{
       			currentMax = value
       		}
       	}
       	return (curremyMin,currentMax)
       }
       let bounds = minMax(array:[8,-6,2,109,3,71])
       print("min is \(bounds.min)and max is \(bounds.nax)")
       ```

36. function type 

    1. 每个函数都有种特定的函数类型,函数的类型由函数的参数类型和返回类型

       组成。没有返回类型使⽤Void

    2. 在 Swift 中,使⽤函数类型就像使⽤其他类型⼀样。可以定义函数的常量

       或变量，也可以作为函数的参数和返回值。

       ```
       func addTwoInts(_ a: Int, _ b: Int) -> Int { 
        return a + b 
       } 
       func multiplyTwoInts(_ a: Int, _ b: Int) -> Int { 
        return a * b } 
       var mathFunction: (Int, Int) -> Int = addTwoInts
       print("Result: \(mathFunction(2, 3))")
       func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) { 
        print("Result: \(mathFunction(a, b))") 
       } 
       printMathResult(addTwoInts, 3, 5)
       func chooseStepFunction(flag : Bool) -> (Int,Int) -> Int { 
        return flag ? addTwoInts : multiplyTwoInts
       }
       ```

37. Closure

    1. 



