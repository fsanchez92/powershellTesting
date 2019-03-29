Describe "Get-WordCount" {
     It "accepts a path to a file and returns a map where each word is a key and the value is the number of times the word appeared in the file" {
    $expected = @{"abc" = 1
                  "test" = 1}
    Get-WordCount ("abc" , "test") | Should -Be ($expected.GetEnumerator() | sort Name)  
 

    } 
}

Describe "Get-WordCount" {
     It "accepts a path to a file and returns a map where each word is a key and the value is the number of times the word appeared in the file" {
    $expected = @{"test" = 1}
    Get-WordCount ("test") | Should -Be ($expected.GetEnumerator() | sort Name)  
 

    } 
}
