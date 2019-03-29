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

ForEach ($elementoDeArray in $inputArray)
    {
    if([System.IO.File]::Exists($elementoDeArray))
    {
        $texto = Get-Content $elementoDeArray
        $texto = $texto.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
        ForEach ($palabradetexto in $texto)
         {
        If ($Dictionary.ContainsKey($palabradetexto)) 
                {$Dictionary.$palabradetexto++}
           else 
                {$Dictionary.Add($palabradetexto, 1)}                
         }
    }
    else
        {
        $texto = $elementoDeArray.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
        ForEach ($palabradetexto in $texto)
            {
                If ($Dictionary.ContainsKey($palabradetexto)) 
                        {$Dictionary.$palabradetexto++}
                   else 
                        {$Dictionary.Add($palabradetexto, 1)}                
            } 
    }
               
    }        
$Dictionary.GetEnumerator() | Sort -Descending
    }
}