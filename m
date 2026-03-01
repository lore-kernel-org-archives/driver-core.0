Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D33A1C9
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400089; cv=none; b=leXvkMxaC7lGIGc2QNzfDvcCxbf8lvnM1F/7CowOim4AKoE9q799BKzL3vf1RN7wHrWg4i3l1wu3uAVoylU3hR03LMtnTcQQiCV6TlG24P+IU19J4W0QmY1DIDyz1/jUHBa8Kejt5mGoptHLtl0cotF0vc5kjcfz2ndqZpNOIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400089; c=relaxed/simple;
	bh=EV+BLPm/vaXtaXK0GERYGxzeyc7rY3ScaftCvGcDdNg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P/NKDI9xsLGKFBccrN3FByh6a50/LI8ck1vXn3yVsh84SC1zrvpqgcNbhuEWYDH3ve0GB+x3SAUhaydPPPq1d3FAbAsWAP/xrsVq1O6Agmc9R5CW89FGpfDwKIvwXQgIDchtDGLzQwE3H1mNUSLDgILWpJCvCfQgdN9aXTScAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ghvo3eXQ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ghvo3eXQ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43993fea282so4113317f8f.0
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 13:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772400085; x=1773004885; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts2TpEAFh2kbnsGvosMQTQLnKMFpxW2RE1g7y6O85E8=;
        b=Ghvo3eXQgSHuNtjuw1RXm9RT1gdGRKlu0FL/f5TqJQCK2ipGX/2aUGCdH8HfFeDuEJ
         ifvF4ULEV8FqSMyyGu2s3m81SpisOGenx2K+H1oAGsYwVn++6vRIvLgV+3gl7k4+Cifj
         4FH52aUvKN/rW9cuUofp3rRWZGFjJ1nWpTouGVSY6RHPvX77ZUi/BoRRbjMbq49Y7DEt
         GJR/Wrllpeq1iq0IXICxWiaq7nbat7MoIuljuLIIgsHVvvGYwnd4UA4FVpnq71woPttg
         Gx/dqQZ+zqfpY7HL+TVTsyvo/qr41bJ+LT5im+Squ+1lp+0a1akAJDFxl6U6nn9O66p0
         XNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400085; x=1773004885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts2TpEAFh2kbnsGvosMQTQLnKMFpxW2RE1g7y6O85E8=;
        b=L/mYqFVstRdyDWQj32xV61bUrYsD+DqyQbly4FwiG9HpRrhONUXoC9OWOJyceJaa6f
         XQIvmryCuDXcKJoqLfQ9mnxYIvjKT3mH8hyy3kVKFOF55h4CMZah0IR03cPYDN1zoxIL
         tgXkd4ERTa69oDQPRWIBiA/l5+75Puj0oxKRPvy6gCREHEWfVHUzgw5MNAW0eol10jtX
         pnunXnP4QAYRTrkpn+LgukY3ggwIRgpg9oBpAv41iRVR7NUSe9WTNNyYB00IQUp//S9m
         xHEKxBUC9XVF0azC1/AYEgahJw3UGHc5/QvazR2Q9tRe1myBVrg285JkLqD3S8dTgq9b
         u+IA==
X-Forwarded-Encrypted: i=1; AJvYcCW9aFBk9ov7AcP2YRA3P/38Upzk91bvLa4l9MnKhNWYs41qIW21GlY+cCtNqOXUZbrIsWFmb+1n8/kidg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBIvo5KB/4kIhomeWuLFS5f6vJYX6ztsVDTbzx3XPk8zxI/VHY
	m5tL2pSD2992PhsFwK90NwO1qYLTqPIwhhtTx9z75neFF1bR7wOtSJzlfdNL4rNcSIQVaiufOuf
	O6VJ4XU3kJBtdoEhoEg==
X-Received: from wmju1.prod.google.com ([2002:a7b:cb01:0:b0:480:680f:94dd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b02:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-483c9c0ba4bmr187853855e9.16.1772400085356;
 Sun, 01 Mar 2026 13:21:25 -0800 (PST)
Date: Sun, 1 Mar 2026 21:21:24 +0000
In-Reply-To: <2026030138-cursor-tackiness-d58a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aaRH-aXYKntYyjRS@google.com> <2026030138-cursor-tackiness-d58a@gregkh>
Message-ID: <aaSt1FLIgHAsYY1e@google.com>
Subject: Re: [CRASH] kunit failures in platform-device-devm
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 01, 2026 at 03:17:53PM -0500, Greg Kroah-Hartman wrote:
> On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> > Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> > 
> > I've experienced a fair number of different crashes when running kunit
> > locally. I just ran this command on v7.0-rc1 or upstream/master:

So I saw that there was a driver-core fixes PR that just landed, which
was not included in my previous run. But I'm still getting crashes with
that included. Please see the crash below, which was taken on commit
eb71ab2bf722 with no additional changes.

> > ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y
> > 
> > Please find a sample crash below, but I've seen a fair number of
> > different crashes.
> > 
> 
> Odd, does this also crash on 6.19?

Nope.

I guess I'll start a bisect script and let you know tomorrow what it has
got to say.



Crash from commit eb71ab2bf722:

[16:45:05] ============ pm_runtime_test_cases (6 subtests) ============
[16:45:05] [PASSED] pm_runtime_depth_test
[16:45:05] [PASSED] pm_runtime_already_suspended_test
[16:45:05] [PASSED] pm_runtime_idle_test
[16:45:05] [PASSED] pm_runtime_disabled_test
[16:45:09] [ERROR] Test: pm_runtime_test_cases: missing expected subtest!
[16:45:09] ------------[ cut here ]------------
[16:45:09] refcount_t: addition on 0; use-after-free.
[16:45:09] WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x52/0xa0, CPU#0: kunit_try_catch/2462
[16:45:09] CPU: 0 UID: 0 PID: 2462 Comm: kunit_try_catch Tainted: G      D W        N  7.0.0-rc1-00375-geb71ab2bf722 #5 PREEMPT(lazy)
[16:45:09] Tainted: [D]=DIE, [W]=WARN, [N]=TEST
[16:45:09] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
[16:45:09] RIP: 0010:refcount_warn_saturate (??:?)
[16:45:09] Code: b9 3a e9 51 66 2d 00 cc 85 f6 74 3b 83 fe 01 75 48 48 8d 3d 60 ec 99 00 67 48 0f b9 3a c3 cc cc cc cc cc 48 8d 3d 5e ec 99 00 <67> 48 0f b9 3a c3 cc cc cc cc cc 48 8d 3d 5c ec 99 00 67 48 0f b9
[16:45:09] All code
[16:45:09] ========
[16:45:09]    0:	b9 3a e9 51 66       	mov    $0x6651e93a,%ecx
[16:45:09]    5:	2d 00 cc 85 f6       	sub    $0xf685cc00,%eax
[16:45:09]    a:	74 3b                	je     0x47
[16:45:09]    c:	83 fe 01             	cmp    $0x1,%esi
[16:45:09]    f:	75 48                	jne    0x59
[16:45:09]   11:	48 8d 3d 60 ec 99 00 	lea    0x99ec60(%rip),%rdi        # 0x99ec78
[16:45:09]   18:	67 48 0f b9 3a       	ud1    (%edx),%rdi
[16:45:09]   1d:	c3                   	ret
[16:45:09]   1e:	cc                   	int3
[16:45:09]   1f:	cc                   	int3
[16:45:09]   20:	cc                   	int3
[16:45:09]   21:	cc                   	int3
[16:45:09]   22:	cc                   	int3
[16:45:09]   23:	48 8d 3d 5e ec 99 00 	lea    0x99ec5e(%rip),%rdi        # 0x99ec88
[16:45:09]   2a:*	67 48 0f b9 3a       	ud1    (%edx),%rdi		<-- trapping instruction
[16:45:09]   2f:	c3                   	ret
[16:45:09]   30:	cc                   	int3
[16:45:09]   31:	cc                   	int3
[16:45:09]   32:	cc                   	int3
[16:45:09]   33:	cc                   	int3
[16:45:09]   34:	cc                   	int3
[16:45:09]   35:	48 8d 3d 5c ec 99 00 	lea    0x99ec5c(%rip),%rdi        # 0x99ec98
[16:45:09]   3c:	67                   	addr32
[16:45:09]   3d:	48                   	rex.W
[16:45:09]   3e:	0f                   	.byte 0xf
[16:45:09]   3f:	b9                   	.byte 0xb9
[16:45:09] 
[16:45:09] Code starting with the faulting instruction
[16:45:09] ===========================================
[16:45:09]    0:	67 48 0f b9 3a       	ud1    (%edx),%rdi
[16:45:09]    5:	c3                   	ret
[16:45:09]    6:	cc                   	int3
[16:45:09]    7:	cc                   	int3
[16:45:09]    8:	cc                   	int3
[16:45:09]    9:	cc                   	int3
[16:45:09]    a:	cc                   	int3
[16:45:09]    b:	48 8d 3d 5c ec 99 00 	lea    0x99ec5c(%rip),%rdi        # 0x99ec6e
[16:45:09]   12:	67                   	addr32
[16:45:09]   13:	48                   	rex.W
[16:45:09]   14:	0f                   	.byte 0xf
[16:45:09]   15:	b9                   	.byte 0xb9
[16:45:09] RSP: 0000:ffff94de400fbcc0 EFLAGS: 00010046
[16:45:09] RAX: 0000000000000000 RBX: ffff94de400fbd00 RCX: 0000000000000001
[16:45:09] RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffffffffaa556b10
[16:45:09] RBP: ffff8b5941a415a8 R08: ffffffffaa903b00 R09: ffffffffa9e5a7bf
[16:45:09] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
[16:45:09] R13: ffff8b5941a415c0 R14: 0000000000000000 R15: 0000000000000000
[16:45:09] FS:  0000000000000000(0000) GS:ffff8b59d4323000(0000) knlGS:0000000000000000
[16:45:09] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[16:45:09] CR2: 00007ffff7ffe000 CR3: 000000002dc2c000 CR4: 00000000000006f0
[16:45:09] Call Trace:
[16:45:09] <TASK>
[16:45:09] klist_next (??:?)
[16:45:09] ? __pfx___device_attach_driver (dd.c:?)
[16:45:09] bus_for_each_drv (??:?)
[16:45:09] __device_attach (dd.c:?)
[16:45:09] device_initial_probe (??:?)
[16:45:09] bus_probe_device (??:?)
[16:45:09] device_add (??:?)
[16:45:09] kunit_device_register_internal (device.c:?)
[16:45:09] kunit_device_register (??:?)
[16:45:09] pm_runtime_error_test (runtime-test.c:?)
[16:45:09] ? __pfx_read_tsc (tsc.c:?)
[16:45:09] ? ktime_get_ts64 (??:?)
[16:45:09] kunit_try_run_case (test.c:?)
[16:45:09] kunit_generic_run_threadfn_adapter (try-catch.c:?)
[16:45:09] ? __pfx_kunit_generic_run_threadfn_adapter (try-catch.c:?)
[16:45:09] kthread (kthread.c:?)
[16:45:09] ? __pfx_kthread (kthread.c:?)
[16:45:09] ret_from_fork (??:?)
[16:45:09] ? __pfx_kthread (kthread.c:?)
[16:45:09] ret_from_fork_asm (??:?)
[16:45:09] </TASK>
[16:45:09] ---[ end trace 0000000000000000 ]---
[16:45:09] BUG: kernel NULL pointer dereference, address: 0000000000000020
[16:45:09] #PF: supervisor read access in kernel mode
[16:45:09] #PF: error_code(0x0000) - not-present page
[16:45:09] PGD 0 P4D 0
[16:45:09] Oops: Oops: 0000 [#3] SMP PTI
[16:45:09] CPU: 0 UID: 0 PID: 2462 Comm: kunit_try_catch Tainted: G      D W        N  7.0.0-rc1-00375-geb71ab2bf722 #5 PREEMPT(lazy)
[16:45:09] Tainted: [D]=DIE, [W]=WARN, [N]=TEST
[16:45:09] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
[16:45:09] RIP: 0010:klist_iter_exit (??:?)
[16:45:09] Code: 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 41 57 41 56 41 54 53 4c 8b 77 08 4d 85 f6 74 46 48 89 fb 4d 8b 26 49 83 e4 fe <4d> 8b 7c 24 20 4c 89 e7 e8 a4 48 03 00 4c 89 f7 e8 2c 01 00 00 89
[16:45:09] All code
[16:45:09] ========
[16:45:09]    0:	90                   	nop
[16:45:09]    1:	90                   	nop
[16:45:09]    2:	90                   	nop
[16:45:09]    3:	90                   	nop
[16:45:09]    4:	90                   	nop
[16:45:09]    5:	90                   	nop
[16:45:09]    6:	90                   	nop
[16:45:09]    7:	90                   	nop
[16:45:09]    8:	90                   	nop
[16:45:09]    9:	90                   	nop
[16:45:09]    a:	90                   	nop
[16:45:09]    b:	f3 0f 1e fa          	endbr64
[16:45:09]    f:	55                   	push   %rbp
[16:45:09]   10:	41 57                	push   %r15
[16:45:09]   12:	41 56                	push   %r14
[16:45:09]   14:	41 54                	push   %r12
[16:45:09]   16:	53                   	push   %rbx
[16:45:09]   17:	4c 8b 77 08          	mov    0x8(%rdi),%r14
[16:45:09]   1b:	4d 85 f6             	test   %r14,%r14
[16:45:09]   1e:	74 46                	je     0x66
[16:45:09]   20:	48 89 fb             	mov    %rdi,%rbx
[16:45:09]   23:	4d 8b 26             	mov    (%r14),%r12
[16:45:09]   26:	49 83 e4 fe          	and    $0xfffffffffffffffe,%r12
[16:45:09]   2a:*	4d 8b 7c 24 20       	mov    0x20(%r12),%r15		<-- trapping instruction
[16:45:09]   2f:	4c 89 e7             	mov    %r12,%rdi
[16:45:09]   32:	e8 a4 48 03 00       	call   0x348db
[16:45:09]   37:	4c 89 f7             	mov    %r14,%rdi
[16:45:09]   3a:	e8 2c 01 00 00       	call   0x16b
[16:45:09]   3f:	89                   	.byte 0x89
[16:45:09] 
[16:45:09] Code starting with the faulting instruction
[16:45:09] ===========================================
[16:45:09]    0:	4d 8b 7c 24 20       	mov    0x20(%r12),%r15
[16:45:09]    5:	4c 89 e7             	mov    %r12,%rdi
[16:45:09]    8:	e8 a4 48 03 00       	call   0x348b1
[16:45:09]    d:	4c 89 f7             	mov    %r14,%rdi
[16:45:09]   10:	e8 2c 01 00 00       	call   0x141
[16:45:09]   15:	89                   	.byte 0x89
[16:45:09] RSP: 0000:ffff94de400fbcd0 EFLAGS: 00010246
[16:45:09] RAX: ffff8b5941a415a8 RBX: ffff94de400fbd00 RCX: 0000000000000001
[16:45:09] RDX: 0000000000000000 RSI: 0000000000000246 RDI: ffff94de400fbd00
[16:45:09] RBP: 0000000000000000 R08: ffffffffaa903b00 R09: ffffffffa9e5a7bf
[16:45:09] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[16:45:09] R13: ffff94de400fbd00 R14: ffff8b5941a415a8 R15: ffff8b5941892600
[16:45:09] FS:  0000000000000000(0000) GS:ffff8b59d4323000(0000) knlGS:0000000000000000
[16:45:09] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[16:45:09] CR2: 0000000000000020 CR3: 000000002dc2c000 CR4: 00000000000006f0
[16:45:09] Call Trace:
[16:45:09] <TASK>
[16:45:09] ? __pfx___device_attach_driver (dd.c:?)
[16:45:09] bus_for_each_drv (??:?)
[16:45:09] __device_attach (dd.c:?)
[16:45:09] device_initial_probe (??:?)
[16:45:09] bus_probe_device (??:?)
[16:45:09] device_add (??:?)
[16:45:09] kunit_device_register_internal (device.c:?)
[16:45:09] kunit_device_register (??:?)
[16:45:09] pm_runtime_error_test (runtime-test.c:?)
[16:45:09] ? __pfx_read_tsc (tsc.c:?)
[16:45:09] ? ktime_get_ts64 (??:?)
[16:45:09] kunit_try_run_case (test.c:?)
[16:45:09] kunit_generic_run_threadfn_adapter (try-catch.c:?)
[16:45:09] ? __pfx_kunit_generic_run_threadfn_adapter (try-catch.c:?)
[16:45:09] kthread (kthread.c:?)
[16:45:09] ? __pfx_kthread (kthread.c:?)
[16:45:09] ret_from_fork (??:?)
[16:45:09] ? __pfx_kthread (kthread.c:?)
[16:45:09] ret_from_fork_asm (??:?)
[16:45:09] </TASK>
[16:45:09] CR2: 0000000000000020
[16:45:09] ---[ end trace 0000000000000000 ]---
[16:45:09] RIP: 0010:kunit_test_null_dereference (kunit-test.c:?)
[16:45:09] Code: 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 83 ec 10 65 48 8b 05 60 93 d2 00 48 89 44 24 08 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 87 a0 01 00 00 9c da 24 aa
[16:45:09] All code
[16:45:09] ========
[16:45:09]    0:	00 00                	add    %al,(%rax)
[16:45:09]    2:	00 00                	add    %al,(%rax)
[16:45:09]    4:	00 90 90 90 90 90    	add    %dl,-0x6f6f6f70(%rax)
[16:45:09]    a:	90                   	nop
[16:45:09]    b:	90                   	nop
[16:45:09]    c:	90                   	nop
[16:45:09]    d:	90                   	nop
[16:45:09]    e:	90                   	nop
[16:45:09]    f:	90                   	nop
[16:45:09]   10:	90                   	nop
[16:45:09]   11:	90                   	nop
[16:45:09]   12:	90                   	nop
[16:45:09]   13:	90                   	nop
[16:45:09]   14:	90                   	nop
[16:45:09]   15:	f3 0f 1e fa          	endbr64
[16:45:09]   19:	48 83 ec 10          	sub    $0x10,%rsp
[16:45:09]   1d:	65 48 8b 05 60 93 d2 	mov    %gs:0xd29360(%rip),%rax        # 0xd29385
[16:45:09]   24:	00
[16:45:09]   25:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
[16:45:09]   2a:*	c7 04 25 00 00 00 00 	movl   $0x0,0x0		<-- trapping instruction
[16:45:09]   31:	00 00 00 00
[16:45:09]   35:	48 c7 87 a0 01 00 00 	movq   $0xffffffffaa24da9c,0x1a0(%rdi)
[16:45:09]   3c:	9c da 24 aa
[16:45:09] 
[16:45:09] Code starting with the faulting instruction
[16:45:09] ===========================================
[16:45:09]    0:	c7 04 25 00 00 00 00 	movl   $0x0,0x0
[16:45:09]    7:	00 00 00 00
[16:45:09]    b:	48 c7 87 a0 01 00 00 	movq   $0xffffffffaa24da9c,0x1a0(%rdi)
[16:45:09]   12:	9c da 24 aa
[16:45:09] RSP: 0000:ffff94de400ebed8 EFLAGS: 00010286
[16:45:09] RAX: e9aa2cfc638c3000 RBX: ffff8b594198b900 RCX: 0000000000000001
[16:45:09] RDX: ffff8b597ec25a40 RSI: 0000000000000286 RDI: ffff94de40013c28
[16:45:09] RBP: ffff94de400fbd50 R08: ffff8b5941983f00 R09: 0000000000000800
[16:45:09] R10: 0000000000000000 R11: ffffffffa9bc7cb0 R12: ffff8b5941983e80
[16:45:09] R13: ffff8b594198ba00 R14: ffff8b594198b900 R15: ffff8b5941a41540
[16:45:09] FS:  0000000000000000(0000) GS:ffff8b59d4323000(0000) knlGS:0000000000000000
[16:45:09] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[16:45:09] CR2: 0000000000000020 CR3: 000000002dc2c000 CR4: 00000000000006f0
[16:45:09] note: kunit_try_catch[2462] exited with irqs disabled
[16:45:09] # pm_runtime_error_test: try faulted: last line seen lib/kunit/resource.c:99
[16:45:09] # pm_runtime_error_test: internal error occurred preventing test case from running: -4
[16:45:09] qemu-system-x86_64: terminating on signal 15 from pid 2718253 (python3)
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: pm_runtime_test_cases: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: pm_runtime_test_cases: missing subtest result line!
[16:45:09] # module: runtime_test
[16:45:09] ============= [CRASHED] pm_runtime_test_cases ==============
[16:45:09] [ERROR] Test: main: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: main: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: main: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: main: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] [ERROR] Test: main: missing expected subtest!
[16:45:09] [CRASHED] 
[16:45:09] ============================================================
[16:45:09] Testing complete. Ran 1221 tests: passed: 1136, failed: 1, crashed: 7, skipped: 77, errors: 8
[16:45:09] Failures: kunit_platform_driver.kunit_platform_device_prepare_wait_for_probe_completes_when_already_probed, pm_runtime_test_cases., pm_runtime_test_cases., , , , , 
