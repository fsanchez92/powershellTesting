Describe "Get-ArrayElement" {
    It "do"{
    $text = ("hi","hi","bye")
    $Dictionary = @{} 
    $expectedDictionary = @{"hi"=2;"bye"=1}
    Get-ArrayElement $text $Dictionary 
    $Dictionary | Should -beLike $expectedDictionary 
    }
}