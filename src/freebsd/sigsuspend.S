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

#include <SYS.h>

ierr:
	jmp	_pthread_cerror

	.globl  _pthread_sigsuspend
_pthread_sigsuspend:
	movl	4(%esp),%eax		# fetch mask arg
	movl	(%eax),%eax		# indirect to mask arg
	movl	%eax,4(%esp)
	movl	$ SYS_sigsuspend ,%eax
	LCALL(0x7,0)
	jb	ierr
	xorl	%eax,%eax		# shouldn t happen
	ret
