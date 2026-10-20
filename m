Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483993;
	b=YIkggBg4lAqcyL7L2eBMPt0G/mV4GqMC4Jwgt7j9P7Y7m637yU21Tt9SD/d/+u3MgFgS
	 3zo3pa2ogVUMivV+HgobCqxkuvgHAhkwpkRGTAZ/KOY0GwOdfq8ofvObTwR2sgwCjGC3a
	 drxlMGqKVqq4qkrjE2oPFsGmWjF2cVMXMkT0V1gl0Khl0X8UBhtEvXK/zQJdErKhXOVhE
	 zaFs7HNphNVegQhSdruwZK7nBDTIKfaGZsaYcLf3fWUTtO/5UVUtOSmoYoyRjgYPs1VbL
	 mxs7xUHPLwX/RSjYHBLJoidJHtgfzvdUINaQEreb8lz2s/8Ckmm5XFqlEeC718hBz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
	b=S3Fe/gxKSq0vktMyYMdenRnWc/ZVambXdzW68/XVw2PJPBhjCo3CC0hQ52hNdMUdIzqR
	 zn3/mBACviHWyw5mwQNwCFWDIrquWd+Jj4RShMrC7UCB34sH0qUTknhXEbAnidWek6PR1
	 7mM9gB2jEteGF/pL2I8jMMwv+Mc0FtVaRZjnNJ9ndII3ErKJ18DSVIsLazKSMtzdy9B0V
	 I5+LSH8nZhQqfxIn96NCOB+qPJzh8VYHkn0pvCkPIden7pmU9QkxQIL7Clnrpjq3cV89x
	 lrcYq73Rrx84gnH94LYjZcRFXE5AioYJLKOIJ/rHEnJKMHfV1JKXU8KTRljelW0c0qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gPSZF8Wa;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370EC606A31C
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gPSZF8Wa
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1ab11f4a3so2578242a12.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483991; x=1793088791; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=gPSZF8WaCqB4LOsABKoInrKhO5bAIygaFuJ+Aq79TM4RBTa+jgee2jsnfsI6Q+7qav
         ZdlIjjyBok/L+EpmD4mVuszwz3ipe1IUlZLPSerlCkC72IP9U1To1x2gKh30iwJ6LBF5
         qMhdCw9rwV7pE8GUm2m6LT989KQqqTRdPixlbJ/fKQpCkcgmRyQWK6gUic2v5/VXyJ3F
         hAUmPorbzzM3XYMEk4ia6iJszyPl+wKaCPJvBnHTjA6oln8/chvaVxX/KbbqhijghIQz
         x1cL3NTd6u4UH7Xl1BFt+Fa9eMiUfhiTsgATxqJTvqHdyC1UP+zEtNKLFLRsTaqsNTKa
         LBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483991; x=1793088791;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=KbUFHbk+3aBT82WR905NEEMm+2juh8cQl3Xhxf0jdHhVHeyFmdG3n6cG/63Sy2W230
         4n75oOyt7ABDDlvwj/VxeCxMTP2eJInGtQW6DcSRvfnY6FYMxeNNFM97N8XA1pV0X0x3
         nIFPiZzUS2rgB5VAvuz8mLhK5Y8+5FjOSj7fFIvlpL3iohFBokR4BMp4+CT1yN2Ap0CP
         UHarkFGYzj+XraJtEqWcpmgUIqVJvt3pP0rrc34TMsyWoVDUl1OKskNIg3ZSRg6XE8XH
         8pXnp1hYEQTA551zE1D9SazKN8KaNz4woKTxxzxy8biZ8p73owtEz5e/5v9MaH1304Up
         c8kw==
X-Forwarded-Encrypted: i=1; AKwUvBwScNMA3r7K2Ebra73Cslff2SPuh6wpiTgZh2OcsqVxLbE6ODuEwJ+pk/qzSwp0IAwCJFd9b+EEA5h75A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIPdDf6C7hi9zs1m8OwYAPDUhd780JkB4ZsoOrWWT2U+N2NCR0m
	7rqSJr8kUB+TClzs5+pTOEIKCMceuMl6tj2zHnqzJ6F+ykKxJnbB6EE8sktap1e1iWkM+8chj07
	XweBW5xnaBxfSKf45MQ==
X-Received: from edt3.prod.google.com ([2002:a05:6402:4543:b0:6aa:ff76:b1f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d803:0:b0:6b1:e474:e0e2 with SMTP id 4fb4d7f45d1cf-6b3a81dea57mr4861388a12.43.1792483991214;
 Tue, 20 Oct 2026 01:13:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:13:06 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081308.1768290-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/3] rust: dma: declare cfi_encoding for dma_data_direction
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
	driver-core@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:39PM +0000, Sami Tolvanen wrote:
> bindgen generates bindings::dma_data_direction as an integer by default,
> while C callback tables such as dma_buf_ops declare the parameter as
> enum dma_data_direction. kCFI encodes enum types by name even with
> integer normalization, so the type ids would not match when C calls into
> a Rust callback taking bindings::dma_data_direction.
> 
> Generate dma_data_direction as a newtype with a cfi_encoding, as is done
> for lru_status, and convert DataDirection through the newtype's
> constants.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Perhaps also add:

Cc: stable@vger.kernel.org
Fixes: c2437c43cfb1 ("rust: dma: implement DataDirection")

so this gets tracked alongside patches 1 and 2 for `6.18.y` backports.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
