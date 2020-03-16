/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190509 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLmgmied.aml, Tue Feb 18 15:58:20 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000524 (1316)
 *     Revision         0x02
 *     Checksum         0x2E
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BATC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BATC", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0._BIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT0._BST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT0._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BAT1._BIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT1._BST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT1._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT1._STA, MethodObj)    // 0 Arguments

    Scope (_SB.PCI0.LPCB.EC)
    {
        Device (BATC)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (_OSI ("Darwin"))
                {
                    ^^BAT0._HID = Zero
                    ^^BAT1._HID = Zero
                }
            }

            Method (CVWA, 3, NotSerialized)
            {
                If (Arg2)
                {
                    Arg0 = ((Arg0 * 0x03E8) / Arg1)
                }

                Return (Arg0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return ((^^BAT0._STA () | ^^BAT1._STA ()))
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (B0CO, Zero)
            Name (B1CO, Zero)
            Name (B0DV, Zero)
            Name (B1DV, Zero)
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Local0 = ^^BAT0._BST ()
                Local2 = ^^BAT0._STA ()
                If ((0x1F == Local2))
                {
                    Local4 = DerefOf (Local0 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }
                }

                Local1 = ^^BAT1._BST ()
                Local3 = ^^BAT1._STA ()
                If ((0x1F == Local3))
                {
                    Local4 = DerefOf (Local1 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }
                }

                If (((0x1F != Local2) && (0x1F == Local3)))
                {
                    Local0 = Local1
                    Local2 = Local3
                    Local3 = Zero
                }

                If (((0x1F == Local2) && (0x1F == Local3)))
                {
                    Local4 = DerefOf (Local0 [Zero])
                    Local5 = DerefOf (Local1 [Zero])
                    If (((Local4 == 0x02) || (Local5 == 0x02)))
                    {
                        Local0 [Zero] = 0x02
                    }
                    ElseIf (((Local4 == One) || (Local5 == One)))
                    {
                        Local0 [Zero] = One
                    }
                    ElseIf (((Local4 == 0x05) || (Local5 == 0x05)))
                    {
                        Local0 [Zero] = 0x05
                    }
                    ElseIf (((Local4 == 0x04) || (Local5 == 0x04)))
                    {
                        Local0 [Zero] = 0x04
                    }

                    Local0 [One] = (CVWA (DerefOf (Local0 [One]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [One]), B1DV, B1CO))
                    Local0 [0x02] = (CVWA (DerefOf (Local0 [0x02]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x02]), B1DV, B1CO))
                    Local0 [0x03] = ((DerefOf (Local0 [0x03]) + DerefOf (
                        Local1 [0x03])) / 0x02)
                }

                Return (Local0)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Local0 = ^^BAT0._BIF ()
                Local2 = ^^BAT0._STA ()
                If ((0x1F == Local2))
                {
                    Local4 = DerefOf (Local0 [One])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }

                    Local4 = DerefOf (Local0 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }

                    Local4 = DerefOf (Local0 [0x04])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }
                }

                Local1 = ^^BAT1._BIF ()
                Local3 = ^^BAT1._STA ()
                If ((0x1F == Local3))
                {
                    Local4 = DerefOf (Local1 [One])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }

                    Local4 = DerefOf (Local1 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }

                    Local4 = DerefOf (Local1 [0x04])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }
                }

                If (((0x1F != Local2) && (0x1F == Local3)))
                {
                    Local0 = Local1
                    Local2 = Local3
                    Local3 = Zero
                }

                If (((0x1F == Local2) && (0x1F == Local3)))
                {
                    B0CO = !DerefOf (Local0 [Zero])
                    B1CO = !DerefOf (Local1 [Zero])
                    Local0 [Zero] = One
                    B0DV = DerefOf (Local0 [0x04])
                    B1DV = DerefOf (Local1 [0x04])
                    Local0 [One] = (CVWA (DerefOf (Local0 [One]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [One]), B1DV, B1CO))
                    Local0 [0x02] = (CVWA (DerefOf (Local0 [0x02]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x02]), B1DV, B1CO))
                    Local0 [0x04] = ((B0DV + B1DV) / 0x02)
                    Local0 [0x05] = (CVWA (DerefOf (Local0 [0x05]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x05]), B1DV, B1CO))
                    Local0 [0x06] = (CVWA (DerefOf (Local0 [0x06]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x06]), B1DV, B1CO))
                }

                Return (Local0)
            }
        }
    }
}

