// ==++==
//
//   
//    Copyright (c) 2002 Microsoft Corporation.  All rights reserved.
//   
//    The use and distribution terms for this software are contained in the file
//    named license.txt, which can be found in the root of this distribution.
//    By using this software in any fashion, you are agreeing to be bound by the
//    terms of this license.
//   
//    You must not remove this notice, or any other, from this software.
//   
//
// ==--==
.class public bgt_un {
.field public static	int32 all
.field public static	int32 none
.field public static	int32 odd
.field public static	int32 even
.method public static	void initialize() {
.maxstack	10
	ldc.i4		0xFFFFFFFF
	stsfld	int32 bgt_un::all
	ldc.i4		0x00000000
	stsfld	int32 bgt_un::none
	ldc.i4		0x55555555
	stsfld	int32 bgt_un::odd
	ldc.i4		0xAAAAAAAA
	stsfld	int32 bgt_un::even
	ret
}
.method public static	int32 main(class [mscorlib]System.String[]) {
.entrypoint
.maxstack		10
	call	void bgt_un::initialize()
	ldsfld	int32 bgt_un::all
	ldsfld	int32 bgt_un::all
	bgt.un FAIL
	ldsfld	int32 bgt_un::all
	ldsfld	int32 bgt_un::none
	bgt.un A
	br FAIL
A:
	ldsfld	int32 bgt_un::all
	ldsfld	int32 bgt_un::odd
	bgt.un B
	br FAIL
B:
	ldsfld	int32 bgt_un::all
	ldsfld	int32 bgt_un::even
	bgt.un C
	br FAIL
	ldsfld	int32 bgt_un::none
	ldsfld	int32 bgt_un::all
	bgt.un FAIL
	ldsfld	int32 bgt_un::none
	ldsfld	int32 bgt_un::none
	bgt.un FAIL
	ldsfld	int32 bgt_un::none
	ldsfld	int32 bgt_un::odd
	bgt.un FAIL
	ldsfld	int32 bgt_un::none
	ldsfld	int32 bgt_un::even
	bgt.un FAIL
	ldsfld	int32 bgt_un::odd
	ldsfld	int32 bgt_un::all
	bgt.un FAIL
	ldsfld	int32 bgt_un::odd
	ldsfld	int32 bgt_un::none
	bgt.un C
	br FAIL
C:
	ldsfld	int32 bgt_un::odd
	ldsfld	int32 bgt_un::odd
	bgt.un FAIL
	ldsfld	int32 bgt_un::odd
	ldsfld	int32 bgt_un::even
	bgt.un FAIL
	ldsfld	int32 bgt_un::even
	ldsfld	int32 bgt_un::all
	bgt.un FAIL
	ldsfld	int32 bgt_un::even
	ldsfld	int32 bgt_un::none
	bgt.un D
	br FAIL
D:
	ldsfld	int32 bgt_un::even
	ldsfld	int32 bgt_un::odd
	bgt.un E
	br FAIL
E:
	ldsfld	int32 bgt_un::even
	ldsfld	int32 bgt_un::even
	bgt.un FAIL
	br BACKCHECK
TOPASS:
	br PASS
BACKCHECK:
	ldc.i4 0x1
	ldc.i4 0x0
	bgt.un TOPASS
	br FAIL
PASS:
	ldc.i4	0x0000
	ret
FAIL:
	ldc.i4	0x0001
	ret
}
}
.assembly bgt_u4.exe{}
