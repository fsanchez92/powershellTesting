function Get-WordCount { 
[CmdletBinding()]    
param(
[Parameter(ValueFromPipeline=$True)]
$inputArray,
[parameter(ValueFromPipeline=$True)]
        [string]$String
)

Process{

$Dictionary = @{}

ForEach ($arrayElement in $inputArray)
    {
    if([System.IO.File]::Exists($arrayElement))
    {
        $text = Get-Content $arrayElement
        $text = $text.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
        ForEach ($word in $text)
         {
        If ($Dictionary.ContainsKey($word)) 
                {$Dictionary.$word++}
           else 
                {$Dictionary.Add($word, 1)}                
         }
    }
    else
        {
        $text = $arrayElement.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
        ForEach ($word in $text)
            {
                If ($Dictionary.ContainsKey($word)) 
                        {$Dictionary.$word++}
                   else 
                        {$Dictionary.Add($word, 1)}                
            } 
    }
               
    }        
$Dictionary.GetEnumerator() | Sort Name
    }
}