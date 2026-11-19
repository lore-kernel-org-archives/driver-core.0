Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101441;
	b=E1dv5lde0wM94rwXpNxkWynoV4M72iLQEd3lRFJz2kcNPeAEavUFp/iiD2HHMtugQ0Li
	 NPHxZH1ytFt+6G2hmzrlKhK36VGCzZmRUUN+RDzzFLsz73ltEzzKlL1TXAUWhOfHg/S78
	 pmduLrB8X6uwulVgnKPsGYNbeZ+cb9E58etoac+aIEaw+FVjFEI6qMdX6GKim8aReSgNN
	 51HlfHw8Hj/3rvhqHVXEyz2gIfl5BNmNFL8F3dqugBd+K4JhgW7cq96/e/x3ihRSygJ1c
	 VTSvxw1W0Ln1wKFzySoZFm+0enn2rimOutIX3iAuUiRm/veoEuCvDS+gclqF/gtkjcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
	b=IoifUexEJNucQlc3IJL8FvBf1yp+FvMg/hOUVaYWdjHKiCcII5icEuZU7IO6MZHrf1iN
	 rvEo1eGeO1QZx30I1LHIfTqEjvDsPhUgjpRzKUv5PZ7aM0xYQNJvd6fTaQbkWFRi9YcBY
	 xd66vqlajohF6vf2PhJSj68AqCBKELzq+56aP1eHtkIqeMRLPlFI8XwTsk0XDMWW5/9gS
	 WPjCb7CBEPWoFviRWBZd8vXvtHmkqTLZOhtaDVDc2/v4tvDIdHs0PEMjZ+ZrKj0Fr46mH
	 IEGEYfMkSoTNJ5trlocf4xBPxWXxtgvqtT0ZCiG7hjk84Sc85zupFfkmFdJMX6ynA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dx0o8wVh;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664D60A2605
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 15:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2664D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dx0o8wVh
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso21001045e9.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 07:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795101439; x=1795706239; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
        b=dx0o8wVhEqpOpwJPZVM4PScSthhlUcy0J/p4JbJvhyV2Igka+Z6q/OiCJDcE2P+x4F
         Dhl8ckZVcaaUYPKEFfz+OrQlm/Cut90n43VRPzMauaqiPJR/IO8myVD+v6DPyed9K22E
         fmD06ejCi38CSM2w9uo7YN/9m1LCKanytMSuXFjpiyXWGN4ho5odGJg8tWUfnJeDZw5X
         b8tpMOrc7IMQVlL0sJpnuPvWoaicOMykRPjNoMIZL1w9eacgQIaf/oeYjif29p2YAqjW
         anr3w0SWuFTFYN6x33K88IWg7kzh7AZd1JFZN9wtyEwP604QsGbscLCeoYV3QsBhA0Vb
         qwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101439; x=1795706239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
        b=ZpwviqDsi6mdPu74EjtF7JcMMdLU3s9BMybv4dTM8f7XifxGAudEAMu0eoOtAaJdCI
         XiNHULaaoMtsqeMdxx9NxrqsqixiO7yhyLJsEYH7eEoM9M3kU2T/pibdk9xNtkLIw8fU
         qmNagmY9A5MaTngZo5sDhkdTZJJRO+FXKzvQnUtSKqvjxMSeeaA8CmTqNXjNm6WDuNev
         RCn+JkO+iR09KATxvwZHVl1v6p+T7N0HfS0eiQ96KlMOJmcFE/i402r4t9TCZOVf10do
         ljve5WzrhiG0vgxUfbR7G4yUR34BtcEanoKgk15wdjtyBNM8Se8O0iQi8fXzgyl/Uc90
         Inpg==
X-Forwarded-Encrypted: i=1; AL+hErF6Z1bHiJeEXxzAfL3/dnk4jz+hglw3JVFqUvtw9KLlQokHtb+PTGfxYNJ2vy7z4cCtpX6fq0tVKi9Tmw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bBAN6fWN1g0rE7wAuBhpmdpCNUGwoL1B6wUbGMSZzdlvDWOHE
	zWVIY9NF8yCDbOSr0PjCD4+4MAB3OA+Ka8EH3LddfIqIAExsXgcjtzdgWtGtZnl30F8E/D6M2gf
	6JhE1Bq0qZRquxhOxEw==
X-Received: from wmix24-n2.prod.google.com ([2002:a05:600c:e558:20b0:4bb:5200:da9e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecf:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb7da391b7mr128329965e9.25.1795101438587;
 Thu, 19 Nov 2026 07:17:18 -0800 (PST)
Date: Thu, 19 Nov 2026 15:17:17 +0000
In-Reply-To: <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-1-707c68994940@google.com> <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119151717.682282-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/5] rust: workqueue: support stack-allocated work items
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:37:17PM +0000, Gary Guo wrote:
> On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> >  __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
> >  						  work_func_t func,
> > -						  bool onstack,
> >  						  const char *name,
> >  						  struct lock_class_key *key)
> >  {
> > -	__init_work(work, onstack);
> > +	__init_work(work, object_is_on_stack(work));
> 
> Is this fully optimized out if !CONFIG_DEBUG_OBJECTS_WORK?

Yes, on normal architectures (checked x86_64 and arm64 with Clang and
GCC): `get_current()` omits `volatile` and `current->stack` is a plain
load, so DCE removes all of `object_is_on_stack(work)` once the empty
`__init_work()` stub is inlined.

The one exception is `ARCH=um` with `CONFIG_SMP=y`, where `get_current()`
calls an external `uml_curr_cpu()` function without `__attribute_const__`
(and under `CONFIG_RUST_INLINE_HELPERS`, the dead `mrs`/`movq %gs:...`
inline asm stays in `helpers.bc` until backend codegen drops it). I can
wrap it in `if (IS_ENABLED(CONFIG_DEBUG_OBJECTS_WORK))` if I send a v5.

Alice
