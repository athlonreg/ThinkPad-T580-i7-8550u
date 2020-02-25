DefinitionBlock ("", "SSDT", 1, "OCLT", "THBT", 0)
{
    External (_SB.PCI0, DeviceObj)
    External (_SB.PCI0.RP09, DeviceObj)
    External (_SB.PCI0.RP09.PXSX, DeviceObj)
    External (PXSX, DeviceObj)

    Scope (_SB.PCI0.RP09)
    {
        Scope (PXSX)
        {
            Name (_STA, Zero)
        }

        Method (_RMV, 0, NotSerialized)
        {
            Return (Zero)
        }

        Device (UPSB)
        {
            Name (_ADR, Zero)
            OperationRegion (A1E0, PCI_Config, Zero, 0x40)
            Field (A1E0, ByteAcc, NoLock, Preserve)
            {
                AVND,   32, 
                BMIE,   3, 
                Offset (0x18), 
                PRIB,   8, 
                SECB,   8, 
                SUBB,   8, 
                Offset (0x1E), 
                    ,   13, 
                MABT,   1
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (SECB)
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

            Method (_RMV, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_DSM, 4, Serialized)
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }

                Return (Package (0x06)
                {
                    "AAPL,slot-name", 
                    Buffer (0x09)
                    {
                        "Internal"
                    }, 

                    "built-in", 
                    Buffer (One)
                    {
                         0x00
                    }, 

                    "PCI-Thunderbolt", 
                    One
                })
            }

            Device (DSB0)
            {
                Name (_ADR, Zero)
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
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

                Method (_RMV, 0, NotSerialized)
                {
                    Return (Zero)
                }

                Method (_DSM, 4, Serialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    Return (Package (0x06)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (One)
                        {
                             0x00
                        }, 

                        "PCIHotplugCapable", 
                        One
                    })
                }

                Device (NHI0)
                {
                    Name (_ADR, Zero)
                    Name (_STR, Unicode ("Thunderbolt"))
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }

                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32, 
                        BMIE,   3, 
                        Offset (0x18), 
                        PRIB,   8, 
                        SECB,   8, 
                        SUBB,   8, 
                        Offset (0x1E), 
                            ,   13, 
                        MABT,   1
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

                    Method (_DSM, 4, NotSerialized)
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03
                            })
                        }

                        Local0 = Package (0x0D)
                            {
                                "AAPL,slot-name", 
                                Buffer (0x0C)
                                {
                                    "Thunderbolt"
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                     0x00
                                }, 

                                "device_type", 
                                Buffer (0x0B)
                                {
                                    "PCI Bridge"
                                }, 

                                "model", 
                                Buffer (0x1D)
                                {
                                    "JHL6240 Thunderbolt 3 Bridge"
                                }, 

                                "name", 
                                Buffer (0x28)
                                {
                                    "JHL6240 Thunderbolt 3 Bridge Controller"
                                }, 

                                "power-save", 
                                One, 
                                Buffer (One)
                                {
                                     0x00
                                }
                            }
                        Method (DTGP, 5, NotSerialized)
                        {
                            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                            {
                                If ((Arg1 == One))
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Arg4 = Buffer (One)
                                            {
                                                 0x03
                                            }
                                        Return (One)
                                    }

                                    If ((Arg2 == One))
                                    {
                                        Return (One)
                                    }
                                }
                            }

                            Arg4 = Buffer (One)
                                {
                                     0x00
                                }
                            Return (Zero)
                        }

                        Return (Local0)
                    }

                    Return (Zero)
                }
            }

            Device (DSB1)
            {
                Name (_ADR, 0x00010000)
                Name (_SUN, 0x04)
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
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

                Method (_RMV, 0, NotSerialized)
                {
                    Return (Zero)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x69, 
                        0x03
                    })
                }

                Method (_DSM, 4, Serialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    Return (Package (0x04)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (One)
                        {
                             0x00
                        }
                    })
                }

                Device (UPS0)
                {
                    Name (_ADR, Zero)
                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                    Field (ARE0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   16
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
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

                    Device (DSB0)
                    {
                        Name (_ADR, Zero)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1, 
                            Offset (0x3E), 
                                ,   6, 
                            SBRS,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (DEV0)
                        {
                            Name (_ADR, Zero)
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

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (DSB3)
                    {
                        Name (_ADR, 0x00030000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
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

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1, 
                                    Offset (0x3E), 
                                        ,   6, 
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)
                                Name (_SUN, 0x04)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB4)
                    {
                        Name (_ADR, 0x00040000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
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

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1, 
                                    Offset (0x3E), 
                                        ,   6, 
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB5)
                    {
                        Name (_ADR, 0x00050000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (DSB6)
                    {
                        Name (_ADR, 0x00060000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (DSB2)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
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

                Method (_RMV, 0, NotSerialized)
                {
                    Return (Zero)
                }

                Method (_DSM, 4, Serialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    Return (Package (0x04)
                    {
                        "PCIHotplugCapable", 
                        One, 
                        "IOPCIHPType", 
                        0x02
                    })
                }

                Device (XHC3)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03
                            })
                        }

                        Local0 = Package (0x14)
                            {
                                "AAPL,slot-name", 
                                Buffer (0x09)
                                {
                                    "Internal"
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                     0x00
                                }, 

                                "device_type", 
                                Buffer (0x0F)
                                {
                                    "USB Controller"
                                }, 

                                "model", 
                                Buffer (0x21)
                                {
                                    "JHL6240 Thunderbolt 3 USB Type C"
                                }, 

                                "name", 
                                Buffer (0x25)
                                {
                                    "JHL6240 Thunderbolt 3 USB Controller"
                                }, 

                                "USBBusNumber", 
                                Zero, 
                                "UsbCompanionControllerPresent", 
                                One, 
                                "AAPL,XHCI-clock-id", 
                                One, 
                                "IOPCIExpressCapabilites", 
                                0x02, 
                                "IOPCIHPType", 
                                0x02
                            }
                        Method (DTGP, 5, NotSerialized)
                        {
                            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                            {
                                If ((Arg1 == One))
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Arg4 = Buffer (One)
                                            {
                                                 0x03
                                            }
                                        Return (One)
                                    }

                                    If ((Arg2 == One))
                                    {
                                        Return (One)
                                    }
                                }
                            }

                            Arg4 = Buffer (One)
                                {
                                     0x00
                                }
                            Return (Zero)
                        }

                        Return (Local0)
                    }

                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (Package (0x02)
                        {
                            0x69, 
                            0x03
                        })
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

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
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

                        Device (SSP1)
                        {
                            Name (_ADR, One)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                ToPLD (
                                    PLD_Revision           = 0x1,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "UNKNOWN",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x0,
                                    PLD_HorizontalOffset   = 0x0)

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

                            Method (_DSM, 4, NotSerialized)
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }

                                Return (Package (0x02)
                                {
                                    "UsbCPortNumber", 
                                    One
                                })
                            }
                        }

                        Device (HS03)
                        {
                            Name (_ADR, 0x03)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
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

                            Name (_PLD, Package (0x01)
                            {
                                ToPLD (
                                    PLD_Revision           = 0x1,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "UNKNOWN",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x0,
                                    PLD_HorizontalOffset   = 0x0)

                            })
                        }
                    }
                }
            }

            Device (DSB4)
            {
                Name (_ADR, 0x00040000)
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
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

                Method (_RMV, 0, NotSerialized)
                {
                    Return (Zero)
                }

                Method (_DSM, 4, Serialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    Return (Package (0x04)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (One)
                        {
                             0x00
                        }
                    })
                }

                Device (UPS0)
                {
                    Name (_ADR, Zero)
                    OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                    Field (ARE0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   16
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
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

                    Device (DSB0)
                    {
                        Name (_ADR, Zero)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1, 
                            Offset (0x3E), 
                                ,   6, 
                            SBRS,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (DEV0)
                        {
                            Name (_ADR, Zero)
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

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (DSB3)
                    {
                        Name (_ADR, 0x00030000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
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

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1, 
                                    Offset (0x3E), 
                                        ,   6, 
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB4)
                    {
                        Name (_ADR, 0x00040000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }

                        Device (UPS0)
                        {
                            Name (_ADR, Zero)
                            OperationRegion (ARE0, PCI_Config, Zero, 0x04)
                            Field (ARE0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   16
                            }

                            Method (_RMV, 0, NotSerialized)
                            {
                                Return (Zero)
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

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1, 
                                    Offset (0x3E), 
                                        ,   6, 
                                    SBRS,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB3)
                            {
                                Name (_ADR, 0x00030000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }

                                Device (DEV0)
                                {
                                    Name (_ADR, Zero)
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

                                    Method (_RMV, 0, NotSerialized)
                                    {
                                        Return (Zero)
                                    }
                                }
                            }

                            Device (DSB5)
                            {
                                Name (_ADR, 0x00050000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB6)
                            {
                                Name (_ADR, 0x00060000)
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)
                                {
                                    Return (SECB)
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

                                Method (_RMV, 0, NotSerialized)
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }

                    Device (DSB5)
                    {
                        Name (_ADR, 0x00050000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (DSB6)
                    {
                        Name (_ADR, 0x00060000)
                        OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                        Field (A1E0, ByteAcc, NoLock, Preserve)
                        {
                            AVND,   32, 
                            BMIE,   3, 
                            Offset (0x18), 
                            PRIB,   8, 
                            SECB,   8, 
                            SUBB,   8, 
                            Offset (0x1E), 
                                ,   13, 
                            MABT,   1
                        }

                        Method (_BBN, 0, NotSerialized)
                        {
                            Return (SECB)
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

                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }
            }
        }
    }
}

