# Bash Note

## File Expressions

These expressions are used to test various file attributes in shell scripts.

1. **True if file exists:**

   ```bash
   [[ -a ${file} ]]
   ```

2. **True if file exists and is a block special file:**

   ```bash
   [[ -b ${file} ]]
   ```

3. **True if file exists and is a character special file:**

   ```bash
   [[ -c ${file} ]]
   ```

4. **True if file exists and is a directory:**

   ```bash
   [[ -d ${file} ]]
   ```

5. **True if file exists:**

   ```bash
   [[ -e ${file} ]]
   ```

6. **True if file exists and is a regular file:**

   ```bash
   [[ -f ${file} ]]
   ```

7. **True if file exists and is a symbolic link:**

   ```bash
   [[ -h ${file} ]]
   ```

8. **True if file exists and is readable:**

   ```bash
   [[ -r ${file} ]]
   ```

9. **True if file exists and has a size greater than zero:**

   ```bash
   [[ -s ${file} ]]
   ```

10. **True if file exists and is writable:**

    ```bash
    [[ -w ${file} ]]
    ```

11. **True if file exists and is executable:**

    ```bash
    [[ -x ${file} ]]
    ```

12. **True if file exists and is a symbolic link:**

    ```bash
    [[ -L ${file} ]]
    ```

---

## String Expressions

These expressions are used to evaluate string conditions in shell scripts.

1. **True if the shell variable `varname` is set (has been assigned a value):**

   ```bash
   [[ -v ${varname} ]]
   ```

2. **True if the length of the string is zero:**

   ```bash
   [[ -z ${string} ]]
   ```

3. **True if the length of the string is non-zero:**

   ```bash
   [[ -n ${string} ]]
   ```

4. **True if the strings are equal:**

   ```bash
   [[ ${string1} == ${string2} ]]
   ```

5. **True if the strings are not equal:**

   ```bash
   [[ ${string1} != ${string2} ]]
   ```

6. **True if `string1` sorts before `string2` lexicographically:**

   ```bash
   [[ ${string1} < ${string2} ]]
   ```

7. **True if `string1` sorts after `string2` lexicographically:**

   ```bash
   [[ ${string1} > ${string2} ]]
   ```

---

## Arithmetic Operators

These expressions are used to compare integer values in shell scripts.

1. **Returns true if the numbers are equal:**

   ```bash
   [[ ${arg1} -eq ${arg2} ]]
   ```

2. **Returns true if the numbers are not equal:**

   ```bash
   [[ ${arg1} -ne ${arg2} ]]
   ```

3. **Returns true if `arg1` is less than `arg2`:**

   ```bash
   [[ ${arg1} -lt ${arg2} ]]
   ```

4. **Returns true if `arg1` is less than or equal to `arg2`:**

   ```bash
   [[ ${arg1} -le ${arg2} ]]
   ```

5. **Returns true if `arg1` is greater than `arg2`:**

   ```bash
   [[ ${arg1} -gt ${arg2} ]]
   ```

6. **Returns true if `arg1` is greater than or equal to `arg2`:**

   ```bash
   [[ ${arg1} -ge ${arg2} ]]
   ```

> Note: `arg1` and `arg2` may be positive or negative integers.

### Logical AND / OR

You can combine conditions using logical operators:

* **AND condition (both must be true):**

  ```bash
  [[ test_case_1 ]] && [[ test_case_2 ]]
  ```

* **OR condition (either can be true):**

  ```bash
  [[ test_case_1 ]] || [[ test_case_2 ]]
  ```

---

## Exit Status Operators

These expressions check the result of the previously executed command using `$?`.

1. **Returns true if the command was successful (exit code 0):**

   ```bash
   [[ $? -eq 0 ]]
   ```

2. **Returns true if the command was not successful (exit code > 0):**

   ```bash
   [[ $? -gt 0 ]]
   ```

---

In order to debug your bash scripts, you can use -x when executing
your scripts:
   ```bash
   bash -x ./your_script.sh
   ```
---

# Terminal Shortcuts Cheat Sheet

### Delete Commands
- **Delete everything from the cursor to the end of the line:**  
  `Ctrl + K`
- **Delete everything from the cursor to the start of the line:**  
  `Ctrl + U`
- **Delete one word backward from cursor:**  
  `Ctrl + W`

### History and Search
- **Search your history backward:**  
  `Ctrl + R`  
  _This is probably the one that I use the most. It is really handy and speeds up my workflow a lot._

### Screen Management
- **Clear the screen (alternative to typing `clear`):**  
  `Ctrl + L`
- **Stop output to the screen:**  
  `Ctrl + S`
- **Enable output to the screen (if previously stopped with Ctrl + S):**  
  `Ctrl + Q`

### Process Control
- **Terminate the current command:**  
  `Ctrl + C`
- **Throw the current command to background:**  
  `Ctrl + Z`


###  Operator Description
- `>` : Save output to a file
-  `>>` :  Append output to a file
-  `<`: Read input from a file
-  `2>` : Redirect error messages
-  `|` : Send the output from one program as input to another program
-  `<<` : Pipe multiple lines into a program cleanly
-  `<<<` : Pipe a single line into a program cleanly

## User add command:
   useradd options (see: man useradd):
   
- -r, --system Create a system account. see: Implications creating system accounts
- -m, --create-home Create the user's home directory.
- -d, --home-dir HOME_DIR Home directory of the new account.
- -s, --shell SHELL Login shell of the new account.
- -g, --gid GROUP Name or ID of the primary group.
- -G, --groups GROUPS List of supplementary groups.
- -u, --uid UID Specify user ID. see: Understanding how uid and gid work in Docker containers [see plus](https://medium.com/@mccode/understanding-how-uid-and-gid-work-in-docker-containers-c37a01d01cf)
- -p, --password PASSWORD Encrypted password of the new account (e.g. ubuntu).
