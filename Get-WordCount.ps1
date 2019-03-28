function Get-WordCount { 
    param([System.IO.FileInfo]$Path)

$texto = Get-Content $Path
$texto = $texto.Split("'' .-_,123456789()\/&%?!", [System.StringSplitOptions]::RemoveEmptyEntries)
$Dictionary = @{}

ForEach ($palabra in $texto)
    {
        If ($Dictionary.ContainsKey($palabra)) 
                {$Dictionary.$palabra++}
           else 
                {$Dictionary.Add($palabra, 1)}                
    }    
$Dictionary.GetEnumerator() | Sort -Descending
}

$path = Read-Host -Prompt "Please, enter the path"

Get-WordCount $path