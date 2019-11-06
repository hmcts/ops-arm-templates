$here = Split-Path -Parent $MyInvocation.MyCommand.Path

Describe 'ARM template validation' {
    $rawContent = Get-Content $here\template.json -Raw -ErrorAction SilentlyContinue
    $template = ConvertFrom-Json -InputObject $rawContent -ErrorAction SilentlyContinue
    Context 'File validation' {
        It 'Template ARM file exists' {
            Test-Path $here\template.json -Include '*.json' | Should -Be $true
        }
        It 'Is a valid JSON file' {
            $rawContent | ConvertFrom-Json -ErrorAction SilentlyContinue | Should -Not -Be $Null
        }
    }
    Context 'Template content validation' {
        It "Contains all required elements" {
            $Elements = '$schema',
                'contentVersion',
                'functions',
                'outputs',
                'parameters',
                'resources',
                'variables'                                
            $templateProperties = $template | Get-Member -MemberType NoteProperty | ForEach-Object { $_.Name }
            $templateProperties | Should -Be $Elements
        }
        It "Creates the expected resources" {
            $Element = 'Microsoft.Web/sites'
            $templateResources = $template.Resources.type
            $templateResources | Should -Be $Element
        }
        It 'Has the custom function hmcts.getAspName' {
            $Element = '@{getAfName=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
    }
}