Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6132AABA;
	Fri,  7 Aug 2026 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786142405; cv=none; b=LEDilFzX2OcWp7+TjSwY1UdGbr44/CJTnd0FKdHU+21p9R0ceLnKTpZnbAHSBQqZP66/6Fcb1ZTcEgUUn+XovJxLoZIgdB38XTditdlTzBVKgdAeCK3fpllTvVLl6qjC4ytYulTyM6dLA+Nvmxb68u2FjpWTRwVWeVHwiPPd43Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786142405; c=relaxed/simple;
	bh=P+2ZA23tDwSyLp2EWalS3nmjKSjmfX9yAdWDjwmBRXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=LeUaMpsB3MwD5JvuSZqiAzIGvrjL7yES8T/IcqTqlXuYC2OvDm/JjQRRIBhxas+ZFbA+UieNbb8ra4GrYrtX5BtswLvAgy7EPzVifGF+A7KHZQr+CFIWSjMC0wur7XxyokbwH6p9ZCXScga5mf14Pwj2zODTMdy0vTmX7RswqRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEql1828; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEql1828"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D5C1F000E9;
	Fri,  7 Aug 2026 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142404;
	bh=mUnQ0qWJd3Lt0+uaWo2zLUBo0UIruoxxAKFVtb7Vqw0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=HEql1828rxg2IafZe29rTUciRxh5yMLc08LrDV6YfSH2/g7zV2TSaLWpHz88xpJit
	 6GB4c8bfrQY6DA7TSF/xOSm+IvWnqhDFYNHKFhqbFflgwYnLzWllR+WqBngEScaPhu
	 9mPEVXZ+s1ruw/Gl5Mm3cliYbWSTYflCFIP3pCHlqChnR9hCE6F0YGypQUsFAfyQsD
	 rNJQN5fgkE6Q47NsJb12Rs0Dw6IOIFv1w+WQ4OryIVPATNkH0D8XN3AvjmRyrvVmDB
	 PKHHHglPBfZoBJ8hf1TL53WeOs0hxQkKkUCTncaC3Xkiy7NdooFZjHJ6SCFuUfg/gu
	 UHKpliGnNDofg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Aug 2026 00:39:59 +0200
Message-Id: <DKJ2MYL3TYVB.3K1LIVYMLX0SV@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: <tj@kernel.org>, <jiangshanlai@gmail.com>, <aliceryhl@google.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>, <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 4/6] rust: workqueue: add creation of workqueues
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-5-dakr@kernel.org>
In-Reply-To: <20260807165252.3849875-5-dakr@kernel.org>

On Fri Aug 7, 2026 at 6:52 PM CEST, Danilo Krummrich wrote:
>   * new_power_efficient(): WQ_UNBOUND | WQ_POWER_EFFICIENT, add
>     .percpu(),

[...]

> +    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags_WQ=
_POWER_EFFICIENT,

I actually meant to add WQ_PERCPU, which should be the default for
WQ_POWER_EFFICIENT, in order to avoid the warning below.

But I somehow managed to fix it the wrong way around and made WQ_UNBOUND th=
e
default.

So, this should just be bindings::wq_flags_WQ_PERCPU |
bindings::wq_flags_WQ_POWER_EFFICIENT.

- Danilo

[    1.381581] workqueue: my-wq is using neither WQ_PERCPU or WQ_UNBOUND. S=
etting WQ_PERCPU.
[    1.382274] WARNING: kernel/workqueue.c:5852 at alloc_workqueue_va+0x794=
/0x800, CPU#0: kunit_try_catch/851
[    1.383088] Modules linked in:
[    1.383359] CPU: 0 UID: 0 PID: 851 Comm: kunit_try_catch Tainted: G     =
   W        N  7.2.0-rc1+ #67 PREEMPT(full)
[    1.384236] Tainted: [W]=3DWARN, [N]=3DTEST
[    1.384567] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Arch Linux 1.17.0-2-2 04/01/2014
[    1.385364] RIP: 0010:alloc_workqueue_va+0x79b/0x800
[    1.385784] Code: 49 8d 96 b8 00 00 00 b9 01 00 00 00 41 b8 00 08 00 00 =
e8 08 83 ef ff e9 88 f9 ff ff 48 8d 3d cc 1c e2 01 49 8d b6 b8 00 00 00 <67=
> 48 0f b9 3a 41 81 cc 00 01 00 00 e9 40 f9 ff ff 48 8d 3d bd 1c
[    1.387337] RSP: 0018:ffffc90000473d58 EFLAGS: 00010246
[    1.387779] RAX: 0000000000000000 RBX: ffff888102041600 RCX: 8313f7e158b=
49600
[    1.388382] RDX: ffff8881020416d8 RSI: ffff8881020416b8 RDI: ffffffff831=
2e020
[    1.388985] RBP: 0000000000000000 R08: 00000000ffffffff R09: 00000000fff=
fffff
[    1.389587] R10: ffff8881020416bd R11: 0000000000000000 R12: 00000000000=
00080
[    1.390192] R13: ffffffff82ad53fd R14: ffff888102041600 R15: ffffc900004=
73de0
[    1.390793] FS:  0000000000000000(0000) GS:ffff8881b81cf000(0000) knlGS:=
0000000000000000
[    1.391478] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.391968] CR2: ffff88813ffff000 CR3: 0000000002e22000 CR4: 00000000007=
50ef0
[    1.392568] PKRU: 55555554
[    1.392804] Call Trace:
[    1.393027]  <TASK>
[    1.393219]  alloc_workqueue_noprof+0x5b/0x80
[    1.393594]  rust_doctest_kernel_workqueue_builder_rs_12+0x3a/0x1f0
[    1.394129]  ? _task_rq_lock+0x55/0x150
[    1.394462]  ? call_rcu+0xec/0x270
[    1.394756]  ? kvm_clock_get_cycles+0x18/0x40
[    1.395136]  ? ktime_get_ts64+0x6d/0x170
[    1.395477]  kunit_try_run_case+0x93/0x190
[    1.395826]  kunit_generic_run_threadfn_adapter+0x22/0x40
[    1.396290]  ? kunit_try_catch_run+0x210/0x210
[    1.396670]  kthread+0xfb/0x120
[    1.396942]  ? kthread_blkcg+0x40/0x40
[    1.397270]  ret_from_fork+0xee/0x260
[    1.397590]  ? kthread_blkcg+0x40/0x40
[    1.397910]  ret_from_fork_asm+0x11/0x20
[    1.398255]  </TASK>
[    1.398453] ---[ end trace 0000000000000000 ]---
