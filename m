Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DD377ECE
	for <driver-core@lists.linux.dev>; Sat, 14 Mar 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773494683; cv=none; b=twzRog6zF94E87LoaPbHAJg2WgcDCAetVx/vPRzJD9evvYKzelC6JVawSQrc8Rx7iXqY3LYk8DbbgVxDP5kyFqEll5UmYzqDtRtG8tN22riUAQSzi7yRBfsZs1yh7mO2AUHb+/PnUG6gkV95Mv8JSuGYBFX8kFaW6fR9NcTlhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773494683; c=relaxed/simple;
	bh=pDh0iEx46jMmrLE1oovTz9VyKt8aN4TLMUcZAAJgaaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ltV5OpkRaWDyBURCKlChj5z05M7nPvgV4jeHQiGPB4vDJVGNcPYncOJd46LGdXcg6bGV5e6hDAAFIMdiMOYz7dHT1irijKSThF4aV6SqXGtZhjhWy5RY5fD4U4U/XCL/mK3d5n5g0TDSK3XBokbGKuwwOUUQ5v3MnoqVjs3Dp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLMbnv75; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLMbnv75"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439c54e0f6aso2559148f8f.0
        for <driver-core@lists.linux.dev>; Sat, 14 Mar 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773494679; x=1774099479; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HELqxrOQ/OwUFnReaSfuYgQk+nnNmP4iYE5u5YV1ltw=;
        b=tLMbnv75+ng+ScqsZRT+42U/U/GHQ+NAfMJqnmw8fjXhszpf3vs2wJEoUU+WIakHGz
         l9lT58+XFkih3ka9KfMV8mLig8Iqmc6sEjThO6pUcpTkEDIPhijajHFA/MW+KBWx1M49
         HqQF+sttLP3nQK2d8Tw+94pFwfvCK6VV5nB6MQ5JHDdFOIKqIaz60HLD3UJf/jVnuOq/
         VpmlyogQHz+Jispz/E9fjtf7RmtZK4B8DhaxoyA9g00oQIcv7tzVXzSAG70OhMc75Twj
         yy/AaK/6b8nTrqK5YKIGbGxdsk7MJSCgvQ/VNjs0Q7CfXe7euf1XqC8EpY2zA6EmQLmx
         oJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773494679; x=1774099479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HELqxrOQ/OwUFnReaSfuYgQk+nnNmP4iYE5u5YV1ltw=;
        b=IWsZjG7PwM60zYJGlrFsaksSviXimrMKEbQ+YWN5ZtlmLPoiOBKanOpf2YCgLZO5oN
         ipNfh/KFfMjpmbaW0N8w683ORZCSknIvfYNrxthxx6aHilWFTau6Ol9Kdf40fBWsy1EU
         wfp0UBcXOYmPgNx5wizsLudFrSDmYeRute16u5GoLt3nTibS5CfrejvdGOfuQhO1Z5zK
         kX/oG3qchwM7aba9Vk+577IFGtOuv5gvgGuJOZDBmqQqVtzXWBmDKsqnMLtHjDjvMsbr
         jCQo8wCB0P3QB7yleRHRmxsQOjJw6/vZrrIrQ4gMmi7uAQ8eH+R8hk5gsTC0OdQw4kUG
         DUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUYPOw2nrVghj+nLRbblQ5jq5v8Hhlhc7Ymz2i9dHTI05sGX5Ds/wYLUU2SLlMua3/K7zq/Btb395wFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDTotJo6YncBwJAeW9pbnG4zMWpRcGHcjBpq+g3GpcXk5tDTWW
	CPHVpmEg0JqXzaWTwj1Pb4MmPrCEkHctHvoOSMoeYbcFz+ahHipx0nTYVbD6XRRnXuE513iH2TI
	Xkw5yZArN9zzjXLFR5w==
X-Received: from wrxk10.prod.google.com ([2002:a05:6000:4a:b0:439:d5c0:336d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64a2:0:b0:43a:4e0:1774 with SMTP id ffacd0b85a97d-43a04e01813mr8786099f8f.16.1773494678748;
 Sat, 14 Mar 2026 06:24:38 -0700 (PDT)
Date: Sat, 14 Mar 2026 13:24:37 +0000
In-Reply-To: <fa25ed4ff4688a40bd601d695804def772e47af9.camel@posteo.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260313-rust_serdev-v3-0-c9a3af214f7f@posteo.de>
 <20260313-rust_serdev-v3-2-c9a3af214f7f@posteo.de> <2026031402-absence-graph-af5d@gregkh>
 <a9618d034bd48ec21bd26060573770a548619402.camel@posteo.de>
 <2026031422-shaded-matchbook-5078@gregkh> <fa25ed4ff4688a40bd601d695804def772e47af9.camel@posteo.de>
Message-ID: <abVhlQ91AMViBsPu@google.com>
Subject: Re: [PATCH v3 2/4] serdev: add rust private data to serdev_device
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kari Argillander <kari.argillander@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Boqun Feng <boqun@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 14, 2026 at 12:08:09PM +0000, Markus Probst wrote:
> On Sat, 2026-03-14 at 12:52 +0100, Greg Kroah-Hartman wrote:
> > On Sat, Mar 14, 2026 at 11:42:02AM +0000, Markus Probst wrote:
> > > On Sat, 2026-03-14 at 09:07 +0100, Greg Kroah-Hartman wrote:
> > > > On Fri, Mar 13, 2026 at 06:12:31PM +0000, Markus Probst wrote:
> > > > > Add rust private data to `struct serdev_device`, as it is required by the
> > > > > rust abstraction added in the following commit
> > > > > (rust: add basic serial device bus abstractions).
> > > > 
> > > > why is rust "special" here?  What's wrong with the existing private
> > > > pointer in this structure?  Why must we add another one?
> > > Because in rust, the device drvdata will be set after probe has run. In
> > > serdev, once the device has been opened, it can receive data. It must
> > > be opened either inside probe or before probe, because it can only be
> > > configured (baudrate, flow control etc.) and data written to after it
> > > has been opened. Because it can receive data before drvdata has been
> > > set yet, we need to ensure it waits on data receival for the probe to
> > > be finished. Otherwise this would be a null pointer dereference. To do
> > > this, we need to store a `Completion` for it to wait and a `bool` in
> > > case the probe exits with an error. We cannot store this data in the
> > > device drvdata, because this is where the drivers drvdata goes. We also
> > > cannot create a wrapper of the drivers drvdata, because
> > > `Device::drvdata::<T>()` would always fail in that case. That is why we
> > > need a "rust_private_data" for this abstraction to store the
> > > `Completion` and `bool`.
> > 
> > So why is this any different from any other bus type?  I don't see the
> > "uniqueness" here that has not required this to happen for PCI or USB or
> > anything else.
> > 
> > What am I missing?
> In Short:
> In serdev, we have to handle incoming device data (serdev calls on a
> function pointer we provide in advance), even in the case that the
> driver hasn't completed probe yet.

Why can the function pointers be called during probe?

Alice
