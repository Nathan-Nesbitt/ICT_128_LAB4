# Answers

Please only modify `ICT_128_LAB_4.psm1`. Do not change the function names or the filename, for example if the demo code
looks like the following:

```ps
function Q1 {

}
```

Your solution should only be **between** the brackets. 

# Testing

We are going to be using pester in this lab. You can install it by running `Install-Module Pester -Force` then `Import-Module Pester -PassThru`

To tests your answers simply run `./ICT_128_LAB_4.Tests.ps1`.

# Questions

1. Create a function that takes a job as a parameter, the function should stop the job using the Id of the passed in job. Return nothing.
    Explain in a comment how this parameter is being passed into the second cmdlet using the pipeline.
2. Create a function that takes a job as a parameter, the function should stop the job 
    using the job object. Return nothing. Explain the difference between Q1 and this question in regards to how this parameter is being passed into the second mcdlet using the pipeline.
3. Create a function that recieves a path to a CSV file which contains a list of jobs. The
    function should load in the CSV file, and convert the contents of the file so that
    it returns all the jobs with a new column called `Id`. The file will contain data in
    the following format: 

```csv
JobName,JobId
MyJob,1000
```

4. Create a function that recieves a list of jobs and a number `n`. Have the function 
    stop the `n-1`th job that was passed in. 

5. Create a function that gets a list of processes on the system, format them in a table 
    which only contains the Name, Id, and WS properties. Return the table.

6. Create a function that gets a list of the processes on the system, format the processes 
    so that you have one column in a table called "combined" which contains the Name and 
    the Id of each process, separated by a space. Return the table.

7. Create a function that takes in a string, and a list of strings, and checks to see if
    the first string exists in the list of strings. Return a boolean.

8. Create a function that takes in two numbers. If the first number is less than the second
    return "smaller". If the numbers are equal return "equal". If the first number is 
    larger than the second number, return "larger".

9. Create a function that takes in a list of jobs, and an Id. The function should look
    filter the given jobs and only kill the job with the given Id. This function should
    not return anything.

10. Create a function that takes in a random number, if the number is even you should 
    return the number. If the number is odd you should return false.

11. Explain in a comment the best practices for filtering. What steps should you take 
    in what order and why.
