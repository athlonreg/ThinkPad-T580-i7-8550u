DefinitionBlock ("", "SSDT", 2, "OCLT", "PWRB", 0)
{
    Device (_SB.PWRB)
    {
        Name (_HID, EisaId ("PNP0C0C"))
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
}

