#--------------------- Arrays manipulation ---------------------
my_array=("Moto🚀" "Voiture" "Jet privé" "Ecole")
echo ${my_array[1]} # == Voiture
echo ${my_array[-1]} # == Ecole
echo ${my_array[@]} # == get all element of array
echo ${#my_array[@]} # == get len of array
echo "-----------------------------------"

# Bash doesn't support true array slicing, you can achieve similar results using a combination of array indexing and string slicing:
array=("A" "B" "C" "D" "E")
echo "${array[@]}" # Output: A B C D E
echo "${array[1]}" # Output: B
echo "${array[@]:1:3}" # Output: B C D  (requires Bash 4.0+)
echo "${array[@]:3}" # Output: D E Print from an index

# NOTE!: When working with arrays, always use [@] to refer to all elements, and enclose the parameter expansion in quotes to preserve spaces in array elements

# String slicing: In Bash, you can extract portions of a string using slicing. The basic syntax is: ${string:start:length} here 
# length represents the maximum of the extracted substring

text="ABCDE"
echo "${text:0:2}" # Output: AB
echo "${text:3}" # Output: DE
echo "${text:1:3}" # Output: BCD
echo "${text:3:3}" # Output: DE (only 2 characters available)

text="Hello, World!"
echo ${text:0:5} # Output: Hello
echo ${text:7:5} # Output: World
echo "${text:7:10}" # Output: World!

