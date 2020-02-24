//
// For ACPI Patched:
// _LID to XLID:
// Find:    5f4c 4944
// Replace: 584c 4944
//
// _Q13 to XQ13:
// Find:    5f51 3133
// Replace: 5851 3133
//
// _Q2B to XQ2B:
// Find:    5f51 3242
// Replace: 5851 3242
//
DefinitionBlock ("", "SSDT", 2, "OCLT", "SLPB", 0)
{
    External (_SB.LID_, DeviceObj)
    External (_SB.LID_.XLID, MethodObj)
    External (_SB.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.LPCB.EC.XQ13, MethodObj)
    External (_SB.PCI0.LPCB.EC.XQ2B, MethodObj)
    External (LID, DeviceObj)
    External (SLPB, DeviceObj)

    Device (S2EP)
    {
        Name (_ADR, Zero)
        Name (MYLD, One)
        Name (MPWS, Zero)
        Name (MODE, One)
        Method (_INI, 0, NotSerialized)
        {
            MYLD = One
            MPWS = Zero
        }

        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (_SB.LID)
    {
        Method (_LID, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((\S2EP.MYLD == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (\_SB.LID.XLID ())
                }
            }
            Else
            {
                Return (\_SB.LID.XLID ())
            }
        }
    }

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q13, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((\S2EP.MODE == Zero))
                {
                    If ((\S2EP.MYLD != Zero))
                    {
                        \S2EP.MYLD = Zero
                    }
                    Else
                    {
                        \S2EP.MYLD = One
                        \_SB.PCI0.LPCB.EC.XQ13 ()
                    }

                    Notify (LID, 0x80)
                }
                Else
                {
                    \S2EP.MPWS = One
                    Notify (SLPB, 0x80)
                }
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ13 ()
            }
        }

        Method (_Q2B, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((\S2EP.MODE == Zero))
                {
                    \S2EP.MYLD = One
                    \_SB.PCI0.LPCB.EC.XQ2B ()
                }
                Else
                {
                    \S2EP.MPWS = One
                    Notify (SLPB, 0x80)
                }
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ2B ()
            }
        }
    }
}

