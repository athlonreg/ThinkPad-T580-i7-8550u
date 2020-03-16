/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20191213 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-BKeyQ14Q15-ThinkPadT580.aml, Tue Feb 18 15:41:32 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000156 (342)
 *     Revision         0x02
 *     Checksum         0xD5
 *     OEM ID           "hack"
 *     OEM Table ID     "_KBD"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BKEY", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.XQ14, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ15, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0406)
                Notify (\_SB.PCI0.LPCB.KBD, 0x10) // Reserved
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ14 ()
            }
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0405)
                Notify (\_SB.PCI0.LPCB.KBD, 0x20) // Reserved
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ15 ()
            }
        }
    }
}

