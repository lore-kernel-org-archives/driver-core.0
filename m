Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF92E717B
	for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248155; cv=none; b=R7MI8gjl2/3B0W5OZNoBA/ME9LrYIhxm3ompuZG64YmuyWar/2hVzycmZzCcacgFTJEAMey6Da3+zuqfHWrNLFXNxH7jmW6T2AQcik4mOYmgtqWgLYFmcTAJzE8CZF3AbckBtt9k+o+GYK2pvAVgREtBggIjj1Rhlkz3RYC/Qr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248155; c=relaxed/simple;
	bh=V5PyQQvgVLRArBUaO0H6XDypFxZ4oZWPK4ihpQOsK/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I9br+o9meNcCOeH/EYxAeHF8W67ti0OijtRBUCLrT7LWA06/Ys/F092RficLa/tdv6asyfh5yGutQsyC6bszujApSDT9Ro5Dyds974261spsnZgwgIyEGyyP2XicT+D5dx8w+4Wm5vn0X2IlqPRVciB4i6tAk/CDlJx5KTo9Juc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QCUZM5qv; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QCUZM5qv"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-435ab907109so2142207f8f.3
        for <driver-core@lists.linux.dev>; Mon, 16 Feb 2026 05:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771248152; x=1771852952; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElKyrfCE+7loQXJG3oD3y1xXHkPN8AgZyfzmDqci610=;
        b=QCUZM5qvf2TFdkM1GihxU1KpvaNwimxUBtEzIUmQiEwJ4mr0xcpqSbnFGs2A+MMYtE
         Q+4DHX6p/0Xq3SXd/r598jlCfyw9L21r+f6qOwSwI01ykTaQeC4nw8JtlBzYy4fU9pMv
         jT3pCpT2F/k/G4DqpX4r/FHvLYij4CM+gwscLELu6RIocejhwQobV1tZRr6VN2fKykCc
         nJ06/2vO4PY5grAn/U4tIGSnnOLoI8+PdZ9eHZ6XlEpJIHJpyYPaO05EthYMX6QeL40B
         5Iy/zgNvznIG4DM7y6METC7WOaJzYNEhfnU0QZGoeADP5n/zhCyRs165nHCmvHySb79B
         oytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248152; x=1771852952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElKyrfCE+7loQXJG3oD3y1xXHkPN8AgZyfzmDqci610=;
        b=ESnuJWIg0ue3fiP2j+eApFiFNEIYPlcL6R8zDfzNJ6dAL28myzfVh7G5y0syuwBdFn
         7UAy4S3Y35bnrmd4EFN8/bJAB/XbqXgfcLefxdnXyymKbqUtPAgCMNxMopDYBrGGJVwp
         +XIUBpIdQxW9Ou+rFFdtkqWGm13x2J+OTcYPQKxOTNnTR0A3BdoKQnAZzqhajg2sGmo7
         22lq3RUuF+AXIgBGhQP3VooaPo5zCJNywhVlOoIHazAhDtZISg07nw5y9iWLquJtv7SB
         Vj8Z9LF6jBUF6bEl3SopvNca5DZY2Wm6pKMSPG8oC8gqOYH3FGuIHeJPcDpRldxMQW1R
         +Udg==
X-Forwarded-Encrypted: i=1; AJvYcCUhr2RCp8SkcpW5YhUEE8oqUd0FUpWcorXi11KxYgwiqgHiMaEdqndZYk3KKqyu/Agx02XGl1hAB/NKBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY2rd+NcuCm/I/UgoMwp3qVOidTqNhRWxDsm4sQw5eNTCtzHRw
	pK1yDLrN5go3mVxauzm8/c++t3l2UdPfhyRDgx+kU7Kw2xuAZDXZgdXbhOHhK7cebCQBisV+lyi
	Z5EFMjv/OHHtYd8N13A==
X-Received: from wrbeh10.prod.google.com ([2002:a05:6000:410a:b0:42f:b6ec:c515])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310c:b0:437:70d3:44ec with SMTP id ffacd0b85a97d-437979189c5mr17087369f8f.43.1771248151307;
 Mon, 16 Feb 2026 05:22:31 -0800 (PST)
Date: Mon, 16 Feb 2026 13:22:30 +0000
In-Reply-To: <20260216131534.65008-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260216131534.65008-1-dakr@kernel.org>
Message-ID: <aZMaFhvZWiknu8UK@google.com>
Subject: Re: [PATCH] rust: io: macro_export io_define_read!() and io_define_write!()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, bhelgaas@google.com, kwilczynski@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, zhiw@nvidia.com, acourbot@nvidia.com, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 02:14:33PM +0100, Danilo Krummrich wrote:
> Currently, the define_read!() and define_write!() I/O macros are crate
> public. The only user outside of the I/O module is PCI (for the
> configurations space I/O backend). Consequently, when CONFIG_PCI=n this
> causes a compile time warning [1].
> 
> In order to fix this, rename the macros to io_define_read!() and
> io_define_write!() and use #[macro_export] to export them.
> 
> This is better than making the crate public visibility conditional, as
> eventually subsystems will have their own crate.
> 
> Also, I/O backends are valid to be implemented by drivers as well. For
> instance, there are devices (such as GPUs) that run firmware which
> allows to program other devices only accessible through the primary
> device through indirect I/O.
> 
> Since the macros are now public, also add the corresponding
> documentation.
> 
> Fixes: 121d87b28e1d ("rust: io: separate generic I/O helpers from MMIO implementation")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/driver-core/CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com/ [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

> -pub(crate) use define_read;
> -pub(crate) use define_write;

You should keep these re-exports (as full `pub`) so that they can be
accessed from kernel::io. Exposing all macros from crate root via
#[macro_export] is legacy approach.

Alice
