/* Copyright (C) 1992-2000 the Florida State University
   Distributed by the Florida State University under the terms of the
   GNU Library General Public License.

This file is part of Pthreads.

Pthreads is free software; you can redistribute it and/or
modify it under the terms of the GNU Library General Public
License as published by the Free Software Foundation (version 2).

Pthreads is distributed "AS IS" in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Library General Public License for more details.

You should have received a copy of the GNU Library General Public
License along with Pthreads; see the file COPYING.  If not, write
to the Free Software Foundation, 675 Mass Ave, Cambridge,
MA 02139, USA.

Report problems and direct all questions to:

  pthreads-bugs@ada.cs.fsu.edu

  @(#)sigsuspend.S	3.14 11/8/00

*/

#include <sys/syscall.h>

NAME(ierr):
	neg	%eax
	jmp	NAME(pthread_cerror)

	.global	NAME(pthread_sigsuspend)
NAME(pthread_sigsuspend):
	push	%ebp
	mov	%esp, %ebp
	push	%edi
	push	%esi
	push	%ebx
	mov	8(%ebp), %edx
	mov	(%edx), %edx
	movl	$ SYS_sigsuspend, %eax
	int	$ 0x80
	pop	%ebx
	pop	%esi
	pop	%edi
	mov	%ebp, %esp
	pop	%ebp
	testl	%eax, %eax
        jl      NAME(ierr)
	ret
