$texto = Get-Content C:\Users\fsanchez\Desktop\Parametric\hola.txt
$Dictionary = @{}
$texto = $texto.Split("'' ,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)

function Get-WordCount { 
ForEach ($palabra in $texto)
    {
        If ($Dictionary.ContainsKey($palabra)) 
                {$Dictionary.$palabra++}
           else 
                {$Dictionary.Add($palabra, 1)}                
    }    
$Dictionary.GetEnumerator() | Sort -Descending
}