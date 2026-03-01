Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E3236437;
	Sun,  1 Mar 2026 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772396285; cv=none; b=DEktMJ2OwXIRr25PRTHDtFR7xoAATtCkM4B4ZA7W9D7jzwMUvMPUcNzwHfdOk9h4uKm0SdgrCwtrUEtUL01hgXcFh1RXsRINYmc/a9BTa4eEaSdWGv3SS757rVbSDoJFELa7NK+lTBv5aQRcTijJSz55dR+FO1dVGdJULS07eTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772396285; c=relaxed/simple;
	bh=NVT1pDFIScrAn3tqPArwX9D1vYQmhrA4FIUq3zvBynk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uop4JnSfuN+TUEWhXp9R2womhEYrDIrJlBl87coyoyPn5/tPaZBihfcJ5W3scEcVFVWrNdHyKxv+rvI9iUWWIIRTPH/qUnzMGCsB4wiIPPKQcDII4q8Az6WMA8Lx1MlCsFh3AXzi7HMAQsW4hWs6ZLWxyBlOd2cTivbXta0ez4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eLZz2kE5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eLZz2kE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4641FC116C6;
	Sun,  1 Mar 2026 20:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772396284;
	bh=NVT1pDFIScrAn3tqPArwX9D1vYQmhrA4FIUq3zvBynk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLZz2kE5k303lAc/BZcgf/dbVUErNYE3utb18tP8EaPvmHU6kaMHBqf70crJf/ZUW
	 zYCJ99fhDoGj7vVl7zpgwaV14yBWQcbzgRCOpZwP8N6pdcHztUUz6jJPFWEpQ2XoVZ
	 vP3KTPWZDuQ+g0TA12oDsPGnWjgQhAAoo27M+/Ts=
Date: Sun, 1 Mar 2026 15:17:53 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [CRASH] kunit failures in platform-device-devm
Message-ID: <2026030138-cursor-tackiness-d58a@gregkh>
References: <aaRH-aXYKntYyjRS@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaRH-aXYKntYyjRS@google.com>

On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> 
> I've experienced a fair number of different crashes when running kunit
> locally. I just ran this command on v7.0-rc1 or upstream/master:
> 
> ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y
> 
> Please find a sample crash below, but I've seen a fair number of
> different crashes.
> 
> [13:19:32] ============ platform-device-devm (4 subtests) =============
> [13:19:32] Oops: general protection fault, probably for non-canonical address 0xb4c3c33fcc9f57f6: 0000 [#3] SMP PTI
> [13:19:32] CPU: 0 UID: 0 PID: 2500 Comm: kunit_try_catch Tainted: G      D W        N  7.0.0-rc1-00138-g0c21570fbd3d-dirty #3 PREEMPT(lazy)
> [13:19:32] Tainted: [D]=DIE, [W]=WARN, [N]=TEST
> [13:19:32] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
> [13:19:32] RIP: 0010:queued_spin_lock_slowpath+0x120/0x1c0
> [13:19:32] Code: c8 c1 e8 10 66 87 47 02 66 85 c0 74 40 0f b7 c0 89 c6 83 e6 03 c1 e6 04 83 e0 fc 49 c7 c0 f8 ff ff ff 49 8b 84 40 80 89 e4 8b <48> 89 94 06 c0 fd 44 8c 83 7a 08 00 75 08 f3 90 83 7a 08 00 74 f8
> [13:19:32] RSP: 0000:ffffb222800e3cb0 EFLAGS: 00010206
> [13:19:32] RAX: b4c3c340405a5a26 RBX: ffffb222800e3ce8 RCX: 0000000000050000
> [13:19:32] RDX: ffffa0a4fec1ddd0 RSI: 0000000000000010 RDI: ffffa0a4c2b43340
> [13:19:32] RBP: 0000000000000000 R08: fffffffffffffff8 R09: ffffffff8bbbd99f
> [13:19:32] R10: 0000000000000000 R11: ffffffff8bb32010 R12: ffffa0a4c2b43340
> [13:19:32] R13: ffffb222800e3ce8 R14: ffffa0a4c122bde8 R15: 39206b6f20202020
> [13:19:32] FS:  0000000000000000(0000) GS:ffffa0a5727ce000(0000) knlGS:0000000000000000
> [13:19:32] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [13:19:32] CR2: 00007ffff7ffe000 CR3: 000000000922c000 CR4: 00000000000006f0
> [13:19:32] Call Trace:
> [13:19:32]  <TASK>
> [13:19:32]  klist_iter_exit+0x2c/0x70
> [13:19:32]  ? __pfx___device_attach_driver+0x10/0x10
> [13:19:32]  bus_for_each_drv+0x12a/0x160
> [13:19:32]  __device_attach+0xbf/0x160
> [13:19:32]  device_initial_probe+0x2f/0x50
> [13:19:32]  bus_probe_device+0x8f/0x110
> [13:19:32]  device_add+0x23f/0x3d0
> [13:19:32]  platform_device_add+0x137/0x1d0
> [13:19:32]  platform_device_devm_register_unregister_test+0x6c/0x2e0
> [13:19:32]  ? kunit_add_action_or_reset+0x12/0x30
> [13:19:32]  ? kunit_kmalloc_array+0x34/0x60
> [13:19:32]  kunit_try_run_case+0x8f/0x190
> [13:19:32]  kunit_generic_run_threadfn_adapter+0x1d/0x40
> [13:19:32]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [13:19:32]  kthread+0x142/0x160
> [13:19:32]  ? __pfx_kthread+0x10/0x10
> [13:19:32]  ret_from_fork+0xc7/0x1f0
> [13:19:32]  ? __pfx_kthread+0x10/0x10
> [13:19:32]  ret_from_fork_asm+0x1a/0x30
> [13:19:32]  </TASK>
> [13:19:32] ---[ end trace 0000000000000000 ]---
> [13:19:32] RIP: 0010:kunit_test_null_dereference+0x15/0x80
> [13:19:32] Code: 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 83 ec 10 65 48 8b 05 c0 19 b1 00 48 89 44 24 08 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 87 a0 01 00 00 b8 2b e1 8b
> [13:19:32] RSP: 0000:ffffb222800f3ed8 EFLAGS: 00010286
> [13:19:32] RAX: 544a2a581abcdc00 RBX: ffffa0a4c1a9d4c0 RCX: 0000000000000001
> [13:19:32] RDX: ffffa0a4fec1d1c0 RSI: 0000000000000282 RDI: ffffb22280013c28
> [13:19:32] RBP: ffffa0a4c122bd80 R08: ffffa0a4c1260cc0 R09: 0000000000000800
> [13:19:32] R10: 0000000000000000 R11: ffffffff8b934650 R12: ffffa0a4c12612ec
> [13:19:32] R13: ffffa0a4c122bda8 R14: ffffa0a4c1a9d4c0 R15: ffffa0a4c1260c40
> [13:19:32] FS:  0000000000000000(0000) GS:ffffa0a5727ce000(0000) knlGS:0000000000000000
> [13:19:32] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [13:19:32] CR2: 00007ffff7ffe000 CR3: 000000000922c000 CR4: 00000000000006f0
> [13:19:32] note: kunit_try_catch[2500] exited with preempt_count 1
> [13:19:32]     # platform_device_devm_register_unregister_test: try faulted: last line seen drivers/base/test/platform-device-test.c:65
> [13:19:32]     # platform_device_devm_register_unregister_test: internal error occurred preventing test case from running: -4
> [13:19:32] [FAILED] platform_device_devm_register_unregister_test
> Command '['qemu-system-x86_64', '-nodefaults', '-m', '1024', '-kernel', '.kunit/arch/x86/boot/bzImage', '-append', 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-bios', 'qboo
> t.rom']' timed out after 300 seconds
> [13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
> [13:23:30] sysfs: cannot create duplicate filename '/devices/platform/test'
> [13:23:30] CPU: 0 UID: 0 PID: 2502 Comm: kunit_try_catch Tainted: G      D W        N  7.0.0-rc1-00138-g0c21570fbd3d-dirty #3 PREEMPT(lazy)
> [13:23:30] Tainted: [D]=DIE, [W]=WARN, [N]=TEST
> [13:23:30] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
> [13:23:30] Call Trace:
> [13:23:30]  <TASK>
> [13:23:30]  dump_stack_lvl+0x2d/0x70
> [13:23:30]  sysfs_create_dir_ns+0xe8/0x130
> [13:23:30]  kobject_add_internal+0x1dd/0x360
> [13:23:30]  kobject_add+0x88/0xf0
> [13:23:30]  device_add+0x171/0x3d0
> [13:23:30]  platform_device_add+0x137/0x1d0
> [13:23:30]  platform_device_devm_register_get_unregister_with_devm_test+0x6c/0x2f0
> [13:23:30]  ? kunit_add_action_or_reset+0x12/0x30
> [13:23:30]  ? kunit_kmalloc_array+0x34/0x60
> [13:23:30]  kunit_try_run_case+0x8f/0x190
> [13:23:30]  kunit_generic_run_threadfn_adapter+0x1d/0x40
> [13:23:30]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [13:23:30]  kthread+0x142/0x160
> [13:23:30]  ? __pfx_kthread+0x10/0x10
> [13:23:30]  ret_from_fork+0xc7/0x1f0
> [13:23:30]  ? __pfx_kthread+0x10/0x10
> [13:23:30]  ret_from_fork_asm+0x1a/0x30
> [13:23:30]  </TASK>
> [13:23:30] kobject: kobject_add_internal failed for test with -EEXIST, don't try to register things with the same name in the same directory.
> [13:23:30]     # platform_device_devm_register_get_unregister_with_devm_test: ASSERTION FAILED at drivers/base/test/platform-device-test.c:97
> [13:23:30]     Expected ret == 0, but
> [13:23:30]         ret == -17 (0xffffffffffffffef)
> [13:23:30] qemu-system-x86_64: terminating on signal 15 from pid 2622478 (python3)
> [13:23:30] [CRASHED]
> [13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
> [13:23:30] [CRASHED]
> [13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
> [13:23:30] [CRASHED]
> [13:23:30] [ERROR] Test: platform-device-devm: missing subtest result line!
> [13:23:30] # module: platform_device_test
> [13:23:30] ============== [CRASHED] platform-device-devm ==============
> [13:23:30] [ERROR] Test: main: missing expected subtest!
> [13:23:30] [CRASHED]
> [13:23:30] [ERROR] Test: main: missing expected subtest!
> [13:23:30] [CRASHED]
> [13:23:30] [ERROR] Test: main: missing expected subtest!
> [13:23:30] [CRASHED]
> [13:23:30] ============================================================
> [13:23:30] Testing complete. Ran 1239 tests: passed: 1154, failed: 2, crashed: 6, skipped: 77, errors: 7
> [13:23:30] Failures: kunit_platform_driver.kunit_platform_device_prepare_wait_for_probe_completes_when_already_probed, platform-device-devm, , ,
> The kernel seems to have crashed; you can decode the stack traces with:
> $ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
> [13:23:30] Elapsed time: 367.085s total, 0.002s configuring, 67.017s building, 300.065s running
> 

Odd, does this also crash on 6.19?
