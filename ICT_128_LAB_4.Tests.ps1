BeforeAll {
    Import-Module -Name ./ICT_128_LAB_4.psm1
}
Describe 'Check-Q1' {
    It 'Basic Test' {
        $processID = Start-Job -ScriptBlock { Start-Sleep 10 }
        $processID.State | Should -Be "Running"
        Q1 $processID
        $processID.State | Should -Be "Stopped"
    }
}

Describe 'Check-Q2' {
    It 'Basic Test' {
        $processID = Start-Job -ScriptBlock { Start-Sleep 10 }
        $processID.State | Should -Be "Running"
        Q2 $processID
        $processID.State | Should -Be "Stopped"
    }
}

Describe 'Check-Q3' {
    It 'Basic Test' {

        $ps1 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps2 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps3 = Start-Job -ScriptBlock { Start-Sleep 10 }

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"

        $filename = "$(Get-Random).csv"

        "JobName,JobId" | Out-File $filename
        "$($ps1.Name),$($ps1.Id)" | Add-Content $filename
        "$($ps2.Name),$($ps2.Id)" | Add-Content $filename
        "$($ps3.Name),$($ps3.Id)" | Add-Content $filename
        
        $result = Q3 $filename

        foreach ($job in $result) {
            $job.Id | Should -Be $job.JobId
        }

        Remove-Item $filename
    }
}

Describe 'Check-Q4' {
    It 'Basic Test' {
        $ps1 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps2 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps3 = Start-Job -ScriptBlock { Start-Sleep 10 }

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"

        Q4 $ps1, $ps2, $ps3 1

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Stopped"
        $ps3.State | Should -Be "Running"
    }

    It '2nd test' {
        $ps1 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps2 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps3 = Start-Job -ScriptBlock { Start-Sleep 10 }

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"

        Q4 $ps1, $ps2, $ps3 0

        $ps1.State | Should -Be "Stopped"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"
    }
}

Describe 'Check-Q5' {
    It 'Basic Test' {
        $result = Q5
        $result | Should -not -BeNullOrEmpty
    }
}

Describe 'Check-Q6' {
    It 'Basic Test' {
        $result = Q6
        $result | Should -not -BeNullOrEmpty
    }
}



Describe 'Check-Q7' {
    It 'Basic Test' {
        $array = "b", "a", "c"
        $result = Q7 "a"  $array 
        $result | Should -Be $true    
    }

    It 'False Test' {
        $array = "b", "a", "c"
        $result = Q7 "d" $array 
        $result | Should -Be $false    
    }
}

Describe 'Check-Q8' {
    It 'Basic Test' {
        $result = Q8 8 9 
        $result | Should -Be "smaller"    
    }

    It 'Basic Test' {
        $result = Q8 10 9 
        $result | Should -Be "larger"   
    }

    It 'Basic Test' {
        $result = Q8 9 9 
        $result | Should -Be "equal"   
    }
}

Describe 'Check-Q9' {
    It 'Basic Test' {
        $ps1 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps2 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps3 = Start-Job -ScriptBlock { Start-Sleep 10 }

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"

        $arr = $ps2, $ps1, $ps3
        Q9 $arr $ps1.Id

        $ps1.State | Should -Be "Stopped"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"
    }

    It 'Test 2' {
        $ps1 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps2 = Start-Job -ScriptBlock { Start-Sleep 10 }
        $ps3 = Start-Job -ScriptBlock { Start-Sleep 10 }

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Running"

        $arr = $ps2, $ps1, $ps3
        Q9 $arr $ps3.Id

        $ps1.State | Should -Be "Running"
        $ps2.State | Should -Be "Running"
        $ps3.State | Should -Be "Stopped"
    }
}

Describe 'Check-Q10' {
    It 'Odd' {
        $result = Q10 1
        $result | Should -Be $false
    }

    It 'Even' {
        $result = Q10 2
        $result | Should -Be 2
    }

    It '2nd Odd' {
        $result = Q10 7
        $result | Should -Be $false
    }

    It '2nd Even' {
        $result = Q10 10
        $result | Should -Be 10
    }
    
}
