//
// In ACPI Patch:
// _Q14 to XQ14:
// Find:    5f51 3134
// Replace: 5851 3134
//
// _Q15 to XQ15:
// Find:    5f51 3135
// Replace: 5851 3135
//
DefinitionBlock ("", "SSDT", 2, "OCLT", "BKEY", 0)
{
    External (_SB.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.LPCB.EC.XQ14, MethodObj)
    External (_SB.PCI0.LPCB.EC.XQ15, MethodObj)
    External (_SB.PCI0.LPCB.KBD, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Method (_Q14, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0406)
                Notify (\_SB.PCI0.LPCB.KBD, 0x10)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ14 ()
            }
        }

        Method (_Q15, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0405)
                Notify (\_SB.PCI0.LPCB.KBD, 0x20)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ15 ()
            }
        }
    }
}

