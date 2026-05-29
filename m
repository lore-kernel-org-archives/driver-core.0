Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE68421F14
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079954; cv=pass; b=DzB94PyJCY5LRbneZ+f6hO4EKNJsNDFGaitSYBiC82gY2n/YtG2k1NBJ6eYe0kgg7ZsNBnBUbH/lI8EycyIDphbvRQRaPVMoll0891oN8XTJ/dauO9jbvVVpSto2P7s3nB7izQMlCbJ2A/ddvUn/9XWWrk52xwT6JjTke8z5oTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079954; c=relaxed/simple;
	bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3wSx60Z3qGe9DbhO4PNZnJqV73JULgqI168vY1LwjkKNxTfWFoghxr0ULT/MWDQ4w4eygZsM4hsK6n1PR27XdfX/agfbPQUn+yJh4r5LlTA2Iq+s/X/MhWj4LnuZoTSsLzEFwfMQPaSqbK4lnB2a0Pso0atHdsDBUWlXQFur1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/EDQ72X; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/EDQ72X"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d774f16ffso3079066eaf.3
        for <driver-core@lists.linux.dev>; Fri, 29 May 2026 11:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780079952; cv=none;
        d=google.com; s=arc-20240605;
        b=dRuT5ZJ4eTLp18vylNt0Abq5SoZBMUnZUJ6nz7FpNr9qzr81mVxuqNBsIWsL9SukUu
         VRsz+1U9WkLYEuUUQq9c4zo0qdcDemlJtNVXD629JN9CZhAi0H6O3BeA1x5c1ZNtD5Mx
         3SNVJYJo2CAgirV5MRZFoLALuz+XET5/V5zVdn8rjTBoj+trOca2cNzqekrFt/yOXQQv
         q/dgHYnztB7eSehiWYX5x5/SmPj57wsDDzOLlPstce4tGWF4E0vTzOSnMkcnrHImpuuS
         cGDB7bguuFf+aXCG1X3pb0phvvgQe1iLG/BbmVF0/usVfDGD1UMJDmUJQTTMZW+36FuU
         h40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        fh=H1QMnxk0qcxcos1lWXDaXU5axmu+91SP1GKCKDrxIls=;
        b=hX6sPu3ZuJyItjIpeSqVieyYNzNoXZxZiz5iuSpeMo79ctLEaml5czMRcFWgi2pfNC
         X6kBcrt+9rN1aX6aiazt9LWV+F60Tb8Jvre6W6N0ANraScJYFVPB4B2iYkExOxGjhsvB
         0q1i9PpzCLD3nDqwTOVxr00mQG1gkK+HfeBtO5DPF+tsDIVLX3cV4hD89DLMbaVB7+vE
         J7rx+KmrzhNOSxdxFsmpANKKT74zA7n4JddGxkT/SIsgz0PBj7VuRhuiEu53Ixg+ztvU
         aYBoi3plapGAzJ5fF6VzTo2tOeUlpKV3Ui+vWDf7kLi0xCZdpSCwjjf4JE6SWAxESvuE
         YgBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780079952; x=1780684752; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        b=S/EDQ72X9mKyurOmWdUpk9XR692Aez0ujnTP97OSBcv2T8mFFOzD6CQSRl1Up9vbVy
         5/90VzZv9kqWjGyR2eE5ErDTlKa1tg6xZYYkBpGyxp1OXbewy1ns7rQw99Kvw4sRG/dD
         vTSoPY1VXeHbQ07gu70OCZcRZ2JtpONZn8wII++Urgg/akzjNJrSeRWeoNAzqzBCWhG4
         BKvW++xgkdd7uFiRMm2lVr9cY76mp859iSTLwMPd86JEjqkEEJS71pepkCgnnhuFHzWU
         jO02AP4EhWwsonoosBmtr+DlUs2OQzNCTkAE19LNELHCnSwbw9G9EIybciDHQsbmj6HH
         P1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780079952; x=1780684752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOptw0SdnAY9JdG/R/m5cCm1GGdgpLow29Z0uYOHuHw=;
        b=jcDNv24x846JBh5YeUuTDH8NLV/hIs5AAF4zOEY+z5i5G/XRGAh/RxZhAh7aZFv2ph
         UlXZq/zGxreniQIR+P8eX7GwXIkFKKDKVi4OUAmiQp4hz7dTCH5Zl3FRafksxhumuGRI
         TgA0iTn5M2eUSq/LEe5YtYfhQ71lxAtjYCOuM213Gt731jnH9UKjP2E0UiSzxgSw/VOu
         zKZVHhHrzh3TzkMzZiR1Oq+RDHDaRUDPQpmCuOXNVS+dCgCebMWZ8PGiG/Z3xzCFh2mO
         yeFMktlzEOW0m9s5llwhny02hBRgckr0zdALaUure3Pd5GFRHcKnqS1mahmRdifVNuU/
         pIaA==
X-Forwarded-Encrypted: i=1; AFNElJ+q3YuYfelgqaXQa9g3HKaI7kFUu5YqU8i7BnepKnkJTnuzIqqdIoeWcCeYkmx3ja7bp13frsBsLtaXtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHg+xDbNbfS3pJ9C9KtZUdT+R6ZgUJHBnjITUMtkj1V44ZBoUt
	FsKVXAN0rhjdHwS6D4wMtyXnVCE531Rc+LmKdikQsh0yUyzCn+iPuVDKKyXiSDBG2RUiJZgYoM6
	PRorlY4UTZiefCw/NjEzmClZZruVRA/E=
X-Gm-Gg: Acq92OHu6SF/YQ6dUm8pTyBz62rYUXreUdTdpnoLudJnuW1BGefEfsq/bS+YAz/aZVX
	1yCcZX6I9whHnDbCOqS26BannxNutBcTIaDcEzYz8DcFG4Kqxxb4OmrfhUF+GZzsh7yB2UPU+Oq
	xoyr02C9wrhXybXcIAvRLkTSVsBITGONSFt90xdLEGSooxOZSWHRAkpK/y/BBqeNLOYsAEdKwFa
	oMpAOSt2OvlEtpLUrgLjBxbW9R7W2S72vUotK1o1bZz1MM6AT21t78xmdq5KssN/pgGy2QosTIX
	fcqDgoFcyC4nXZ5k3u7zCfb7wAP6qnBzkOA+Vweg4x6MMysSYow=
X-Received: by 2002:a05:6820:138b:b0:69d:ee54:babb with SMTP id
 006d021491bc7-69e103ca290mr283652eaf.46.1780079952121; Fri, 29 May 2026
 11:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
 <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
 <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com> <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
In-Reply-To: <CAJ-ks9mzqO3cOwEMCYb53C=CxiAD-Jfq=o9Et4XcFii7v2zW9A@mail.gmail.com>
From: Matthew Maurer <matthew.r.maurer@gmail.com>
Date: Fri, 29 May 2026 11:39:00 -0700
X-Gm-Features: AVHnY4Kv5gnqWuRInUrrkAfi_PifvFJvoGmR1cT7xJSJb1knvtlkvtn5ZxIRATQ
Message-ID: <CAM22NNB5EFDOFWe=_WftgkzcmXQAWRUHKYDcuDZPagWt6_y61w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: debugfs: avoid transmuting FileOps
To: Tamir Duberstein <tamird@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> The approach I have currently is to use debugfs auxiliary data to retain
> the actual callback references. `FileOps` becomes parameterized by both
> the backing data type and the auxiliary data type, and callback
> operations recover their callback value through `debugfs_get_aux()`.
>
> This is not API-neutral. Debugfs exposes one auxiliary pointer, so a
> read-write callback file needs one object containing both retained
> callback references. In the version I have now,
> `read_write_callback_file()` takes a `&'static ReadWriteCallbacks<F, W>`
> instead of two separate callback references. There are no in-tree users
> of that API, but it is still a visible change and may be the wrong
> tradeoff.
>
> Does this seem like a reasonable direction?
>
> Thanks,
> Tamir
>

My first choice would be to just add #[repr(C)], which I believe makes
it safe - having an instance of one of the various structs carries
proof that its callback existed as of creation time, and so the type
is inhabited. We could add an unsafe constructor to make that clearer
if it's not clear as-is. This is an invariant on object existence
(which can be managed dynamically) rather than type existence, which
must be managed statically.

If we want to move to using auxdata, we should move all the way to
auxdata - don't materialize zsts anymore, call the callbacks stored in
the auxdata. You can also convert to function pointers in this case,
because the only reason we were using `F: impl Fn()` was to leverage
the singleton, which shouldn't be necessary anymore, and should
simplify the code.
