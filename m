Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AE40758B
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466751; cv=none; b=Ed0iDCsWUGWjk43b7Omzs7Ck5Abz/QYT4T27XZMIqLatyJguHorxuo8lZCcKOUcn65P2TgedBXHDeoo6BEiZiiTUWDw+CUc/c7MMRZzl4ZR4NTRKbhnADdQGW64u3Dh4U/iLpd4lAc/h2hMzT38LPQISQkS6MYeiAXCxnBSNiwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466751; c=relaxed/simple;
	bh=pL2jImcouo7gglIBYrZN9k2rq3N1G72S2nTv7HLuMEA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=a+A8Z0OxoL89W8b2veIsj+UIUfW83NAbA3wAstZPsVfi98+Lxg3U7xm1TYxuyHx8LKqyA4mFuPBPd9Gmowtd7oIvkk2VeqH0+jsEhHNzst89uD7IDUcjpyQwqbsnFqsJr06iZGTOaGoEag8lCLz0hkDI2Spt04ZYgAiZjalXL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcC+rc5B; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcC+rc5B"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439b8bc43aeso656958f8f.1
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772466748; x=1773071548; darn=lists.linux.dev;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/2v1ju6tzMFuna8jc1W5tN1Oa+9V78aD6+MiwPWO8w=;
        b=zcC+rc5BjHvRCML+zo29hAob1F9VuKKBEGWPXbVkP+P2JAN9bxkMGY3DSM2PcghMPj
         3SCRmFTxI0aE+aA4tbhh8JklFB7WAslKcWCSsexWAzPyBh5qL9+Y5u6yiirujWfoeqHO
         X5zOho07cwHilxpAq9s1q3J3WJ+g3TfqwKBC3ZK27i8NYySFEjvwjxxZR5zwe95GV+wJ
         /OXW5yK/IRkXqptxQpwQ7AUHLzSw9ebdr84RdxLA01niPHJPwlyr8JVMgBrw/xMdgYvq
         Th6pt3yJUaDSpRqwcOEEtwPTdqyZ4NOhHoTASPg6XsT82NgZDqX9ESuoz6KVCKezyU6I
         /lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466748; x=1773071548;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/2v1ju6tzMFuna8jc1W5tN1Oa+9V78aD6+MiwPWO8w=;
        b=cazgMo1/AZwRxtVjpMNp4QNOGyY3UIPivcoGFXNs3tAc/Aqn0Tc8SzeIHcI6EbIOxG
         k5ECMolpC+sqiRzc3GB7lkwI6AtifBJanEutzQo1BZ2oJ+2U8/Db0+tO9Be6Hbl3Xum/
         4C7qo++qFVXUSSVVT0vxk/+81EpWCMhMaXI7ogvfAJuIgFhXajVQTONaYd/YOWL/CQTW
         YWhDHBvt3KI/wPz6o06R4tJe+wq+9PBmPwbrLqSjp0R8uSmoKED6bxk9zpGTnakT0UYa
         JMRIhmYxLEEeoD3Cdpm7wenkdMpjd2Lyn/z8ewdlfWv76CtNjX01moroNnwKIKhYT8zh
         n87w==
X-Forwarded-Encrypted: i=1; AJvYcCWICfyv17ouj7I9/nBkNWtP4fq3ZTZS5o7Dz6/P3iSbD92GHZ+ImWhn56hjrU3kuZB5SRi8hFBXhnN+kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzceSfk7p4utQhxDScS6kkkG2gYc7JF+9z7RPJKu/29kDVjV5Vs
	H6krCwyg9ySrfbt7scTBBMOOK+ENb0nVIO8mpEpDUd1kM1fu12TuWcd9i+AzcLhwVlX/v8TwymA
	H4iGLamT7+uvYIyXxYg==
X-Received: from wrbex4.prod.google.com ([2002:a05:6000:2484:b0:439:b6d8:ec50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:828c:b0:483:8f0f:36fe with SMTP id 5b1f17b1804b1-483c9bb0c9fmr215808885e9.1.1772466747817;
 Mon, 02 Mar 2026 07:52:27 -0800 (PST)
Date: Mon, 2 Mar 2026 15:52:26 +0000
In-Reply-To: <aaRH-aXYKntYyjRS@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aaRH-aXYKntYyjRS@google.com>
Message-ID: <aaWyOiXF55k47F3K@google.com>
Subject: Re: [CRASH] kunit failures in platform-device-devm
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
>=20
> I've experienced a fair number of different crashes when running kunit
> locally. I just ran this command on v7.0-rc1 or upstream/master:
>=20
> ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86_64 =
--kconfig_add CONFIG_RUST=3Dy --kconfig_add CONFIG_PCI=3Dy
>=20

One more crash signature:

<many tests succeed>
[15:45:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D miscde=
v_test_twice  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:13] [PASSED] lower static range, top
[15:45:13] [PASSED] upper static range, bottom
[15:45:13] [PASSED] lower static range, bottom
[15:45:13] [PASSED] upper static range, top
[15:45:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] miscdev_t=
est_twice =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D miscdev_test_duplicat=
e_minor  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:13] [PASSED] lower static range, top
[15:45:13] [PASSED] upper static range, bottom
[15:45:13] [PASSED] lower static range, bottom
[15:45:13] [PASSED] upper static range, top
[15:45:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] miscdev_test_duplicate_m=
inor =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:13] [PASSED] miscdev_test_duplicate_name
[15:45:13] [PASSED] miscdev_test_duplicate_name_leak
[15:45:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D miscdev_test_duplicat=
e_error  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:13] [PASSED] lower static range, top
[15:45:14] [PASSED] upper static range, bottom
[15:45:14] [PASSED] lower static range, bottom
[15:45:14] [PASSED] upper static range, top
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] miscdev_test_duplicate_e=
rror =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] [PASSED] miscdev_test_dynamic_reentry
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
[PASSED] miscdev =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D qos-kunit-test (3 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] [PASSED] freq_qos_test_min
[15:45:14] [PASSED] freq_qos_test_maxdef
[15:45:14] [PASSED] freq_qos_test_readd
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] qos=
-kunit-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D pm_runtime_test_cases (6 su=
btests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] kernel tried to execute NX-protected page - exploit attempt? (ui=
d: 0)
[15:45:14] BUG: unable to handle page fault for address: ffff97f4c19d0598
[15:45:14] #PF: supervisor instruction fetch in kernel mode
[15:45:14] #PF: error_code(0x0011) - permissions violation
[15:45:14] PGD 2f601067 P4D 2f601067 PUD 2f602067 PMD 80000000018000e3
[15:45:14] Oops: Oops: 0011 [#2] SMP PTI
[15:45:14] CPU: 0 UID: 0 PID: 2171 Comm: kunit_try_catch Tainted: G      D =
W        N  6.19.0-rc2-00025-g5564c12385b7 #59 PREEMPT(lazy)
[15:45:14] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[15:45:14] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[15:45:14] RIP: 0010:0xffff97f4c19d0598
[15:45:14] Code: 00 00 00 00 00 00 00 00 00 00 78 05 9d c1 f4 97 ff ff 78 0=
5 9d c1 f4 97 ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <98> 05=
 9d c1 f4 97 ff ff 98 05 9d c1 f4 97 ff ff c0 a4 ae c2 f4 97
[15:45:14] RSP: 0000:ffffb241c00fbca0 EFLAGS: 00010282
[15:45:14] RAX: 0000000000000000 RBX: ffff97f4c18ad4e4 RCX: 000000000000000=
1
[15:45:14] RDX: ffffffffa1e349a0 RSI: ffff97f4c18ad400 RDI: ffff97f4c18ad40=
0
[15:45:14] RBP: 0000000000000000 R08: ffff97f4c14dd918 R09: 000000000000002=
a
[15:45:14] R10: 000000000000002a R11: ffff97f4c19d0598 R12: ffff97f4c18ad59=
0
[15:45:14] R13: ffffb241c00fbd28 R14: ffff97f4c19d0598 R15: ffff97f4c18ad40=
0
[15:45:14] FS:  0000000000000000(0000) GS:ffff97f55c933000(0000) knlGS:0000=
000000000000
[15:45:14] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15:45:14] CR2: ffff97f4c19d0598 CR3: 000000002f02a000 CR4: 00000000000006f=
0
[15:45:14] Call Trace:
[15:45:14]  <TASK>
[15:45:14]  ? __rpm_callback+0x87/0x300
[15:45:14]  ? rpm_resume+0x4e9/0x6e0
[15:45:14]  ? kernfs_drain+0x5e/0x140
[15:45:14]  ? kernfs_drain+0x5e/0x140
[15:45:14]  ? kernfs_unlink_sibling+0x8e/0xb0
[15:45:14]  ? __pm_runtime_resume+0x57/0x80
[15:45:14]  ? device_release_driver_internal+0x70/0x2b0
[15:45:14]  ? bus_remove_device+0x14c/0x170
[15:45:14]  ? device_del+0x1da/0x3b0
[15:45:14]  ? __schedule+0x66b/0x750
[15:45:14]  ? device_unregister+0xd/0x30
[15:45:14]  ? kunit_remove_resource+0x6a/0xb0
[15:45:14]  ? kunit_try_run_case_cleanup+0x7a/0xb0
[15:45:14]  ? kunit_generic_run_threadfn_adapter+0x1d/0x40
[15:45:14]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[15:45:14]  ? kthread+0x1d1/0x210
[15:45:14]  ? __pfx_kthread+0x10/0x10
[15:45:14]  ? ret_from_fork+0xce/0x1a0
[15:45:14]  ? __pfx_kthread+0x10/0x10
[15:45:14]  ? ret_from_fork_asm+0x1a/0x30
[15:45:14]  </TASK>
[15:45:14] CR2: ffff97f4c19d0598
[15:45:14] ---[ end trace 0000000000000000 ]---
[15:45:14] RIP: 0010:kunit_test_null_dereference+0x15/0x80
[15:45:14] Code: 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 f3 0f 1e fa 48 83 ec 10 65 48 8b 05 90 61 d2 00 48 89 44 24 08 <c7> 04=
 25 00 00 00 00 00 00 00 00 48 c7 87 a0 01 00 00 75 22 c4 a1
[15:45:14] RSP: 0000:ffffb241c010bed0 EFLAGS: 00010282
[15:45:14] RAX: 51937c0fa0337700 RBX: ffff97f4c1af77c0 RCX: 000000000000000=
1
[15:45:14] RDX: ffff97f4fec25840 RSI: 0000000000000286 RDI: ffffb241c0013c2=
8
[15:45:14] RBP: ffff97f4c19d0b40 R08: ffff97f4c1ae9a00 R09: 000000000000080=
0
[15:45:14] R10: 0000000000000000 R11: ffffffffa15bae80 R12: ffff97f4c1ae998=
0
[15:45:14] R13: ffffffffa1c7bf38 R14: ffff97f4c1af77c0 R15: ffff97f4c19d0b4=
0
[15:45:14] FS:  0000000000000000(0000) GS:ffff97f55c933000(0000) knlGS:0000=
000000000000
[15:45:14] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15:45:14] CR2: ffff97f4c19d0598 CR3: 000000002f02a000 CR4: 00000000000006f=
0
[15:45:14] note: kunit_try_catch[2171] exited with irqs disabled
[15:45:14]     # pm_runtime_depth_test: try faulted: last line seen drivers=
/base/power/runtime-test.c:27
[15:45:14]     # pm_runtime_depth_test: internal error occurred during test=
 case cleanup: -4
[15:45:14] [FAILED] pm_runtime_depth_test
[15:45:14] Error: Driver 'pm_runtime_test_device' is already registered, ab=
orting...
[15:45:14]     # pm_runtime_already_suspended_test: ASSERTION FAILED at dri=
vers/base/power/runtime-test.c:35
[15:45:14]     Expected dev is not error, but is: -16
[15:45:14] [FAILED] pm_runtime_already_suspended_test
[15:45:14] Error: Driver 'pm_runtime_test_device' is already registered, ab=
orting...
[15:45:14]     # pm_runtime_idle_test: ASSERTION FAILED at drivers/base/pow=
er/runtime-test.c:69
[15:45:14]     Expected dev is not error, but is: -16
[15:45:14] [FAILED] pm_runtime_idle_test
[15:45:14] Error: Driver 'pm_runtime_test_device' is already registered, ab=
orting...
[15:45:14]     # pm_runtime_disabled_test: ASSERTION FAILED at drivers/base=
/power/runtime-test.c:90
[15:45:14]     Expected dev is not error, but is: -16
[15:45:14] [FAILED] pm_runtime_disabled_test
[15:45:14] Error: Driver 'pm_runtime_test_device' is already registered, ab=
orting...
[15:45:14]     # pm_runtime_error_test: ASSERTION FAILED at drivers/base/po=
wer/runtime-test.c:130
[15:45:14]     Expected dev is not error, but is: -16
[15:45:14] [FAILED] pm_runtime_error_test
[15:45:14] Error: Driver 'pm_runtime_test_device' is already registered, ab=
orting...
[15:45:14]     # pm_runtime_probe_active_test: ASSERTION FAILED at drivers/=
base/power/runtime-test.c:213
[15:45:14]     Expected dev is not error, but is: -16
[15:45:14] [FAILED] pm_runtime_probe_active_test
[15:45:14]     # module: runtime_test
[15:45:14] # pm_runtime_test_cases: pass:0 fail:6 skip:0 total:6
[15:45:14] # Totals: pass:0 fail:6 skip:0 total:6
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [FAILED] pm_runtime_t=
est_cases =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D root-device-devm (2 s=
ubtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] [PASSED] root_device_devm_register_unregister_test
[15:45:14] [PASSED] root_device_devm_register_get_unregister_with_devm_test
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] root-d=
evice-devm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D platform-device-devm (4 sub=
tests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:45:14] BUG: unable to handle page fault for address: fffffffef8d4b4a6
[15:45:14] #PF: supervisor write access in kernel mode
[15:45:14] #PF: error_code(0x0002) - not-present page
[15:45:14] PGD 2f02d067 P4D 2f02d067 PUD 0
[15:45:14] Oops: Oops: 0002 [#3] SMP PTI
[15:45:14] CPU: 0 UID: 0 PID: 2186 Comm: kunit_try_catch Tainted: G      D =
W        N  6.19.0-rc2-00025-g5564c12385b7 #59 PREEMPT(lazy)
[15:45:14] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[15:45:14] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[15:45:14] RIP: 0010:queued_spin_lock_slowpath+0x126/0x1e0
[15:45:14] Code: d8 c1 e8 10 66 87 47 02 66 85 c0 74 40 0f b7 c0 89 c2 83 e=
2 03 c1 e2 04 83 e0 fc 48 c7 c6 f8 ff ff ff 48 8b 84 46 80 b9 c7 a1 <48> 89=
 8c 02 00 34 2f a2 83 79 08 00 75 08 f3 90 83 79 08 00 74 f8
[15:45:14] RSP: 0000:ffffb241c00fbc88 EFLAGS: 00010206
[15:45:14] RAX: ffffffff56a58086 RBX: 0000000000040000 RCX: ffff97f4fec2640=
0
[15:45:14] RDX: 0000000000000020 RSI: fffffffffffffff8 RDI: ffff97f4c2aea70=
0
[15:45:14] RBP: 0000000000040000 R08: 0000000000000033 R09: 00000000fffffff=
9
[15:45:14] R10: 0000000000000000 R11: ffffffffa17b1610 R12: ffff97f4c2aea70=
0
[15:45:14] R13: ffffb241c00fbce0 R14: ffff97f4c19d0ba8 R15: ffff97f55c93300=
0
[15:45:14] FS:  0000000000000000(0000) GS:ffff97f55c933000(0000) knlGS:0000=
000000000000
[15:45:14] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15:45:14] CR2: fffffffef8d4b4a6 CR3: 000000002f02a000 CR4: 00000000000006f=
0
[15:45:14] Call Trace:
[15:45:14]  <TASK>
[15:45:14]  klist_iter_exit+0x2c/0x70
[15:45:14]  ? __pfx___device_attach_driver+0x10/0x10
[15:45:14]  bus_for_each_drv+0x12a/0x160
[15:45:14]  __device_attach+0xbf/0x160
[15:45:14]  device_initial_probe+0x2f/0x50
[15:45:14]  bus_probe_device+0x8f/0x110
[15:45:14]  device_add+0x23f/0x3d0
[15:45:14]  platform_device_add+0x137/0x1d0
[15:45:14]  platform_device_devm_register_unregister_test+0x6c/0x2e0
[15:45:14]  ? kunit_add_action_or_reset+0x12/0x30
[15:45:14]  ? kunit_kmalloc_array+0x34/0x60
[15:45:14]  kunit_try_run_case+0x8f/0x190
[15:45:14]  ? set_cpus_allowed_ptr+0x8c/0xb0
[15:45:14]  kunit_generic_run_threadfn_adapter+0x1d/0x40
[15:45:14]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[15:45:14]  kthread+0x1d1/0x210
[15:45:14]  ? __pfx_kthread+0x10/0x10
[15:45:14]  ret_from_fork+0xce/0x1a0
[15:45:14]  ? __pfx_kthread+0x10/0x10
[15:45:14]  ret_from_fork_asm+0x1a/0x30
[15:45:14]  </TASK>
[15:45:14] CR2: fffffffef8d4b4a6
[15:45:14] ---[ end trace 0000000000000000 ]---
[15:45:14] RIP: 0010:kunit_test_null_dereference+0x15/0x80
[15:45:14] Code: 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 f3 0f 1e fa 48 83 ec 10 65 48 8b 05 90 61 d2 00 48 89 44 24 08 <c7> 04=
 25 00 00 00 00 00 00 00 00 48 c7 87 a0 01 00 00 75 22 c4 a1
[15:45:14] RSP: 0000:ffffb241c010bed0 EFLAGS: 00010282
[15:45:14] RAX: 51937c0fa0337700 RBX: ffff97f4c1af77c0 RCX: 000000000000000=
1
[15:45:14] RDX: ffff97f4fec25840 RSI: 0000000000000286 RDI: ffffb241c0013c2=
8
[15:45:14] RBP: ffff97f4c19d0b40 R08: ffff97f4c1ae9a00 R09: 000000000000080=
0
[15:45:14] R10: 0000000000000000 R11: ffffffffa15bae80 R12: ffff97f4c1ae998=
0
[15:45:14] R13: ffffffffa1c7bf38 R14: ffff97f4c1af77c0 R15: ffff97f4c19d0b4=
0
[15:45:14] FS:  0000000000000000(0000) GS:ffff97f55c933000(0000) knlGS:0000=
000000000000
[15:45:14] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15:45:14] CR2: fffffffef8d4b4a6 CR3: 000000002f02a000 CR4: 00000000000006f=
0
[15:45:14] note: kunit_try_catch[2186] exited with irqs disabled
[15:45:14] note: kunit_try_catch[2186] exited with preempt_count 1
[15:45:14]     # platform_device_devm_register_unregister_test: try faulted=
: last line seen drivers/base/test/platform-device-test.c:65
[15:45:14]     # platform_device_devm_register_unregister_test: internal er=
ror occurred preventing test case from running: -4
[15:45:14] [FAILED] platform_device_devm_register_unregister_test

<one minute passes>

Command '['qemu-system-x86_64', '-nodefaults', '-m', '1024', '-kernel', '.k=
unit/arch/x86/boot/bzImage', '-append', 'kunit.enable=3D1 console=3DttyS0 k=
unit_shutdown=3Dreboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-acc=
el', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-bios', 'qboot.rom']' tim=
ed out after 120 seconds
[15:46:14] [ERROR] Test: platform-device-devm: missing expected subtest!
[15:46:14] sysfs: cannot create duplicate filename '/devices/platform/test'
[15:46:14] CPU: 0 UID: 0 PID: 2188 Comm: kunit_try_catch Tainted: G      D =
W        N  6.19.0-rc2-00025-g5564c12385b7 #59 PREEMPT(lazy)
[15:46:14] Tainted: [D]=3DDIE, [W]=3DWARN, [N]=3DTEST
[15:46:14] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[15:46:14] Call Trace:
[15:46:14]  <TASK>
[15:46:14]  dump_stack_lvl+0x2d/0x70
[15:46:14]  sysfs_create_dir_ns+0xe8/0x130
[15:46:14]  kobject_add_internal+0x1dd/0x360
[15:46:14]  kobject_add+0x88/0xf0
[15:46:14]  device_add+0x171/0x3d0
[15:46:14]  platform_device_add+0x137/0x1d0
[15:46:14]  platform_device_devm_register_get_unregister_with_devm_test+0x6=
c/0x2f0
[15:46:14]  ? kunit_add_action_or_reset+0x12/0x30
[15:46:14]  ? kunit_kmalloc_array+0x34/0x60
[15:46:14]  kunit_try_run_case+0x8f/0x190
[15:46:14]  ? set_cpus_allowed_ptr+0x8c/0xb0
[15:46:14]  kunit_generic_run_threadfn_adapter+0x1d/0x40
[15:46:14]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[15:46:14]  kthread+0x1d1/0x210
[15:46:14]  ? __pfx_kthread+0x10/0x10
[15:46:14]  ret_from_fork+0xce/0x1a0
[15:46:14]  ? __pfx_kthread+0x10/0x10
[15:46:14]  ret_from_fork_asm+0x1a/0x30
[15:46:14]  </TASK>
[15:46:14] kobject: kobject_add_internal failed for test with -EEXIST, don'=
t try to register things with the same name in the same directory.
[15:46:14]     # platform_device_devm_register_get_unregister_with_devm_tes=
t: ASSERTION FAILED at drivers/base/test/platform-device-test.c:97
[15:46:14]     Expected ret =3D=3D 0, but
[15:46:14]         ret =3D=3D -17 (0xffffffffffffffef)
[15:46:14] qemu-system-x86_64: terminating on signal 15 from pid 673195 (py=
thon3)
[15:46:14] [CRASHED]
[15:46:14] [ERROR] Test: platform-device-devm: missing expected subtest!
[15:46:14] [CRASHED]
[15:46:14] [ERROR] Test: platform-device-devm: missing expected subtest!
[15:46:14] [CRASHED]
[15:46:14] [ERROR] Test: platform-device-devm: missing subtest result line!
[15:46:14] # module: platform_device_test
[15:46:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [CRASHED] platform-de=
vice-devm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:46:14] [ERROR] Test: main: missing expected subtest!
[15:46:14] [CRASHED]
[15:46:14] [ERROR] Test: main: missing expected subtest!
[15:46:14] [CRASHED]
[15:46:14] [ERROR] Test: main: missing expected subtest!
[15:46:14] [CRASHED]
[15:46:14] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[15:46:14] Testing complete. Ran 1082 tests: passed: 995, failed: 7, crashe=
d: 6, skipped: 74, errors: 7
[15:46:14] Failures: pm_runtime_test_cases, platform-device-devm, , ,
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | te=
e .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
[15:46:14] Elapsed time: 197.554s total, 0.002s configuring, 77.498s buildi=
ng, 120.052s running

Alice
