# Hands-on Linux-09 : Shell Scripting/Functions

Purpose of the this hands-on training is to teach the students how to use functions in shell.
# Bu uygulamalı eğitimin amacı, öğrencilere shell'de fonksiyonların nasıl kullanılacağını öğretmektir.
## Learning Outcomes

At the end of the this hands-on training, students will be able to;
# Bu uygulamalı eğitimin sonunda öğrenciler;
- explain and use functions in shell.
# Shell'deki fonksiyonları açıklayabilecek ve kullanabilecekler.
## Outline

- Part 1 - Creating Functions

- Part 2 - Passing Arguments to Functions  # Fonksiyonlara Argüman Geçirme

- Part 3 - Returning Values from Functions

- Part 4 - Nested Functions

- Part 5 - Variables Scope

## Part 1 - Creating Functions

- A Bash function is a piece of code that only runs when it is called. Functions enable you to reuse code. We can call the functions numerous times.
# Bash fonksiyonu, yalnızca çağrıldığında çalışan bir kod parçasıdır. Fonksiyonlar, kodu yeniden kullanmanızı sağlar. Fonksiyonları defalarca çağırabiliriz.
- Create a folder and name it `functions`.

```bash
mkdir functions && cd functions
```

- It is pretty easy to declare and call a function. Create a `script` file named `functions.sh`. 
# Bir fonksiyonu bildirmek ve çağırmak oldukça kolaydır. "functions.sh" adlı bir "komut dosyası" dosyası oluşturun.
```bash
#!/bin/bash

Welcome () {
    echo "Welcome to Linux Lessons"
}

Welcome
```

- Make the script executable and execute it.

```bash
chmod +x functions.sh
./functions.sh
```

## Part 2 - Passing Arguments to Functions

- We can pass any number of arguments to the bash function in a similar way to passing command line arguments to a script. We simply supply them right after the function’s name, separated by a space. These parameters would be represented by $1, $2 and so on, corresponding to the position of the parameter after the function’s name.
# Komut satırı argümanlarını bir scripte geçirmeye benzer şekilde, bash işlevine herhangi bir sayıda argüman iletebiliriz. Bunları, bir boşlukla ayırarak, fonksiyonun adından hemen sonra sağlarız. Bu parametreler, fonksiyon adından sonra parametrenin konumuna karşılık gelen $1, $2 vb. ile temsil edilecektir.
- Let's update the `functions.sh` script to see this.

```bash
#!/bin/bash

Welcome () {
    echo "Welcome to Linux Lessons $1 $2 $3"
}

Welcome Joe Matt Timothy
```

- And execute it.

```bash
./functions.sh
```

## Part 3 - Returning Values from Functions

- Functions in other programming languages return a value when called. But, Bash functions don’t return a value when called. But we can define a return status similar to exit status of a command.
# - Diğer programlama dillerindeki fonksiyonlar, çağrıldıklarında bir değer döndürür. Ancak Bash işlevleri çağrıldığında bir değer döndürmez. Ancak bir komutun çıkış durumuna benzer bir dönüş durumu tanımlayabiliriz.
- When any shell command terminates, it returns an exit code, which indicates `0` for success and non-zero decimal number in the `1 - 255` range for failure. The special variable `$?` returns the exit status of the last executed command. Let's see this.
# Herhangi bir shell komutu sonlandırıldığında, başarı için "0" ve başarısızlık için "1 - 255" aralığında sıfır olmayan ondalık sayı gösteren bir çıkış kodu döndürür. `$?` özel değişkeni, son yürütülen komutun çıkış durumunu döndürür. Bunu görelim.
```bash
pwd
echo $?  #0
pwt  # It is wrong command
echo $?  #127
```

- When a bash function completes, its return value is the status of the last statement executed in the function. We can speciy return status by using the `return` keyword. We can think the `return` keyword as exit status of function. 
# Bir bash fonksiyonu tamamlandığında, dönüş değeri, fonksiyonda yürütülen son ifadenin durumudur. `return` anahtar sözcüğünü kullanarak iade durumunu belirleyebiliriz. `return` anahtar kelimesini fonksiyonun çıkış durumu olarak düşünebiliriz.
- Add `return 3` line to `Welcome function`.

```bash
#!/bin/bash

Welcome () {
    echo "Welcome to Linux Lessons $1 $2 $3"
    return 3  # Program başarılıysa herhangi bir şey döndür
    }

Welcome Joe Matt Timothy
echo $?
```

- And execute it.

```bash
./functions.sh
```

## Part 4 - Nested Functions

- One of the useful features of functions is that they can call themselves and other functions. 
# Fonksiyonların kullanışlı özelliklerinden biri de kendilerini ve diğer fonksiyonları çağırabilmeleridir.
- Create a `script` file named `nested-functions.sh`.

```bash
#!/bin/bash

function_one () {
   echo "This is from the first function"
   function_two
}

function_two () {
   echo "This is from the second function"
}

function_one
```

- Make the script executable and execute it.

```bash
chmod +x nested-functions.sh
./nested-functions.sh
```

## Part 5 - Variables Scope

- Global variables are variables that can be accessed from anywhere in the script regardless of the scope. In Bash, by default all variables are defined as global, even if declared inside the function.
Local variables can be declared within the function body with the local keyword and can be used only inside that function. 
# Global değişkenler, kapsam ne olursa olsun komut dosyasında herhangi bir yerden erişilebilen değişkenlerdir. Bash'de, varsayılan olarak tüm değişkenler, fonksiyon içinde bildirilmiş olsalar bile genel olarak tanımlanır. Yerel değişkenler, yerel anahtar kelime ile fonksiyon gövdesi içinde bildirilebilir ve yalnızca bu işlevin içinde kullanılabilir.
- Create a `script` file named `variables-scope.sh`.

```bash
#!/bin/bash

var1='global 1'
var2='global 2'

var_scope () {
  local var1='function 1'
  var2='function 2'
  echo -e "Inside function:\nvar1: $var1\nvar2: $var2"
}

echo -e "Before calling function:\nvar1: $var1\nvar2: $var2"

var_scope

echo -e "After calling function:\nvar1: $var1\nvar2: $var2"
```

- Make the script executable and execute it.

```bash
chmod +x variables-scope.sh
./variables-scope.sh
```

# var 2 neden değişti çünkü fonksiyon içinde tanımlanmış olsa dahi local diye belirtmedik.