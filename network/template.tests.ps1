$here = Split-Path -Parent $MyInvocation.MyCommand.Path

Describe 'ARM template validation' {
    $rawContent = Get-Content $here\template.json -Raw -ErrorAction SilentlyContinue
    $template = ConvertFrom-Json -InputObject $rawContent -ErrorAction SilentlyContinue
    Context 'File validation' {
        It 'Template ARM file exists' {
            Test-Path $here\template.json -Include '*.json' | Should -Be $True
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
            $Element = 'Microsoft.Resources/resourceGroups'
            $templateResources = $template.Resources.type
            $templateResources | Should -Be $Element
        }
        It 'Has the custom function hmcts.getrtNameUkwest' {
            $Element = '@{getrtNameUkwest=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
        It 'Has the custom function hmcts.getvnNameUkwest' {
            $Element = '@{getvnNameUkwest=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
        It 'Has the custom function hmcts.getrtNameUksouth' {
            $Element = '@{getrtNameUksouth=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
        It 'Has the custom function hmcts.getvnNameUksouth' {
            $Element = '@{getvnNameUksouth=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
        It 'Has the custom function hmcts.getnsgNameUkwest' {
            $Element = '@{getnsgNameUkwest=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
        It 'Has the custom function hmcts.getnsgNameUksouth' {
            $Element = '@{getnsgNameUksouth=}'
            $template.Functions.members | ForEach-Object { $_ -Match $Element } | Should -Contain $True
        }
    }
}