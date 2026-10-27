Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123294;
	b=koH5KgPwJW1SAodLNMLa+CN6WGHJgndg5Xp5KjEoB4imcftzOGHeXndb78OKusdprmut
	 8EKD/ldUxqtR4wD22fm7uij5gskKnLXdFGnxDcr8dWmupouL17LhvnNCzvAj/S7KA3tdt
	 OTRKBtz9Ju0fyelLp1bge3WMIDnp5Wosycqefai0SHqNWQZrhkhlZXyf6r1v03KXakslZ
	 D9c1BEEystOVY0+uGTbQLnTmNyld/P3xyHmTbCkM7i6WKFRW7Xalu0IdCCJ3FINWJ0rRw
	 aIbQIFbYkMQ3LUWAvqbaTqsfDl3xTpj1VIFEEhyFI3P2xf1B1INU5nWnhFlovI5Kp4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVEtFp2j8YgCCWq7lU0Msq0fKTFkNyT3CcGSewr+v6I=;
	b=Cfvy6N8AkmVLY+56mGjizl64qnfJYDVr03d9r4r8+qMV3/Qof7HjecpfF8MFdLXTVNcn
	 z8uFwiJ0C61UH8DphzvXRszjC/I1yvQNOi3bSfwGp6OO+L5PavaxqP361qVmCKhxJhi2V
	 uOilK9b8M6q7OZCxeU1IhyY9ivbMz6NiYQCLIrQMgAVNY6tkn++6jS2d4GY0XBMa4t2NP
	 Vd1MJ5hcce0YkbRCNLxqv9191H3niVa6p8dxMvh6Ub5tgFJdpX8DVv9dAdlGVvxIlt+DK
	 cFGQNd7PpFbRMTVOCEzy1E8dpLIBePv82vRa2g4xJ/98W68Joa1msG4f5jKOJgeYlLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=S8rATgPP;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E5606A31D
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 17:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6E5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=S8rATgPP
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-185fd3a4ca3so99872c88.0
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793123293; x=1793728093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVEtFp2j8YgCCWq7lU0Msq0fKTFkNyT3CcGSewr+v6I=;
        b=S8rATgPPM9d0wDoVkhh92aFUspzDnwr0Dn438eEiZ7YglVX09Rywt1KKGGqjEtpjWQ
         oM/plyP9nqTmBHxSt011SiMwgNcJ+1V3OCrX/wbmx4Je6aANjEbYHfBpsMKDimsjI/Gj
         J41wa1KSnbaSt5WGi77wcvFSGtN/Gsv2U7o9r14AT1vWLy1lXwNR6YVDa8gbkXyyqvB1
         a5Y+l2Vm+B8TuAq4ErHUwsBK49EEHGnu+pb8Wop9kximbPcHaV7NJ4i0HP6Z8AYQlvj7
         4iWxvJn6w/Gb467vfXaFcHRbnNzqr2VYJ7c8TBNryAhpN//iZ45axh9iGnAZIiS91ams
         MiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123293; x=1793728093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVEtFp2j8YgCCWq7lU0Msq0fKTFkNyT3CcGSewr+v6I=;
        b=HyyoGHTI13sWVOdyN+NjWORHeBh40ZfUZjWcRRb3ogcKaYMCEbOLSMz5XgxZBisb4X
         rzklfeNNviB/ZjiTluLcb4qV2ntECShLPU0fKnymHMUWBDTnbWE38HH4ukiPwrk5YVxV
         sDDC983WnPM+ycRfaXSJP/AZPi6a307FfizXBZWYwEGl5FcyplruePE0r1Rad4lqg/9c
         Nx0JMofG4xDbkmgPSRFABnz/JzsjscEtOjI4nlCIvKCu5GJ9xOKZ+xFaW+Y/LKs/TYfE
         LU/yRO3KOgI9+hzNVe2O0cUGbMxnVLm+X1Skb2yL3AzKmE/T4ZuAVOSgikeXZtB6VcPi
         aRwg==
X-Forwarded-Encrypted: i=1; AKwUvByOUkWLvCvjM+abMEDyC2LwJwjpmSOEHVNDSlgGAf9PXHWfxC9VJY9A+cR2HQJP2kui6b7DFbvYX1wkJA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKvtk+oBW+0eBNjgqxei2pOfC6y+fnzQFwoKkeFPpWr+ZTha9aG
	guYnyqtMaiumZWP1sAKD8AVmHioZi6lDIZO8wyDjihAwsUiplNoazzQJat/SdTibgPU=
X-Gm-Gg: AYBFou2gFZOQy3ihFPM8AJ0dOXdK1o497BLf2yaUdBxCHRaWwo8frOBzHtvYlRAqswx
	WInXMbFlRl80YOVRgCnfsck3Zyc7+mH4WNfgKWq8lV/dM7ioS6gwEzBjVCCY3rJ+dO/9kdvHQa8
	A0Q4KYUuAyAhKDxPk+KqQuwgi0W4igU4CguvzuXpJ0zH+V650F3FwNG1R8ohoQXdme/O+Grx6Qd
	9I6D5Q3bMY+/9x7P0J7lcx38dJqw7SNBZpkiTtPejHVq8v6OjJoywqS+Gp32HnmD6z8V9/M7OQS
	JLalNeh3JRvRqWGedxkjifdOBAuExGctW+4yDXoYAvgrNCl7BBLWl2gIYJFNs5rXr1xbLhRpa97
	2LynBq5wHAuJLOD2exEUJvctB8Uo9Q46i4UVSvMCwHuh6sKGSGiPSqYxui8VQX/CmGDPjWTjfBQ
	3NWgu4VfS5L/pIDTgiDu+V0eUokUMRO5xMaeI4yQpFQwfyXhVOVjwB7RLNu2LdJg/v9VN2/jTqQ
	cARKt+2rtDhiW6w8rBkCuP8doUZD/07a+mrkPVplYFiwosZGOjzaLph4J/LAKM/PXi6AfLj0JxJ
	nnoIdk8XBfrP41Cma4yRrTCJwMkn7iZO0X9F7Q==
X-Received: by 2002:a05:701b:4511:20b0:168:3243:c91a with SMTP id a92af1059eb24-199350629bemr14786330c88.13.1793123292822;
        Tue, 27 Oct 2026 10:48:12 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm35486813c88.14.2026.10.27.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:48:12 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	mmaurer@google.com,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: soc: avoid dangling attributes when SoC bus is unavailable
Date: Tue, 27 Oct 2026 17:48:09 +0000
Message-Id: <cover.1792628232.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential
unsoundness in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/soc.rs:

`Registration::new()` calls the C function `soc_device_register()` 
to register a SoC device with the SoC core. It passes a pointer to the 
`soc_device_attribute` object of its pinned `BuiltAttributes` object. 
In `soc_device_register()`, if the SoC bus is not registered, this pointer 
argument is saved in a global variable `early_soc_dev_attr` for deferred 
registration and NULL is returned.

If `Registration::new()` receives a NULL pointer, it produces `EINVAL`, 
causing the `BuiltAttributes` object to be dropped. This frees the memory 
containing the attribute data, which is still referenced by 
`early_soc_dev_attr`. A later call to `soc_device_match()` will dereference
this dangling pointer, resulting in a use-after-free bug.

The SoC bus is normally registered by a core initcall before loadable 
modules run, but the condition is reachable if that initcall fails or 
is skipped.

Below is a PoC kernel module that demonstrates such a UAF. 
"initcall_blacklist=soc_bus_register" is added as a kernel command line 
argument to prevent the SoC bus from being registered and trigger the 
aforementioned error path. The module attempts
to register a SoC device, which fails with EINVAL. The module then calls 
soc_device_match() to check if the SoC device is present, which 
results in a UAF.

// SPDX-License-Identifier: GPL-2.0

use kernel::{
    prelude::*,
    soc::{Attributes, Registration},
    str::CString,
    bindings
};

module! {
    type: SocPoc,
    name: "soc_poc",
    authors: ["Priya Govindasamy"],
    description: "PoC demonstrating potential UAF due to Registration::new()",
    license: "GPL",
}

fn matches_soc() -> bool {
    let matches = [
        bindings::soc_device_attribute {
            machine: core::ptr::null(),
            family: c"Snapdragon".as_char_ptr(),
            revision: core::ptr::null(),
            serial_number: core::ptr::null(),
            soc_id: c"SM8650".as_char_ptr(),
            data: core::ptr::null(),
            custom_attr_group: core::ptr::null(),
        },

        // Required zero-terminated sentinel.
        bindings::soc_device_attribute::default(),
    ];

    // SAFETY: `matches` is a valid, zero-terminated array, and all string
    // pointers remain valid throughout the call.
    let result = unsafe { bindings::soc_device_match(matches.as_ptr()) };

    !result.is_null()
}

struct SocPoc {
    _registration: Pin<KBox<Registration>>,
}

impl kernel::Module for SocPoc {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        let attributes = Attributes {
            machine: Some(CString::try_from(c"Rust SoC PoC board")?),
            family: Some(CString::try_from(c"Rust SoC PoC")?),
            revision: Some(CString::try_from(c"1.0")?),
            serial_number: Some(CString::try_from(c"0001")?),
            soc_id: Some(CString::try_from(c"RUST-SOC-POC")?),
        };

        let registration = match KBox::pin_init(Registration::new(attributes), GFP_KERNEL) {
            Ok(registration) => {
                pr_info!("soc_poc: SoC registration succeeded\n");
                registration
            }
            Err(err) => {
                pr_err!("soc_poc: SoC registration failed: {err:?}\n");
                let _matches_soc = matches_soc();
                return Err(err);
            }
        };

        Ok(Self {
            _registration: registration,
        })
    }
}



Output:

[  226.710823] soc_poc: soc_poc: SoC registration failed: EINVAL
[  226.710876] ==================================================================
[  226.710881] BUG: KASAN: slab-use-after-free in soc_device_match_attr+0xb1/0x190
[  226.710929] Read of size 8 at addr ffff88810c770288 by task insmod/4521

[  226.710966] CPU: 4 UID: 0 PID: 4521 Comm: insmod Tainted: G           OE    N  7.3.0-rc5+ #76 PREEMPT(lazy) 
[  226.710974] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[  226.710976] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
[  226.710983] Call Trace:
[  226.710987]  <TASK>
[  226.710996]  dump_stack_lvl+0x97/0xe0
[  226.711027]  print_report+0x175/0x6f0
[  226.711049]  ? __virt_addr_valid+0x18d/0x3b0
[  226.711070]  ? __virt_addr_valid+0x344/0x3b0
[  226.711074]  ? soc_device_match_attr+0xb1/0x190
[  226.711076]  ? kasan_complete_mode_report_info+0x75/0x230
[  226.711082]  ? soc_device_match_attr+0xb1/0x190
[  226.711085]  kasan_report+0xfa/0x130
[  226.711088]  ? soc_device_match_attr+0xb1/0x190
[  226.711095]  __asan_report_load8_noabort+0x18/0x20
[  226.711099]  soc_device_match_attr+0xb1/0x190
[  226.711102]  soc_device_match+0xd1/0x100
[  226.711106]  _RNvXCs6F4l9FIlPI9_7soc_pocNtB2_6SocPocNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0x61b/0x7c0 [soc_poc]
[  226.711124]  init_module+0x15/0xff0 [soc_poc]
[  226.711128]  do_one_initcall+0x119/0x4f0
[  226.711132]  ? do_init_module+0x63/0x740
[  226.711159]  ? __pfx_init_module+0x10/0x10 [soc_poc]
[  226.711163]  ? do_syscall_64+0x11c/0x3f0
[  226.711183]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  226.711193]  ? kvm_sched_clock_read+0x15/0x40
[  226.711203]  ? __lock_acquire+0xeeb/0x1040
[  226.711219]  ? kvm_sched_clock_read+0x15/0x40
[  226.711223]  ? debug_smp_processor_id+0x1b/0x30
[  226.711227]  ? _raw_spin_unlock_irqrestore+0x38/0x90
[  226.711239]  ? __this_cpu_preempt_check+0x17/0x20
[  226.711242]  ? lockdep_hardirqs_on+0xdc/0x160
[  226.711247]  ? debug_smp_processor_id+0x1b/0x30
[  226.711254]  ? kasan_save_alloc_info+0x3a/0x50
[  226.711257]  ? __kasan_kmalloc+0x94/0xb0
[  226.711261]  ? __kmalloc_cache_noprof+0x35b/0x6c0
[  226.711267]  ? do_init_module+0x63/0x740
[  226.711270]  ? __kmalloc_cache_noprof+0x165/0x6c0
[  226.711272]  ? kasan_unpoison+0x4c/0x70
[  226.711276]  ? kasan_poison+0x44/0x60
[  226.711281]  do_init_module+0x23f/0x740
[  226.711288]  load_module+0x32dc/0x3f20
[  226.711297]  __se_sys_finit_module+0x39d/0x5f0
[  226.711308]  __x64_sys_finit_module+0x7f/0x90
[  226.711312]  x64_sys_call+0xa66/0x2600
[  226.711316]  do_syscall_64+0x11c/0x3f0
[  226.711319]  ? vm_mmap_pgoff+0x25d/0x360
[  226.711336]  ? up_write+0x1b4/0x4c0
[  226.711338]  ? __this_cpu_preempt_check+0x17/0x20
[  226.711343]  ? vm_mmap_pgoff+0x269/0x360
[  226.711348]  ? fput+0x60/0x90
[  226.711358]  ? ksys_mmap_pgoff+0x426/0x630
[  226.711374]  ? debug_smp_processor_id+0x1b/0x30
[  226.711379]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  226.711384]  ? __this_cpu_preempt_check+0x17/0x20
[  226.711387]  ? lockdep_hardirqs_on+0xdc/0x160
[  226.711391]  ? debug_smp_processor_id+0x1b/0x30
[  226.711394]  ? rcu_is_watching+0x1a/0xc0
[  226.711401]  ? trace_irq_disable+0x3c/0x130
[  226.711419]  ? do_syscall_64+0x6d/0x3f0
[  226.711422]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  226.711426]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  226.711429] RIP: 0033:0x7f391451e9dd
[  226.711440] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 23 b4 0f 00 f7 d8 64 89 01 48
[  226.711446] RSP: 002b:00007ffd4da673b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  226.711457] RAX: ffffffffffffffda RBX: 000055a3792b57c0 RCX: 00007f391451e9dd
[  226.711460] RDX: 0000000000000000 RSI: 000055a3514efcd2 RDI: 0000000000000003
[  226.711462] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  226.711464] R10: 0000000000000003 R11: 0000000000000246 R12: 000055a3514efcd2
[  226.711466] R13: 000055a3792b5790 R14: 000055a3514ee888 R15: 000055a3792b58d0
[  226.711473]  </TASK>

[  226.711475] Allocated by task 4521:
[  226.711481]  kasan_save_track+0x2f/0x70
[  226.711490]  kasan_save_alloc_info+0x3a/0x50
[  226.711492]  __kasan_kmalloc+0x94/0xb0
[  226.711494]  __kmalloc_node_track_caller_noprof+0x56c/0x850
[  226.711497]  krealloc_node_align_noprof+0x189/0x3b0
[  226.711500]  rust_helper_krealloc_node_align+0xd/0x20
[  226.711517]  _RNvXCs6F4l9FIlPI9_7soc_pocNtB2_6SocPocNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0x1eb/0x7c0 [soc_poc]
[  226.711524]  init_module+0x15/0xff0 [soc_poc]
[  226.711527]  do_one_initcall+0x119/0x4f0
[  226.711530]  do_init_module+0x23f/0x740
[  226.711533]  load_module+0x32dc/0x3f20
[  226.711535]  __se_sys_finit_module+0x39d/0x5f0
[  226.711537]  __x64_sys_finit_module+0x7f/0x90
[  226.711539]  x64_sys_call+0xa66/0x2600
[  226.711541]  do_syscall_64+0x11c/0x3f0
[  226.711544]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

[  226.711547] Freed by task 4521:
[  226.711549]  kasan_save_track+0x2f/0x70
[  226.711552]  kasan_save_free_info+0x44/0x50
[  226.711555]  __kasan_slab_free+0x63/0x90
[  226.711557]  kfree+0x1c3/0x680
[  226.711565]  krealloc_node_align_noprof+0x238/0x3b0
[  226.711567]  rust_helper_krealloc_node_align+0xd/0x20
[  226.711570]  _RNvXCs6F4l9FIlPI9_7soc_pocNtB2_6SocPocNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0x525/0x7c0 [soc_poc]
[  226.711573]  init_module+0x15/0xff0 [soc_poc]
[  226.711576]  do_one_initcall+0x119/0x4f0
[  226.711579]  do_init_module+0x23f/0x740
[  226.711581]  load_module+0x32dc/0x3f20
[  226.711583]  __se_sys_finit_module+0x39d/0x5f0
[  226.711585]  __x64_sys_finit_module+0x7f/0x90
[  226.711587]  x64_sys_call+0xa66/0x2600
[  226.711589]  do_syscall_64+0x11c/0x3f0
[  226.711592]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

[  226.711595] The buggy address belongs to the object at ffff88810c770200
                which belongs to the cache kmalloc-192 of size 192
[  226.711601] The buggy address is located 136 bytes inside of
                freed 192-byte region [ffff88810c770200, ffff88810c7702c0)

[  226.711605] The buggy address belongs to the physical page:
[  226.711613] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10c770
[  226.711627] head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  226.711630] flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
[  226.711637] page_type: f5(slab)
[  226.711656] raw: 0017ffffc0000040 ffff8881000423c0 dead000000000100 dead000000000122
[  226.711659] raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
[  226.711661] head: 0017ffffc0000040 ffff8881000423c0 dead000000000100 dead000000000122
[  226.711663] head: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
[  226.711665] head: 0017ffffc0000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
[  226.711667] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
[  226.711668] page dumped because: kasan: bad access detected

[  226.711676] Memory state around the buggy address:
[  226.711681]  ffff88810c770180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  226.711682]  ffff88810c770200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  226.711687] >ffff88810c770280: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  226.711688]                       ^
[  226.711690]  ffff88810c770300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  226.711692]  ffff88810c770380: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  226.711693] ==================================================================
[  226.711696] Disabling lock debugging due to kernel taint




Priya Bala Govindasamy (1):
  rust: soc: avoid dangling attributes when SoC bus is unavailable

 drivers/base/soc.c      | 19 ++++++++++++++++++-
 include/linux/sys_soc.h | 18 ++++++++++++++++++
 rust/kernel/soc.rs      |  7 ++++---
 3 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.34.1

