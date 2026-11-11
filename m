Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422502;
	b=U0iIvoo/YKJMWgpa74rRBhKuqc1loCMfLr8mrMXHO/lvQWBH84lYH5s6i/86kdoPZpqk
	 emgXiBuOtFay93Zg/Fi9wqMB1J/k9/ck6RDCI+kWWx4qHLd2yoZ3TaMjSVPPqFfUfo+hI
	 dsTXJ74HMOzPQOYJE7Wh26PMbH7d56InPN/HbugHTNXJrkv2WLh2nlxNMdzmuOuq1PwYG
	 PIYf+RmZZ8LHKLFWGcBt8ZNOcNuH5PW4fPrYgOd9xhmJtT/9CsG+U82w5z4i05QmfxpDv
	 oDAZsdz/S/Ce4/PWln8wJn7nEq0YsNOaRgN1gGDngPKy2wQrk2p/G0fWcP8PAou7CTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
	b=u6p3qd0UrstCPqOI/st53i3C11HTpVVAxUjd88xuACQfqwh2CO6VtlgWv9l9pnqulSe0
	 7F4Wl+oOZo6eBhGAuwgYJmCHlEKBESIdx+ak49tPuDECw6Aoq9kkUFueFGSqCbPbUsMBd
	 yfYxZIJWKhrkhdnP3pDeYESgzMsLcPMLm8Evraor4nVmgPOnoKAUX1X8WnN0ykfUzTWFS
	 CR9+NbDFq6U8aTN2PY3omq2SuNLcPfpXKD3d5O98oUUOQM+LOaSbsQAaS4mm9sZQVLP7m
	 z6UJOR3GVQ1CJ027WDaeFh6KzkVlHokTLkO+57w+/Tq/Lt0WnZTPythmL1jrTes2FnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=HwYc1Rkt;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A592606A336
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 18:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A592606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=HwYc1Rkt
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1438d9363fbso79610c88.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1794422501; x=1795027301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
        b=HwYc1Rkt4rbC8MgYQrHVtPbnP9lOetkH5GBWj5U0EOsttIObSBNrsi810KAMnVKXDx
         9ax2lxhjiCBTicwAwKB+UiyaIZ/eiff3Sx2n4cpjVmei8LRIW6c1Eek7orG/TjHOpfhc
         dX4pBC/H0MEDlVs7gesB4FFouU8FTA72rb0YCwnmHccvGlBTEJEfSgGl34F/UF0yMuRL
         O3YAyamf+9obyKvD85xFyeZTrfwEojRLgyRxk2EWD9LufoT5quS0DIKpbIp7OlCKvwHF
         VJksDVbkHIPp77Ao1Fz2YrUAydHNT53E7ZcEgT+2KEHG1EM8ezaFAdFkvcgojyFUVsG9
         wmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422501; x=1795027301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbwxaCoFVM88SQya2OKeSfNIuBou+PH+5kursy37q3g=;
        b=k8NJNCsvR6tvWYvJaMRu/0XIASYcITVHslbLMQDsqgp1peJyLukSrCPRkmmoWwco8o
         qAB5vDvCb6hymz+HFotReH2BZ3/3euYhWmiIls4kscLVbEzFoNwasVI4gJMNNVVOqKpM
         AFNl7PXwt3zezOc3caxm0rI5rGXhC6EQ1ZJFa1A2yyC+ccdnnBEgmVNIUp9ZHASj/RFb
         dAbqwLXvWuAS+OX7UGhPQAzOvlYFuDxC6hPCXEgO9fjBnhd8hdPK/UT44loXWe43fYNn
         q5os17TavwZ0i1KGii9v6uo40OE9/oELyopHmriYJAfqX7CBnUoU5h1zp1+/h6nOac/o
         uLMg==
X-Gm-Message-State: APuU4Z/yhg9qMrQLBEOFtUM5HsSId5uuhX9f1S2MQmx58BkfXGOl/IAi
	YEqDjVDESD8VZY2Ar6t3Jz52AFXds7CoVT803cg7/Svo6CH8Iwgjb9DMH5a9NQMb+OE=
X-Gm-Gg: AYBFou3RkbBoax++ktxU6UZzrDPKH6k23CrgL2DfREm/+TeflKX0VGlma9g3mOXr1Xy
	/zGfFCN8ZsQo81w4TUr2jDlao9QUwwqsxlODFLiVPIgduI/5dPkFTtQJRY/j12Vp/N9G9J35Ltg
	IaV4TwVXXKOqmpLsOM/xpNjMXvBadW8moZCDK9CVwatfev0EEElSqaoCbgfF3ZxuuiXrktrsvrz
	QEV75UM+4Sxmi5mvb0j/x7Pxi9kBivhEuL9EmHm5rzQbWocM5DiqcG6U+W0pvkKFBGuZYfwnmEB
	zHLLGVbmEstXj7QYuxKsRmQrBTe4v1LuvSI18mVRTZsqVdO7BRvl/2sRFzbuuzmPM0Iogc8XAV/
	2OZvvmk3WHW4dmGuaVdTmYW/0ZeP8vgp3ZQjoB605A0LHt52F9gbcHQ4Ryfs5yqgEy9dMbDhVU1
	oJwuSI7k9EKvPh/PUXT4sfoSRFrTk8s3buId3X5UNCxjC+8PWWi92wrWBVXEYGUw8eh/oXqbg2P
	kan4SwZzAA/IlYQRbRmuE50JtKtpCW8F9KK6HPU5j63Cgyz4BuN3JrMMimomG0nbIGQ489i6srA
	tuqp/MJhUCI2DxZcJLW8Qpv9vPofrHYf/LfF3fKDnT/ymRPsKAe4qX00B0fMEaDFyyhL
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr197321c88.17.1794422500528;
        Wed, 11 Nov 2026 10:41:40 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm36593441c88.10.2026.11.11.10.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:39 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
Date: Wed, 11 Nov 2026 18:41:37 +0000
Message-Id: <cover.1793652314.git.pgovind2@uci.edu>
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
unsound behavior in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/scatterlist.rs:

`Owned<P>` contains an indirect self-reference. During pinned
initialization, `DmaMappedSgt::sgt` is set to the address of `Owned::sgt`.
`DmaMappedSgt` is then owned through `Owned::dma`.

At the moment, only `Owned::dma` is marked as structurally pinned.
The `#[pin_data]` attribute therefore only considers `Devres<DmaMappedSgt>`
in its `Unpin` implementation.
Since `Devres<DmaMappedSgt>` implements `Unpin`, `Owned<P>`
is `Unpin` and can be moved.

Moving an `Owned<P>` instance could also move the `sgt` field.
This would cause `DmaMappedSgt::sgt` to now point at an invalid location.
Using this pointer would then lead to undefined behavior.

Below is a PoC kernel module that demonstrates the bug. It shows
safe code calling `Pin::into_inner()` on a
`Pin<KBox<SGTable<Owned<P>>>>` and then `KBox::into_inner()`, which moves
the value. `DmaMappedSgt::sgt` now points to a stale location.
When `DmaMappedSgt` is dropped, `dma_unmap_sgtable()` dereferences
the stale pointer, resulting in a use-after-free.

// SPDX-License-Identifier: GPL-2.0

use kernel::{
    bindings, device, dma, error, faux, page,
    prelude::*,
    scatterlist::{Owned, SGTable},
};

module! {
    type: ScatterListPoC,
    name: "scatterlist_poc",
    authors: ["Priya Govindasamy"],
    description: "ScatterList PoC kernel module",
    license: "GPL",
}

struct ScatterListPoC {
    _dev: faux::Registration,
}

impl kernel::Module for ScatterListPoC {
    fn init(_module: &'static ThisModule) -> Result<Self> {

        let dev = faux::Registration::new(c"scatterlist-poc", None)?;
        let generic_dev: &device::Device<device::Bound> = dev.as_ref().as_ref();

        let raw_dev = core::ptr::from_ref(generic_dev)
            .cast_mut()
            .cast::<bindings::device>();

        // A faux device does not provide a DMA mask. Point its streaming mask
        // at its coherent mask storage and configure both before creating any 
        // DMA mappings.
        //
        // SAFETY: `raw_dev` points to the registered faux device, whose
        // allocation is stable for the lifetime of `dev`.
        unsafe {
            (*raw_dev).dma_mask = core::ptr::addr_of_mut!((*raw_dev).coherent_dma_mask);
            error::to_result(bindings::dma_set_mask_and_coherent(raw_dev, u64::MAX))?;
        }

        let pages = VVec::<u8>::with_capacity(4 * page::PAGE_SIZE, GFP_KERNEL)?;
        let sgt: Pin<KBox<SGTable<Owned<VVec<u8>>>>> = KBox::pin_init(SGTable::new(
                generic_dev,
                pages,
                dma::DataDirection::Bidirectional,
                GFP_KERNEL,
            ),
            GFP_KERNEL
        )?;

        let boxed = Pin::into_inner(sgt);
        let table = KBox::into_inner(boxed);
        drop(table);

        Ok(Self {
            _dev: dev,
        })
    }
}

impl Drop for ScatterListPoC {
    fn drop(&mut self) {
        pr_info!("scatterlist_poc: module unloaded\n");
    }
}

Output:
[  550.191296] ==================================================================
[  550.191312] BUG: KASAN: slab-use-after-free in rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191357] Read of size 8 at addr ffff8882f4db57a8 by task insmod/5029
[  550.191370]
[  550.191399] CPU: 1 UID: 0 PID: 5029 Comm: insmod Tainted: G           OE    N   7.3.0+ #71 PREEMPT(lazy)
[  550.191416] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[  550.191420] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu2 04/01/2014
[  550.191430] Call Trace:
[  550.191439]  <TASK>
[  550.191459]  dump_stack_lvl+0x97/0xe0
[  550.191485]  print_report+0x175/0x6f0
[  550.191498]  ? __virt_addr_valid+0x18e/0x3b0
[  550.191515]  ? __virt_addr_valid+0x345/0x3b0
[  550.191525]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191533]  ? kasan_complete_mode_report_info+0x75/0x230
[  550.191546]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191553]  kasan_report+0xfa/0x130
[  550.191564]  ? rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191580]  __asan_report_load8_noabort+0x18/0x20
[  550.191588]  rust_helper_dma_unmap_sgtable+0x3d/0xa0
[  550.191599]  _RNvXCseDCAewP9wfK_15scatterlist_pocNtB2_14ScatterListPoCNtNtCsbuTvttuFvbr_6kernel6module6Module4init+0xac0/0xdf0 [scatterlist_poc]
[  550.191642]  init_module+0x15/0xff0 [scatterlist_poc]
[  550.191654]  do_one_initcall+0x119/0x4f0
[  550.191685]  ? do_init_module+0x63/0x740
[  550.191694]  ? __pfx_init_module+0x10/0x10 [scatterlist_poc]
[  550.191705]  ? __se_sys_finit_module+0x39d/0x5f0
[  550.191714]  ? __x64_sys_finit_module+0x7f/0x90
[  550.191723]  ? x64_sys_call+0xa66/0x2600
[  550.191732]  ? do_syscall_64+0x11c/0x3f0
[  550.191739]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.191747]  ? kvm_sched_clock_read+0x15/0x40
[  550.191763]  ? __lock_acquire+0xeeb/0x1040
[  550.191783]  ? kvm_sched_clock_read+0x15/0x40
[  550.191796]  ? debug_smp_processor_id+0x1b/0x30
[  550.191806]  ? _raw_spin_unlock_irqrestore+0x38/0x90
[  550.191815]  ? __this_cpu_preempt_check+0x17/0x20
[  550.191823]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.191832]  ? debug_smp_processor_id+0x1b/0x30
[  550.191842]  ? kasan_save_alloc_info+0x3a/0x50
[  550.191852]  ? __kasan_kmalloc+0x94/0xb0
[  550.191863]  ? __kmalloc_cache_noprof+0x356/0x6c0
[  550.191876]  ? do_init_module+0x63/0x740
[  550.191885]  ? __kmalloc_cache_noprof+0x160/0x6c0
[  550.191899]  ? kasan_unpoison+0x4c/0x70
[  550.191914]  ? kasan_poison+0x44/0x60
[  550.191939]  do_init_module+0x23f/0x740
[  550.191975]  load_module+0x32d1/0x3f20
[  550.192009]  __se_sys_finit_module+0x39d/0x5f0
[  550.192045]  __x64_sys_finit_module+0x7f/0x90
[  550.192057]  x64_sys_call+0xa66/0x2600
[  550.192066]  do_syscall_64+0x11c/0x3f0
[  550.192072]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192080]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192088]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.192095]  ? do_syscall_64+0x217/0x3f0
[  550.192108]  ? debug_smp_processor_id+0x1b/0x30
[  550.192118]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192125]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192132]  ? lockdep_hardirqs_on+0xdc/0x160
[  550.192140]  ? do_syscall_64+0x217/0x3f0
[  550.192148]  ? __this_cpu_preempt_check+0x17/0x20
[  550.192160]  ? debug_smp_processor_id+0x1b/0x30
[  550.192171]  ? debug_smp_processor_id+0x1b/0x30
[  550.192177]  ? rcu_is_watching+0x1a/0xc0
[  550.192190]  ? trace_irq_disable+0x3c/0x130
[  550.192205]  ? do_syscall_64+0x6d/0x3f0
[  550.192211]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192222]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  550.192238] RIP: 0033:0x7fdbc511e9dd
[  550.192259] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 23 b4 0f 00 f7 d8 64 89 01 48
[  550.192270] RSP: 002b:00007ffd59690678 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  550.192292] RAX: ffffffffffffffda RBX: 000055627cd6e7d0 RCX: 00007fdbc511e9dd
[  550.192298] RDX: 0000000000000000 RSI: 000055627be2ccd2 RDI: 0000000000000003
[  550.192303] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  550.192308] R10: 0000000000000003 R11: 0000000000000246 R12: 000055627be2ccd2
[  550.192312] R13: 000055627cd6e790 R14: 000055627be2b888 R15: 000055627cd6e8e0
[  550.192332]  </TASK>
[  550.192336]
[  550.192338] Allocated by task 5029:
[  550.192480]
[  550.192482] Freed by task 5029:
[  550.192597]
[  550.192600] The buggy address belongs to the object at ffff8882f4db5780
[  550.192600]  which belongs to the cache kmalloc-64 of size 64
[  550.192613] The buggy address is located 40 bytes inside of
[  550.192613]  freed 64-byte region [ffff8882f4db5780, ffff8882f4db57c0)
[  550.192620]
[  550.192623] The buggy address belongs to the physical page:
[  550.192713]
[  550.192716] Memory state around the buggy address:
[  550.192725]  ffff8882f4db5680: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192730]  ffff8882f4db5700: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192734] >ffff8882f4db5780: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192738]                                   ^
[  550.192743]  ffff8882f4db5800: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192747]  ffff8882f4db5880: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  550.192751] ==================================================================

Priya Bala Govindasamy (1):
  rust: scatterlist: pin `Owned::sgt` to prevent invalidating
    `DmaMappedSgt::sgt`

 rust/kernel/scatterlist.rs | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

