Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0033FE33
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823553; cv=pass; b=m5FWsxXUY2Rh3iRGNYjnZgW6rb98HC2AevafUGu7hhrGr/ledMdJeMMPdTbjassd32l49Mxp8b3S37H7yZSAtHXdR/6LeL1+2t0ufldZw+BSO0eak/AabWEPVon7UTWPY/0jQ0b9ecHRjQhj+LxKMeMCQzXCdAA/4rH1GQ3f4xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823553; c=relaxed/simple;
	bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/M2vxrlm2XDWRZvn9Ai/iF147xGtPW1S90XE889DcmhIrJ+hUzuTQnVi16o1gJ0Po0+/W2muN9GlG1M8fjiHR76inJ7ONx4DyGSWJcIqcNnfPL2c8YEHRbESEu+0eaDDj/BFvtxHIZEm4Vd95jNhOlH7+JwXxquuRHBjWROnhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WzxdR8V1; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WzxdR8V1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so14a12.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779823550; cv=none;
        d=google.com; s=arc-20240605;
        b=elkhNDT8QgZ6H+DnMvErUTm4c6YwoFPxgR5SZP3PGcM5/QEo2+tk+dGMDvjEg39MXL
         tcIx7kFkLMvxaxc/vRX40g0FTeFFrzUrfqVq4+3frum487vYqzeyfdg6fYkAjUiW0wLV
         CZtH1NTtfQp7GwE+Q6QchCEYCiMJDK3dTpjiHOV3Sd5CE5yV9zwAkotbWPzMWNQK6MUa
         zKbZhpDwb7WTTo5RRn/gvtqy0yG9ZVgZMUqUMM83x+u7dWfmxBmLe21gRqRJC2qfZi86
         x0dErn/Ei7YYxAARVxlXnAzkGSmbxmP1RhJFsbLVGZCOA01dLUjJuvAiBKnbPnidXNdU
         YUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        fh=Mo84HnYtbZ/JAF9ye5bfjWPtnYEmKeY3s3Ih5ySr7sA=;
        b=Mi8h33cEolUPuE7L6bFWLEDiSBz86gSVdEGmlsMk19ov9ng14wPM21/DZzo9ffwyp7
         fEHVAmEdpZwJARibbqkxw46POdHCfeQksVDsuhlFjf3USEYUys6lf9a1FPFxrCBhbPmW
         WSTY+hUHiLbEcQktejMNueDADf4vqRUlbOSSYiu0U7FEgj8brlF+pQm7SD//gfrlF1Vy
         VIck5+vNevrRerDRG+8mDQdA2aytntsDzG93oYAV8CSOEmDxSgvLBI7THM8aQM9ffOuQ
         e6JJ3jmAQep+pRBI9M4Mvy1joxyD7EIMUaiUKJiEyV8wneVujYPaXm7claTwcPC7rzwe
         THJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779823550; x=1780428350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        b=WzxdR8V1rXWVhAGxHleu6rIzg/RzKoyAa74U8iszy8rWPfCGfGwx3TOS+kDE/ubFAz
         t9aCKwcISyRmMSvTt0r/EnbA2lCKureRe2Ot76ytlOmyG/aKLL0G+ZtTZsZlefg7507v
         igqzA3w3ZwNWgSh8der7WEfU26NjWIaf/00YvPumZQdnQPRgyDpdvY226VeVjLseOhoI
         IsNtuMQfj+up6RMNGmZGuelh/UByLgYLFusD2uR7gMwXFXUwzIQst7gjS8tiTG3WTyYF
         7tRA2+QpPFprcfuW5dCB3v2rLHQqjM8gh4dquVXcTWig7a97HOLtkRQ5DcIzVTW2orxr
         OaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779823550; x=1780428350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        b=T5Umva1ACzbcokW4TKO6x8O2z8s5KxD/caTGwstWqM0zhccj8UlFy+hewbljTPFtMX
         w5uz4mbEP6mHrnNVlO3yf2YmPinuW74GnzQLkwoJYKglIwtpNjvxHKPcSogBJOhDPmai
         jFzT+rQgzSvOcy5fg2lSEo6POQE2wXOHwZMoJoS7Qg4/fBfiV6Kb9X6FbH/lkx98fKgh
         aKAkwah17fr3wSXdNjgYr/DNnMGzPnxHcwVUqpWUQjeO0OqT1dV07PcwQ7kMh3r9MTZ2
         rHur1tBy6WZOaPHlFVzxWh57/fBJnybOFc3GpZAzyocUqbBqfCOvExIGN8Nsv1TfX7EZ
         NTmw==
X-Forwarded-Encrypted: i=1; AFNElJ+aLL8JyHTQidZ6WckxZdWnGMmPu3xUswbMZqHiG6q2uJ+a8sDrHkSWW9hN7yv3BqciLUH4yxbhUM+EEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMGwO0jXiBX6L/s6rNxXl9KcBLPeC9Rw+Hf1L943Lsi8yq1NvK
	ujlo0DyKMNFZJH/iLLV4h0c0JhXxcBCNyoOrZMe3bRp6rH5b/9M+UC7pwAkbrlrGahvj5YZzZHV
	5LQkGm6Phbt1xBjUIpQuVSS++697wPMopklmsAoEF
X-Gm-Gg: Acq92OHBfApSd1tC/4io4w7QpNrfDDzq7Z8qogWgpC9vCasDv8TwbIZvobeZuwJGHUI
	Hs8kaox8x6MUQz1X68KUdHBvESDel1I7iqy1NURcBmSNiZH8aCc/Zz/ORQO33/THmfJkTYvOhrW
	sW5+dFGnqaKxZVj4Eg2M0CmiWie/hnmhmv5f6ha0ibV5Th9ikI0ILZk+6cq4EtW3NyNwdu7ugSu
	k4fs4BockwK+gbEscD3aA2eHHqWKYOnqw/WTy+a1elbrO1xt1zXhMu+0i4GeLmtWHcBn0F2hRCy
	jMW6I4zDMQaLO3x9CtgOyKz5J9L3qNG2kn6Re7EIubPGuPc=
X-Received: by 2002:a05:6402:100e:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-688fd13675cmr167387a12.6.1779823550128; Tue, 26 May 2026
 12:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org> <20260526-fileops-unsound-redesign-v2-1-6fc11066b530@kernel.org>
In-Reply-To: <20260526-fileops-unsound-redesign-v2-1-6fc11066b530@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 26 May 2026 12:25:38 -0700
X-Gm-Features: AVHnY4IhHqo-QIHmMGYE64ADcWVyuqDYaICY4BLwALM_hbHJIedaqLn8qLA4qAw
Message-ID: <CAGSQo03-QbcG4Rh=POdrgURmtDJDBMscwCowkKX-BZdAQUpQjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: debugfs: avoid borrowing seq_file in write
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:08=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Commit 40ecc49466c8 ("rust: debugfs: Add support for callback-based
> files") introduced `write()`, which creates a mutable Rust reference to
> the `seq_file` stored in `file->private_data`.
>
> File operation callbacks may execute concurrently for the same open
> file. Creating that reference assumes exclusive access to the
> `seq_file`, so overlapping calls can create aliased mutable references,
> which violates Rust aliasing rules [1].

Thanks, I inaccurately assumed that the DebugFS wrapper would
serialize file operations relative to each other.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
