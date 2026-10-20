Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504915;
	b=P4CGBRk3OkW13Lz/x6l774lh7eiFHvafTA21fo/KR0oHx79jjRqoOmODd8HIeqLVUvur
	 jQunu+fzEzlX0/7m5yCy2KJ2E//kvG4bZJtUREkGus1mMpdP+fuO7d7ofd2YzdPV+9Yvu
	 yMQ3EL4zvlS8Im0hb3IV3q5fWVs5N+ATUTogl/NoxCrZRs7OrcRc/jScmjQTfS37xdFgo
	 QhUUBEqWqNmoIqcRSkhZTb9qNBBDs1SAKkslog3OZHBiGx8JGpy+GT4MoMezWc4S1ePm4
	 k3SlCAlf3xGh7m41x2Hprdh5Gf5oMcTvQMsHaZ11pa4s+cHNqwshFQQ51Qqlafh/+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
	b=oYmw5hoUcUGjn0I946J68CxhCAkZAD+RMmYCQ78VNg31diIGWjJDqr2vjDzeHGGm/bP+
	 8RpjIOjBHjdxHZzz8kfFiw3pPQq1zuehlZXhSgAI8uV/r6fRIIoa4RhL2ICjf3AsWUiG3
	 MrESZ/JDIK1lY3QTMEEafAiezAk0tguv4qJXAvF/ZQFkV+I8ZhZYhCZYR+S6YzktqE30F
	 UpMqQl+Pghw8/HLVWgh170yZeEOpc2TvkKkD4PEemTKiDFFLNgWaTqpnTbXgDYvnQceFh
	 wIJ/lBfUqrBxb9TharsX+4g8JrwIAqWEv/A0/NVG1N2Ob+91+sXES3FXuyZGX5nCzrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhcexnK8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181D606A319
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8181D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhcexnK8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so27706385e9.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504912; x=1793109712; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=EhcexnK8RpmUuU/AgdLxxa7/6yimjLukN8ZchMsoHIBzPRPUYuz7VvDKDihK8gsTFm
         Rf39T7bmwWfMob2TyMPv6XoTwrrH+YEnqy1lo0iLObdmQE/deL3NXyIy0+S2ilDi/5g2
         OrfYN34LqJCfGWHwa7hLG+wyWxaqwu93chaWloLy2xpUL/rYMWsUayJAdgTOcmFHl5E8
         ZNjKRLM5up+1v5qK2oGrIGDs9PKb0FK9agjVrh464LVWMVU1NPmg02vF3YZ71/b8+lwW
         9BghtTaL+r5p5WRTMPOPuu/8FavbkyNw6KuB2varu2qe8kT8fEUwRha6Ky2fz5uOqcw/
         N7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504912; x=1793109712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=nd1MpZsyMiZvQ79FapghMEsvpzVRGic1vVRQqaoESLTkTNfkUS608SMu1G78wE3NNG
         Sfx/MvnbGtg8tieF2QthRmwMrHxWLNRj8eYjI1IFJBq2Ke/sE3iswj3fcu7jvhJmh/FO
         F4BpZTmmQeXKRecl1yRfjzU+3L2xSCkDv+njeTbL7aosrByfWyPrf8qFGM3cs6HomF7k
         kwtBycFro1xt72z/np22Pu/vIFTuwlgyLygkh8rGY0B30LkWwE6zFO48PuCbtphS+mLJ
         jOSKvPoKARE09r2DSoPEaVZvlgENYJgmhKyoqMhhH3I7r1Pem0WXI6vrrMiyt+R7BSE2
         FgZg==
X-Forwarded-Encrypted: i=1; AKwUvByJQfP20m/sE0L6sCU7a8EDtagOnJF+pfzlqeKbG2zPau2Nf5gX+4Y90E+HVNuTXc2VgqMRrkESvUBQIw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKBG4NXBWK0ZK2w/JSTrdyoo0yeXDbRDnSKrHizSuyZDkvWdxMg
	xCMj+nmuKY5j7KL6h0sD+GZs9HxY4O0byi3C1slTFtUTDhvDDNNf5uaD
X-Gm-Gg: AYBFou3zhiRHTM3Uy7XB+ydEQy9bjm2BiFdbc6lAzDljUjpKn1rLYHOH6YUyQXTqllw
	K9FoXVTqVbMiZZ11wj2ikYp1ESBEO+pY8/KUp4E5WgRdfp9aOyv/tS6PmkeW57WB8GRALvhpKrM
	ql5RnjimrjG8BlJMwFVuGzRifsTN0TGyYfoHs+EzqoxGT/9aaziNpeGqiCOwHgGnYXcMtorbyaY
	3LqpJGUuB1RzicFBalGgm6zQNoeq4K+pnVkBByox/fU1mbH8tTrSqfa3capamkoYXFMCGUTLrrT
	qCbk+xOfpl5KHNSxPBmcNRZFQgpy7S450/vdS4ycQ7D+IA9oYfKl3ICMYqG2q3iDZWCDzLIEHOn
	MFHx/061CJfaLrw+1bmO5e4UqP2EMlXwDV0moblvnfm5OVAwfh3pdV7izSv9a8U6RPsc8N5OPcu
	pWVChiveKmYilBZFhNuEhPaqURULkqKjFxBazIn+4tW6fUUKoCWmBMygeaWkVhAvLxQ3kgCywvs
	B7QGbqr1jCsuu67JTBDnN7GHzLj4MsXy6e3/tuYkleZRkG2vk8wDQM3Tz8=
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr244362825e9.9.1792504911471;
        Tue, 20 Oct 2026 07:01:51 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm67581075e9.6.2026.10.20.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:01:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:01:46 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] rust: io: split IoCapable into IoReadable and
 IoWritable
Message-ID: <atd0SnEL1ZLXHxVU@C422HJQPQG-Fractile>
References: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
 <20261015-io-access-modes-v1-1-93611b84b5e3@collabora.com>
 <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>

On Tue, Oct 20, 2026 at 01:04:03PM +0100, Gary Guo wrote:
> On Thu Oct 15, 2026 at 1:39 PM BST, Daniel Almeida wrote:
> > `IoCapable<T>` provides both `io_read` and `io_write`, so a backend that
> > supports accesses of type `T` supports them in both directions, and every
> > (non-copy) `Io` method that reads or writes a value requires both. There
> > is no way to express a backend, or a view, that can only be read or only
> > be written.
> >
> > Thus, replace `IoCapable<T>` with an `IoReadable<T>` trait holding
> > `io_read` and an `IoWritable<T>` trait holding `io_write`, and implement
> > both for all existing backends. The non-copy `Io` methods that read a
> > value now require `IoReadable` and those that write one require
> > `IoWritable`. `update` and `try_update` read and then write, so they
> > require both.
> >
> > The copy methods use `IoCopyable` and are not changed here.
> >
> > No functional change intended. This prepares for read-only and write-only
> > views, added in a following patch.
> 
> I think by Rust convention these should be named `IoRead`/`IoWrite`, but we've
> aleady named this `IoCapable` and I further made the mistake of adding
> `IoCopyable`...
> 
> So I guess I'm not in a good position to ask for name change, but we should
> consider it. Apart from the name:

IMO the -able part is quite important. As a reader, seeing `IoRead`/`IoWrite`
doesn't tell me enough about what they actually mean on their own.

> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> Best,
> Gary
> 
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  rust/kernel/dma.rs    |  12 ++++--
> >  rust/kernel/io.rs     | 101 +++++++++++++++++++++++++++++---------------------
> >  rust/kernel/pci/io.rs |  10 +++--
> >  3 files changed, 75 insertions(+), 48 deletions(-)
> 
