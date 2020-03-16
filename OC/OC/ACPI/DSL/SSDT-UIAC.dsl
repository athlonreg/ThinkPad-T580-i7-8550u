/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20191213 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-UIAC.aml, Tue Feb 18 15:41:32 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000228 (552)
 *     Revision         0x02
 *     Checksum         0xDE
 *     OEM ID           "hack"
 *     OEM Table ID     "_UIAC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "UIAC", 0x00000000)
{
    Device (UIAC)
    {
        Name (_HID, "UIA00000")  // _HID: Hardware ID
        If (_OSI ("Darwin"))
        {
            Name (RMCF, Package (0x02)
            {
                "XHC", 
                Package (0x04)
                {
                    "port-count", 
                    Buffer (0x04)
                    {
                         0x10, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "ports", 
                    Package (0x16)
                    {
                        "SS02", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0E, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS01", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "USR2", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0C, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS08", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x08, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS03", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0F, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS02", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x02, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS09", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x09, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS04", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0x09, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x10, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS01", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0D, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "USR1", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0B, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS07", 
                        Package (0x04)
                        {
                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x07, 0x00, 0x00, 0x00                           // ....
                            }
                        }
                    }
                }
            })
        }
        
        Method (_STA, 0, NotSerialized)  // _STA: Status
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

