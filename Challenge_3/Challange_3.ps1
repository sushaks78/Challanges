# Define a function to retrieve nested values from a hashtable
function Get-ValueFromNestedObject {
    param (
        [hashtable] $obj,
        [string] $key
    )

    # Split the provided key into individual keys
    $keys = $key -split '/'
    
    # Start with the top-level hashtable
    $value = $obj
    
    # Loop through each key in the key path
    foreach ($k in $keys) {
        # Check if the current key exists in the current hashtable
        if ($value.ContainsKey($k)) {
            # If the key exists, update the current value to the value associated with the current key
            $value = $value[$k]
        } else {
            # If the key doesn't exist, return $null to indicate the path is invalid
            return $null
        }
    }
    
    # Return the final value located at the specified key path
    return $value
}

# Example 1
$obj1 = @{ "a" = @{ "b" = @{ "c" = "d" } } }
$key1 = "a/b/c"
$result1 = Get-ValueFromNestedObject -obj $obj1 -key $key1
Write-Host "Example 1 Result: $result1"

# Example 2
$obj2 = @{ "x" = @{ "y" = @{ "z" = "a" } } }
$key2 = "x/y/z"
$result2 = Get-ValueFromNestedObject -obj $obj2 -key $key2
Write-Host "Example 2 Result: $result2"