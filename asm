.586
.MODEL FLAT
.STACK 4096
.DATA
	cmpvalue DWORD 0FFFFFF38h
.CODE
_MainProc PROC
		CodeBegin:
			mov eax, 00000004Fh
			cmp eax, cmpvalue
			jl jmpaddress
			cmp eax, cmpvalue
			;jb jmpaddress
			cmp eax, 04Fh
			;je jmpaddress
			cmp eax, 79
			;jne jmpaddress
			cmp cmpvalue, 0
			;jbe jmpaddress
			cmp cmpvalue, -200
			;jge jmpaddress
			add eax, 200
			js jmpaddress
			add cmpvalue, 200
			jz jmpaddress
	jmpaddress:
			mov		eax, 0
			ret
_MainProc ENDP
END                             ; end of source code
