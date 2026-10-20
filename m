Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483973;
	b=wyOae/AtUuuYHuit8VOyZKv3VrN7SwQcgQzBkPSTBILUwbnwbyGM/bHnfOGVbfqTHE75
	 20+8k2IvsX1VJt8/7aPp0h06/r9XA2UbC1LSmpf2fHGqihyt90sVfe6P5X470M2MlWsIT
	 YhNWibkSpVlii5He4+03qxddIUmYcutmxyI823QDt0/UfxUrqTcpXUI6iGLTlwS9Vs8GQ
	 1y6bld2K3xP21HsdHp6J+Zp4oA+35+q9i13txUtj+mBh0isWFhpT4fAUGT4n0rqzYjB67
	 R2tlxQb/AeIg7okLUR6F8Fuwcb5fTdhPvg6dtOJ2NTEgZYVCwzGqPyXhsbvUOsVHzdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
	b=fHP4EG10HkOA7GgN47OkOVDRGrpRuvZ0FPYtNhxF5gTtusonIlB/FO1mVR2mfKrlJ99Y
	 ferK5pjI+0JkBnswYPu2huiFgaHEUMI/YVLyRZ/H9G81FN+AM4TzcRQk7FCr/d6j+Nhwc
	 YA4Q8boRjR+TvI0ZPavfXZvIfVgD8Bw+XpAzApqrsx0NpLk73hOpsP+JU2QHLzJfyT+s5
	 r8CNclOBgQYTvNTGgIMonn531EgZRWShC9pQWN4V4cv6ncgjjhJ4ZWkxX1aHeBIQQ45aP
	 F4dVXflCFT/BPxgH2Dpc8aP7lzrCRRa1v0D2S2b9lxg8zRww6llL9KbBLYl/1KGcx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I0gdDQtl;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46686606A327
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46686606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I0gdDQtl
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b1a56fd429so3497337a12.3
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483972; x=1793088772; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=I0gdDQtlSEvth1ecpeYGigDnLJRtDENpvzwXhlnbD/qBCAezkJhUDRJwGdbPIyPioD
         uOpWfKsFWMWimQkn7DrgASKDaO+LnFJQErAL0TGV0YO0F+OWJIshGFUtOTrsUpM4FrIZ
         aCvEMkowrIuVfvk8tyO3oHXkT/McWrB+s2itQp85e28TsuRwqJk7ZrPX+q1tppKaEWQ3
         8BxF7RU0n4N9Uz/if5U1sg2z/ZDfbg8kT0o7JyAzieidnNL5LV4/x4sYgcr4DPjz3BPf
         1wk5QxnArxk5/9Q7DqR4L1cNzxg4jjYj5QYBk0hgqn5CdLVhUopChyYo1zMo+aqVWPjw
         tXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483972; x=1793088772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=YISF8rIuo54EBOYMLGltK+ce31nHxePW5l1gydUvu4lqPNK7GspydTGYBIzbgtilov
         yWgOKWIHOL3KhuzScbcAb7nszhCL2KubwG1zCGPg0lQ+AQLfyvwsUkpgGMjEBOOj603x
         jMJzmAs3bb+X2jQO3DHGIgogTiwqes7OrY5eYCwlmlJmaVIzdb38UOvjjxc53020ghHz
         F8ytWs1qeZEUNJ+rCFECb9EG07KXIuSdTuV+O+Urd+hg+6qLN+WMWs5K12j3qyfyZpR4
         F7HXthRYxbNFGWfB1bmywNQk75PemyUFa1z8Gw8jovFJC8POZ0SEpwM0JuJ/0f7kaO8X
         Rcew==
X-Forwarded-Encrypted: i=1; AKwUvBzL8owOBNFkhWh0NHSK8V/mMupuk7sgIHnpISrrHynx79gtKrcS/L2KUkZqYmmLhLsd1ZevjSKEXWvodA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0StEJBez0CHLtHUWNO+3uBQKrQQq3T/OoI+HID+bTtr8l1PCr
	pd1f8CX8BYoYGITH/e7XYsrwpQ5FZUD+FOnef/c26VLd6hlNvnQJxzTcF4TQq/r2AlzPAECDnhq
	y4aR0bLeJAp4209PiNQ==
X-Received: from edwg15.prod.google.com ([2002:a05:6402:114f:b0:6ac:c84f:3304])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51d4:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b3a816fac9mr6710522a12.16.1792483971098;
 Tue, 20 Oct 2026 01:12:51 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:47 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081248.1761160-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:38PM +0000, Sami Tolvanen wrote:
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
> 
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
