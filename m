Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5D2DF6F4
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772374013; cv=none; b=bKO1Mef35cbkum47qNpf+sFkEuVczuATE3qI125Y7JRs6XuTs+WYcAiJXe3ShkCw5uMNHHrF3nraYNMY9CQbk1rx2OsBwE+ooMDaLRYqwvsZHvo9PYXi8Z2eStf6SS9804kOc9UPBsSFh6lZcp2b/tuuEI6LoxgRBc5qEBskJw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772374013; c=relaxed/simple;
	bh=eODL2T561jUITJTwmdkeB4uMGWWVCuPKEbh3Ce8a8HA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=LOjV1It1530W2XMPv1Wkg4xDV0Z2I6yPqFI/RR0TNksL3MYHiMNFu5COEjlHqRF7Ecb74iZkJcH3tzT5rPDQPKIQKAF4tGoFKFprzPVD10Fhkm10ClQ/R5JZkcKq9SxPa3pmwGCBpwegZ18GDjmmW04U5gm9+z3jqSKtzD41VK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZDx9YG/x; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZDx9YG/x"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439af95a718so670990f8f.2
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772374010; x=1772978810; darn=lists.linux.dev;
        h=content-transfer-encoding:to:from:subject:message-id:mime-version
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz/p8ZQVHFNNpoAhRA2ujRtmS/MjCEYuYYkqs+Dpzsk=;
        b=ZDx9YG/xlyOcIaS3CncWptAeFy/ZwrLFFVCwoufVIx3Lo4Sw+D4TtDWrz9Wx7cOW8G
         E2/vtgXubympN+VfW4IQcDyoBvYQVFErbOLSAQn0WkOwDXagKgyK5bkVeJCLPESHGJP/
         sDi0N1uA9dZ98JDy0h4DVaRMnd5ciYZlaWQcPshhmX4Lm+mRLR6djoGRy9m7mbG26REK
         PQA6BCtel+PRGz8Q8QRqvG7dC4r7SnZ2RAs158Ln3fbyVeRKt48SAu+7dMtR5X7WboW/
         0GrClCyKcKMOoBgnkwCIb6dbLt4Ss7RTKkgG7nGhxS1LfjoLDlmdDj8HCA/fZ45BFFGv
         nwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374010; x=1772978810;
        h=content-transfer-encoding:to:from:subject:message-id:mime-version
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz/p8ZQVHFNNpoAhRA2ujRtmS/MjCEYuYYkqs+Dpzsk=;
        b=NzA4tVzzmiFj9E6K8h/UWf5/2R4nMFkdIcQwoU8f88fWFEu8zbeADTgDrC9/oaYwMa
         HFMca6HMb5fc1uf6nGUdBGxSxW//DRgyqQ9u9TydG6ENv2IYVBy7wk56zs7ZAPCZIqZH
         7djb40EEbWDq+eCBFVou46Ly1DIzRLjfmSMZEjdIzpxQaaSAmyRm4I9Q9w0Dq+6wlBT4
         WYltl1/kDbQAl79u8c1xjFsQAWd/T1+jKzihNC9RQ7gQOQJWQu1Ki7ZMO9vBRp3kWGvM
         v/reScQp6aa34Nv9DhL3EI1/g7t8dPNXXOD149CqiHTWbPuHaGsgan6VwqaI5xoOMJih
         xN8w==
X-Forwarded-Encrypted: i=1; AJvYcCUl+6qV+w02V2ie/himJza3sNEN6r8UACko04ajT3J1epimSGjlswRjAneAFYiiXhLOu14lfCVInDDKPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrCv/N9LqtpdoaDGZi97pQmldtbAgj4e23mqu3LPlqJu0IQW2k
	mind2gWB36KBYc2d+xtyRhafelZln/X9Bf+9wxQOqPG6Pciy/rId5r24imk/jmg8v5+vgrtslsj
	N2x2x2nlpCJ+jyQWpbw==
X-Received: from wrbeq10.prod.google.com ([2002:a05:6000:430a:b0:437:7221:67ed])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f48:0:b0:439:af96:29f0 with SMTP id ffacd0b85a97d-439af962b81mr4917884f8f.42.1772374010096;
 Sun, 01 Mar 2026 06:06:50 -0800 (PST)
Date: Sun, 1 Mar 2026 14:06:49 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <aaRH-aXYKntYyjRS@google.com>
Subject: [CRASH] kunit failures in platform-device-devm
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,

I've experienced a fair number of different crashes when running kunit
locally. I just ran this command on v7.0-rc1 or upstream/master:

./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86_64 --=
kconfig_add CONFIG_RUST=3Dy --kconfig_add CONFIG_PCI=3Dy

Please find a sample crash below, but I've seen a fair number of
different crashes.

[13:19:32] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D platform-device-devm (4 sub=
tests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[13:19:32] Oops: general protection fault, probably for non-canonical addre=
ss 0xb4c3c33fcc9f57f6: 0000 [#3] SMP PTI
[13:19:32] CPU: 0 UID: 0 PID: 2500 Comm: kunit_try_catch Tainted: G      D =
W        N  7.0.0-rc1-00138-g0c21570fbd3d-dirty #3 PREEMPT(lazy)
[13:19:32] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[13:19:32] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[13:19:32] RIP: 0010:queued_spin_lock_slowpath+0x120/0x1c0
[13:19:32] Code: c8 c1 e8 10 66 87 47 02 66 85 c0 74 40 0f b7 c0 89 c6 83 e=
6 03 c1 e6 04 83 e0 fc 49 c7 c0 f8 ff ff ff 49 8b 84 40 80 89 e4 8b <48> 89=
 94 06 c0 fd 44 8c 83 7a 08 00 75 08 f3 90 83 7a 08 00 74 f8
[13:19:32] RSP: 0000:ffffb222800e3cb0 EFLAGS: 00010206
[13:19:32] RAX: b4c3c340405a5a26 RBX: ffffb222800e3ce8 RCX: 000000000005000=
0
[13:19:32] RDX: ffffa0a4fec1ddd0 RSI: 0000000000000010 RDI: ffffa0a4c2b4334=
0
[13:19:32] RBP: 0000000000000000 R08: fffffffffffffff8 R09: ffffffff8bbbd99=
f
[13:19:32] R10: 0000000000000000 R11: ffffffff8bb32010 R12: ffffa0a4c2b4334=
0
[13:19:32] R13: ffffb222800e3ce8 R14: ffffa0a4c122bde8 R15: 39206b6f2020202=
0
[13:19:32] FS:  0000000000000000(0000) GS:ffffa0a5727ce000(0000) knlGS:0000=
000000000000
[13:19:32] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[13:19:32] CR2: 00007ffff7ffe000 CR3: 000000000922c000 CR4: 00000000000006f=
0
[13:19:32] Call Trace:
[13:19:32]  <TASK>
[13:19:32]  klist_iter_exit+0x2c/0x70
[13:19:32]  ? __pfx___device_attach_driver+0x10/0x10
[13:19:32]  bus_for_each_drv+0x12a/0x160
[13:19:32]  __device_attach+0xbf/0x160
[13:19:32]  device_initial_probe+0x2f/0x50
[13:19:32]  bus_probe_device+0x8f/0x110
[13:19:32]  device_add+0x23f/0x3d0
[13:19:32]  platform_device_add+0x137/0x1d0
[13:19:32]  platform_device_devm_register_unregister_test+0x6c/0x2e0
[13:19:32]  ? kunit_add_action_or_reset+0x12/0x30
[13:19:32]  ? kunit_kmalloc_array+0x34/0x60
[13:19:32]  kunit_try_run_case+0x8f/0x190
[13:19:32]  kunit_generic_run_threadfn_adapter+0x1d/0x40
[13:19:32]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[13:19:32]  kthread+0x142/0x160
[13:19:32]  ? __pfx_kthread+0x10/0x10
[13:19:32]  ret_from_fork+0xc7/0x1f0
[13:19:32]  ? __pfx_kthread+0x10/0x10
[13:19:32]  ret_from_fork_asm+0x1a/0x30
[13:19:32]  </TASK>
[13:19:32] ---[ end trace 0000000000000000 ]---
[13:19:32] RIP: 0010:kunit_test_null_dereference+0x15/0x80
[13:19:32] Code: 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 f3 0f 1e fa 48 83 ec 10 65 48 8b 05 c0 19 b1 00 48 89 44 24 08 <c7> 04=
 25 00 00 00 00 00 00 00 00 48 c7 87 a0 01 00 00 b8 2b e1 8b
[13:19:32] RSP: 0000:ffffb222800f3ed8 EFLAGS: 00010286
[13:19:32] RAX: 544a2a581abcdc00 RBX: ffffa0a4c1a9d4c0 RCX: 000000000000000=
1
[13:19:32] RDX: ffffa0a4fec1d1c0 RSI: 0000000000000282 RDI: ffffb22280013c2=
8
[13:19:32] RBP: ffffa0a4c122bd80 R08: ffffa0a4c1260cc0 R09: 000000000000080=
0
[13:19:32] R10: 0000000000000000 R11: ffffffff8b934650 R12: ffffa0a4c12612e=
c
[13:19:32] R13: ffffa0a4c122bda8 R14: ffffa0a4c1a9d4c0 R15: ffffa0a4c1260c4=
0
[13:19:32] FS:  0000000000000000(0000) GS:ffffa0a5727ce000(0000) knlGS:0000=
000000000000
[13:19:32] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[13:19:32] CR2: 00007ffff7ffe000 CR3: 000000000922c000 CR4: 00000000000006f=
0
[13:19:32] note: kunit_try_catch[2500] exited with preempt_count 1
[13:19:32]     # platform_device_devm_register_unregister_test: try faulted=
: last line seen drivers/base/test/platform-device-test.c:65
[13:19:32]     # platform_device_devm_register_unregister_test: internal er=
ror occurred preventing test case from running: -4
[13:19:32] [FAILED] platform_device_devm_register_unregister_test
Command '['qemu-system-x86_64', '-nodefaults', '-m', '1024', '-kernel', '.k=
unit/arch/x86/boot/bzImage', '-append', 'kunit.enable=3D1 console=3DttyS0 k=
unit_shutdown=3Dreboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-acc=
el', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-bios', 'qboo
t.rom']' timed out after 300 seconds
[13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
[13:23:30] sysfs: cannot create duplicate filename '/devices/platform/test'
[13:23:30] CPU: 0 UID: 0 PID: 2502 Comm: kunit_try_catch Tainted: G      D =
W        N  7.0.0-rc1-00138-g0c21570fbd3d-dirty #3 PREEMPT(lazy)
[13:23:30] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[13:23:30] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[13:23:30] Call Trace:
[13:23:30]  <TASK>
[13:23:30]  dump_stack_lvl+0x2d/0x70
[13:23:30]  sysfs_create_dir_ns+0xe8/0x130
[13:23:30]  kobject_add_internal+0x1dd/0x360
[13:23:30]  kobject_add+0x88/0xf0
[13:23:30]  device_add+0x171/0x3d0
[13:23:30]  platform_device_add+0x137/0x1d0
[13:23:30]  platform_device_devm_register_get_unregister_with_devm_test+0x6=
c/0x2f0
[13:23:30]  ? kunit_add_action_or_reset+0x12/0x30
[13:23:30]  ? kunit_kmalloc_array+0x34/0x60
[13:23:30]  kunit_try_run_case+0x8f/0x190
[13:23:30]  kunit_generic_run_threadfn_adapter+0x1d/0x40
[13:23:30]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[13:23:30]  kthread+0x142/0x160
[13:23:30]  ? __pfx_kthread+0x10/0x10
[13:23:30]  ret_from_fork+0xc7/0x1f0
[13:23:30]  ? __pfx_kthread+0x10/0x10
[13:23:30]  ret_from_fork_asm+0x1a/0x30
[13:23:30]  </TASK>
[13:23:30] kobject: kobject_add_internal failed for test with -EEXIST, don'=
t try to register things with the same name in the same directory.
[13:23:30]     # platform_device_devm_register_get_unregister_with_devm_tes=
t: ASSERTION FAILED at drivers/base/test/platform-device-test.c:97
[13:23:30]     Expected ret =3D=3D 0, but
[13:23:30]         ret =3D=3D -17 (0xffffffffffffffef)
[13:23:30] qemu-system-x86_64: terminating on signal 15 from pid 2622478 (p=
ython3)
[13:23:30] [CRASHED]
[13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
[13:23:30] [CRASHED]
[13:23:30] [ERROR] Test: platform-device-devm: missing expected subtest!
[13:23:30] [CRASHED]
[13:23:30] [ERROR] Test: platform-device-devm: missing subtest result line!
[13:23:30] # module: platform_device_test
[13:23:30] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [CRASHED] platform-de=
vice-devm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[13:23:30] [ERROR] Test: main: missing expected subtest!
[13:23:30] [CRASHED]
[13:23:30] [ERROR] Test: main: missing expected subtest!
[13:23:30] [CRASHED]
[13:23:30] [ERROR] Test: main: missing expected subtest!
[13:23:30] [CRASHED]
[13:23:30] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[13:23:30] Testing complete. Ran 1239 tests: passed: 1154, failed: 2, crash=
ed: 6, skipped: 77, errors: 7
[13:23:30] Failures: kunit_platform_driver.kunit_platform_device_prepare_wa=
it_for_probe_completes_when_already_probed, platform-device-devm, , ,
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | te=
e .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
[13:23:30] Elapsed time: 367.085s total, 0.002s configuring, 67.017s buildi=
ng, 300.065s running

Alice
