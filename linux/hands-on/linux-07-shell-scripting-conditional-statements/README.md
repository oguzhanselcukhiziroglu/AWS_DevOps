# Hands-on Linux-07 : Shell Scripting/Conditional Statements

Purpose of the this hands-on training is to teach the students how to use conditional statements in shell.
# Bu uygulamalı eğitimin amacı, öğrencilere shell'de koşullu ifadelerin nasıl kullanılacağını öğretmektir.
## Learning Outcomes

At the end of the this hands-on training, students will be able to;
# Bu uygulamalı eğitimin sonunda öğrenciler;
- explain conditional statements in shell.
# Shell'de koşullu ifadeleri açıklayabilecektir.
- use if statements in shell scripting
# Shell komut dosyası oluşturmada if ifadelerini kullanabileceklerdir.
- use case statements in shell scripting
# Shell komut dosyası oluşturmada case ifadelerini kullanabilecektir.
## Outline

- Part 1 - If Statements

- Part 2 - If Else Statements

- Part 3 - If Elif Else Statements

- Part 4 - Nested If Statements

- Part 5 - Boolean Operations

- Part 6 - Case Statements

## Part 1 - If Statements

- Unix Shell supports conditional statements that are used to perform different actions on the basis of different conditions.
# Unix Shell, farklı koşullar temelinde farklı eylemler gerçekleştirmek için kullanılan koşullu ifadeleri destekler.
- A simple if statement essentially states, if a particular test is true, then perform a specified set of actions. If it's not true, don't take those acts.
# Basit bir if ifadesi, esasen, belirli bir testin doğru olup olmadığını, ardından belirli bir dizi eylemi gerçekleştirdiğini belirtir. Bu doğru değilse, bu eylemleri yapmayın.
- Create a folder and name it `conditional-statements`.

```bash
mkdir conditional-statements && cd conditional-statements
```

- Create a `script` file named `if-statement.sh`. 

```bash
#!/bin/bash
read -p "Input a number: " number

if [[ $number -gt 50 ]]
then
  echo "The number is big."
fi
```

- Make the script executable and execute it.

```bash
chmod +x if-statement.sh
./if-statement.sh
```

- We can use `Relational Operators`, `String Operators` or `File Test Operators` inside the square brackets ( [ ] ) in the if statement above. 
# Yukarıdaki if ifadesinde köşeli parantezler ( [ ] ) içinde `İlişkisel operatörler`, `String operatörleri` veya `Dosya Test Operatörleri` kullanabiliriz.
### Relational Operators

- Bourne Shell supports the relational operators below that are specific to numeric values. These operators do not work for string values.
# Bourne Shell, aşağıdaki sayısal değerlere özgü ilişkisel operatörleri destekler. Bu operatörler, string değerleri için çalışmaz.
| Operator | Description |
| -------- | ----------- |
| -eq   | equal                  |
| -ne   | not equal              |
| -gt   | greater than           |
| -lt   | less than              |
| -ge   | greater than or equal  |
| -le   | less than or equal     |

### String Operators

- The string operators below are supported by Bourne Shell.
# Aşağıdaki string operatörleri Bourne Shell tarafından desteklenmektedir.
| Operator | Description |
| -------- | ----------- |
| =    | equal            |
| !=   | not equal        |
| -z   | Empty string     |
| -n   | Not empty string |

- Let's see this. Create a file and name it `string-operators.sh`

```bash
#!/bin/bash

if [[ "a" = "a" ]]
then
  echo "They are same"
fi

if [[ "a" != "b" ]]
then
  echo "They are not same"
fi

if [[ -z "" ]]
then
  echo "It is empty"
fi

if [[ -n "text" ]]
then
  echo "It is not empty"
fi
```

- Notice that there are spaces between the opening bracket `[` and the parameters "text" = "text", and then between the parameters and the closing bracket `]`. That is precisely because the brackets here act as a command, and you are separating the command from its parameters.
# Açılış ayracı `[` ile "metin" = "metin" parametreleri arasında ve ardından parametreler ile kapanış ayracı `]` arasında boşluk olduğuna dikkat edin. Bunun nedeni, buradaki parantezlerin bir komut görevi görmesi ve sizin komutu parametrelerinden ayırmanızdır.
- Make the script executable and execute it.

```bash
chmod +x string-operators.sh
./string-operators.sh
```

### File Test Operators

- There are a few operators that can be used to test various properties associated with a Linux file.
# Bir Linux dosyasıyla ilişkili çeşitli özellikleri test etmek için kullanılabilecek birkaç operatör vardır.
| Operator | Description |
| -------- | ----------- |
| -d file   | directory  |
| -e file   | exists     |
| -f file   | ordinary file     |
| -r file   | readable          |
| -s file   | size is > 0 bytes |
| -w file   | writable          |
| -x FILE   | executable        |

- Let's try this. Create files below and configure them.

```bash
mkdir folder
touch file 
chmod 400 file
```

Create a file and name it `file-operators.sh`

```bash
#!/bin/bash

if [[ -d folder ]]
then
  echo "folder is a directory"
fi

if [[ -f file ]]
then
  echo "file is an ordinary file"
fi

if [[ -r file ]]
then
  echo "file is a readable file"
fi

if [[ -w file ]]
then
  echo "file is a writable file"
fi

if [[ -s file ]]
then
  echo "file is > 0 bytes"
fi

if [[ -x $0 ]]   # script dosyamı işleme alıyor
then
  echo "$0 is an executable file "
fi
```

- Make the script executable and execute it.

```bash
chmod +x file-operators.sh
./file-operators.sh
```

## Part 2 - If Else Statements

- Sometimes we want to execute a block of code if a statement is true, and another block of code if it is false.
# Bazen bir ifade doğruysa bir kod bloğunu, yanlışsa başka bir kod bloğunu yürütmek isteriz.
- Create a `script` file named `ifelse-statement.sh`. 
# 'ifelse-statement.sh' adlı bir 'script' dosyası oluşturun.
```bash
#!/bin/bash
read -p "Input a number: " number

if [[ $number -ge 10 ]]
then
  echo "The number is bigger than or equal to 10."
else 
  echo "The number is smaller than 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x ifelse-statement.sh
./ifelse-statement.sh
```

> - Create a script. Ask user to enter `a file name` to create.
> - If there is a file with the same name, print the message "The file already exists."
> - If not, create the file and print the message "The file is created."
# Çözümü en sonda 
## Part 3 - If Elif Else Statements

- The elif statement is used when it requires to specify several conditions in our program.
# Elif deyimi, programımızda birden fazla koşulun belirtilmesi gerektiğinde kullanılır.
- Create a `script` file named `elif-statement.sh`. 

```bash
#!/bin/bash
read -p "Input a number: " number

if [[ $number -eq 10 ]]
then
  echo "The number is equal to 10."
elif [[ $number -gt 10 ]]
then
  echo "The number is bigger than 10"
else 
  echo "The number is smaller than 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x elif-statement.sh
./elif-statement.sh
```

## Part 4 - Nested If Statements

- If statements can be nested. Let's see the nested structure on the followig example.
# If deyimleri iç içe geçirilebilir. Aşağıdaki örnekte yuvalanmış yapıyı (nested) görelim.
- Create a `script` file named `nested-if-statement.sh`. 

```bash
#!/bin/bash

read -p "Input a number: " number

if [[ $number -gt 10 ]]
then
  echo "Number is bigger than 10"

  if (( $number % 2 == 1 ))
  then
    echo "And is an odd number."  # tek
  else
    echo "And is an even number"  # çift
  fi
else 
  echo "It is not bigger than 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x nested-if-statement.sh
./nested-if-statement.sh
```

## Part 5 - Boolean Operations

- The Boolean operators below are supported by the Bourne Shell.
# Aşağıdaki Boolean operatörleri Bourne Shell tarafından desteklenmektedir.
| Operator | Description |
| -------- | ----------- |
| !        | negation    |
| &&       | and         |
| ||       | or          |

- `!`  inverts a true condition into false and vice versa.
# doğru bir koşulu yanlışa çevirir ve bunun tersi de geçerlidir.
- `&&` is logical AND. If both the operands are true, then the condition becomes true otherwise false.
# `&&` mantıksal VE'dir. Her iki işlenen de doğruysa, koşul doğru olur, aksi takdirde yanlış olur.
- `||`	is logical OR. If one of the operands is true, then the condition becomes true.	
# `||` mantıksal VEYA'dır. İşlenenlerden biri doğruysa, koşul doğru olur.
- Create a `script` file named `boolean.sh`. 

```bash
#!/bin/bash

read -p "Input your name: " name
read -sp "Input your password: " password

if [[ $name = $(whoami) ]] && [[ $password = Aa1234 ]]
then
  echo -e "\nWelcome $(whoami)"
else
  echo -e "\nIt is wrong account"
fi
```

- Make the script executable and execute it.

```bash
chmod +x boolean.sh
./boolean.sh
```

## Part 6- Case Statements

- To execute a multiway branch, we can use several if-elif statements but that would soon become complicated. Bash case statements are similar to if-else statements but are easier and simpler. It helps to match one variable against several values.
# Çok yollu bir dal yürütmek için birkaç if-elif deyimi kullanabiliriz, ancak bu kısa sürede karmaşık hale gelecektir. Bash case ifadeleri, if-else ifadelerine benzer ancak daha kolay ve basittir. Bir değişkeni birkaç değerle eşleştirmeye yardımcı olur.
- Create a `script` file named `case-statement.sh`. 

```bash
#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number
read -p "Select an math operation
1 - addition
2 - subtraction
3 - multiplication
4 - division
" operation

case $operation in
  "1") 
     echo "result= $(( $first_number + $second_number))"
  ;;
  "2")
     echo "result= $(( $first_number - $second_number))"
  ;;
  "3")
     echo "result= $(( $first_number * $second_number))" 
  ;;
  "4")
     echo "result= $(( $first_number / $second_number))"
  ;;
  *)
     echo "Wrong choice..." 
  ;;
esac
```

- Make the script executable and execute it.

```bash
chmod +x case-statement.sh
./case-statement.sh
```

Assignment Solution:
vim test.sh

```bash
#!/bin/bash

read -p "Enter file name: " filename
if [[ -e $filename ]]
then
  echo "The file already exists."
else
  touch $filename
  echo "The file is created"
fi
```bash