﻿function Get-WordCount { 
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
        Get-ArrayElement $text $Dictionary
    }
    else
        {
        Get-ArrayElement $text $Dictionary       
    }
               
    }        
$Dictionary.GetEnumerator() | Sort Name
    }
}

function Get-ArrayElement ($text, $Dictionary){

$text = $text.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
        
        ForEach ($word in $text)
            {
                If ($Dictionary.ContainsKey($word)) 
                        {$Dictionary.$word++}
                   else 
                        {$Dictionary.Add($word, 1)}                
            }
}
