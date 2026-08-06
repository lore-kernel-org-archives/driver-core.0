Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923963AEF45
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980497; cv=none; b=GD8vbL9efc6AZqpVQWWcPWOXooRPrFP0v5V0XcfzEj9dou7ERgzEDziynN4llY2Gbo8mCOlimApoVyg2AH6SRQDn8K7d5cnLZgxpXsMluDsSOxF+ACvpx0hB9mNo0YR0fTHiOBmeO5DfFHuvl0RvgpkiPpcC08G9fJDo0jI0QQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980497; c=relaxed/simple;
	bh=tV54au1v/xW/ayO1OMC/C9ql6LNkglkle02EIFwN4d4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fW8sWZ4DcCykz9eLgKGyui/32h/dyigSiDAV1mjO+SzG8Rhjn1VaXvAL6F/Fskjtqfculpumm7/wh0k7Kl1U2y8iyFMwSqmK59hRWeezNc7dPPC2567KSP1Omd7sZ6JSsZSkrTz4J0gUGZwke8tGfuC4i184Z5kOhFcU23/hEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRHy/Iiy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRHy/Iiy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso21051985ad.2
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980496; x=1786585296; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=14el0lPn9bSOGa65U42LXQG4cJK+qErrVwuU+N5k1CA=;
        b=KRHy/Iiy5ooFJd9C7TUwNyi69E+XUqqXG1X3enXRTN5UNqNsLNFiR+nerxLzK2o9D3
         VKTXA+kCnFdw/l/oNYDt1SxDCfFx51cE0r9rJECBFn5SPjCmsfkdnY2jIBpXp56pzytp
         ohy2cy5tQHZNsFfpqRlVQJQFYQwjJaIkHtgFJqe3VydNqh2BG44scKGdMCTTHrQzY6qa
         qncIpVEW/TlxNmJ+vKY/iL8vQS50ykDvIMux8EslnotQ9lQTTF5r0sgljzJ0xx1JX0lK
         ffHjTQh9R/OFiBerEaztcotJhX2n7cTVStAOBtBQatomn3LRva+YOI5Gp62ejEyC8wGi
         Vypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980496; x=1786585296;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14el0lPn9bSOGa65U42LXQG4cJK+qErrVwuU+N5k1CA=;
        b=FY2lPLXt1U9M6TU0MbAROKx1I4N8KLkOvaKA7SDT2Ab1Pd8ug7cH32kmYs+tWUUGq9
         8m1qORMG27HNZXlGSskLslmMrn/Ja18Bic0xc4uTXBDtRBFUyAvNzzIxFfbIQlMTOdDZ
         taxmyN3WZPCFRbjyGjuFdJpVCtq8yEURVXPeGoPQWmcX9f80GqWGYyahNJLZHYvocpXY
         OUpTJs6ch53TLt+3cmZu0nKMluqsNXJaRQtVDYhLgR3ZcZ+Ha8I9Spl9tLOwh+LjkWpD
         PwahjopCIf+J121csQaQ6SJrLWSQtIdqWZednN4tVdBo/wz89KVEiwlYHiU7M3y6ps3G
         RtwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/lhYd4sAswDZJH1Tmn4uzYkel5VGTz1xT2s9nD8vcIuaA6aSx7U6qIBO/96CYiSG5HsJLJbDGlU3gww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm7m4jvxqw50etnt74Puzb0NargJm0DsVAJXjPsrXVTf5TfMyF
	5OV689J4+6Nc7GO3iRlk4a9QcfKbPUtMnHAliiVrTrEHh2K9UU5/uZzy
X-Gm-Gg: AR+sD10rAqDohOYz96dv+0tvNqhY7441VKeT8gp6ucVrWUMrj8Ygxy4P1vgrQlz6Ds+
	KFGIFHJSLOAsT0iJa/FaRcG1O87K7p3Mt631R9jpciugIHaiZm+kukqTc4/7rkORPrqOE/NemA3
	emUzLh6SHIrNnMEcU9+MDYepwsQMCdT918LrpNFwZYPqkexnkmgnQV8MJZy/O3aTqHwFtXugHGq
	9FRj5erXr4hbn7/J6shMz7S9og3GgSp3rZUD+w4T3FDW6Au38yT/6BSeGiqwxKdFJWlFVnV4z4u
	f2ChuzuDfN6mDUZTuTW2svSQQI8c9s47MQUFvFKRvtTcMza79Dbgf5NDblLx0CzX0AdlqBoi/xP
	2OzsvvHQyegEsfTCm3+iaDGT2xWqghKoaQwK99sv6uPCr/bNAXKwAbpCngZvhOGqZY0FA42Cj5o
	5VBNONF7Mw4j04X7FKzIv9H73nOzk4Pp3fW/kCsZz+d8ZYKk9Mr/SLEyNyFM+dfcF55NotDFD/s
	9RwDK+Yk7VAVrIlIvfSgt9U
X-Received: by 2002:a17:903:1746:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d0ca761e0amr127202115ad.11.1785980495796;
        Wed, 05 Aug 2026 18:41:35 -0700 (PDT)
Received: from localhost (S0106c4509ca6eb5e.vc.shawcable.net. [24.80.190.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d68easm22473625ad.68.2026.08.05.18.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rust: io: Add a BigEndianMmio wrapper
From: Ethan Plant <plant.ethan@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, 
 Michael Garofalo <officialTechflashYT@gmail.com>, 
 Ash Logan <ash@heyquark.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Sasha Finkelstein <k@chaosmail.tech>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20260805222110.2949369-1-linkmauve@linkmauve.fr>
References: <20260805222110.2949369-1-linkmauve@linkmauve.fr>
Date: Wed, 05 Aug 2026 18:41:31 -0700
Message-Id: <178598049138.1212746.2443151507074972963.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=plant.ethan@gmail.com;
 h=from:subject:message-id; bh=tV54au1v/xW/ayO1OMC/C9ql6LNkglkle02EIFwN4d4=;
 b=owGbwMvMwCXmcODvRtktquaMp9WSGLKKn/ld+Me/c1Kaq8vTwqRzT7L2z81SmHlWwMCP3fvRD
 J5K1X1/O0pZGMS4GGTFFFlCv0zdvzX5jMeSt1JMMHNYmUCGMHBxCsBEdnxmZLh7/8AuxZY3H07X
 sGZUGd2/16fQ42SrEnzT3bHl8qyAHbsY/mdbczj2XJC9tMwn7lSPfOTvxYH/f121m9pq7XL+5X1
 pEV4A
X-Developer-Key: i=plant.ethan@gmail.com; a=openpgp;
 fpr=55F495BFB563CC48A4ED1A0240C0FDB11DB42537

On Thu, 06 Aug 2026 00:21:09 +0200, Link Mauve <linkmauve@linkmauve.fr> wrote:
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a38c20ba3d23e..a91979e4392ab 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -1751,3 +1751,87 @@ macro_rules! io_write {
> [ ... skip 17 lines ... ]
> +        *self
> +    }
> +}
> +
> +/// I/O Backend for memory-mapped I/O, with relaxed access semantics.
> +pub struct BigEndianMmioBackend;

I don't think this backend has relaxed access semantics; this looks like
it may have been left over from `RelaxedMmio`.

Perhaps:

    /// I/O backend for memory-mapped I/O using big-endian accessors.

-- 
Ethan Plant <plant.ethan@gmail.com>
