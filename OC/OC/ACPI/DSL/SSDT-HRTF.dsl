DefinitionBlock ("", "SSDT", 2, "OCLT", "HRTF", 0)
{
    External (_SB.PCI0.LPCB, DeviceObj)
    External (_SB.PCI0.LPCB.RTC, DeviceObj)
    External (_SB.PCI0.LPCB.TIMR, DeviceObj)
    External (HPTE, IntObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            HPTE = Zero
        }
    }

    Scope (_SB.PCI0.LPCB.RTC)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0.LPCB.TIMR)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (HPE0)
        {
            Name (_HID, EisaId ("PNP0103"))
            Name (_UID, Zero)
            Name (BUF0, ResourceTemplate ()
            {
                IRQNoFlags ()
                    {0,8}
                Memory32Fixed (ReadWrite,
                    0xFED00000,
                    0x00000400,
                    )
            })
            
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

            Method (_CRS, 0, Serialized)
            {
                Return (BUF0)
            }
        }

        Device (RTC0)
        {
            Name (_HID, EisaId ("PNP0B00"))
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0070,
                    0x0070,
                    0x01,
                    0x08,
                    )
            })
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

        Device (TIM0)
        {
            Name (_HID, EisaId ("PNP0100"))
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0040,
                    0x0040,
                    0x01,
                    0x04,
                    )
                IO (Decode16,
                    0x0050,
                    0x0050,
                    0x10,
                    0x04,
                    )
            })
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
}

