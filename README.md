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

