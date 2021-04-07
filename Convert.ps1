function Convert-File {
Param(
	 #[Parameter(Mandatory=$True)]
 	[string]$min
	
     )

$inputFile = "./prices.json"
$outputFile = "./prices.csv"


$json = ConvertFrom-JSON (Get-Content $inputFile -Raw)

$result = $json | Where-Object Price -gt $min | Sort-Object ProductName

$result | ConvertTo-Csv | Out-File $outputFile


}

Convert-File 50
