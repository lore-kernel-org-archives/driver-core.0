Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483321;
	b=IVPdG0LGsRqyAi/F164H0zIIFE8a1P3LhOMP6vWT0GgLPDVJ9hGsa5M2UJkDp9qaA+1A
	 AV6oy0ymGTdMOkS1yzh13/kpCHqcVRsI5tJJDwRCsIi9Z5z27MIjCv7CZSc46pTwpG88P
	 P4TE8DiE0khAVfmWMMZ7XXO1O/oNUuoUExDLYE+Bfl3+5H7bUMEn+CIM8eAJvmQr/PmSu
	 NotReAB5a5CmCooC+x+Asn+Ng2i05dmzuQ28RywZnT9mQmdKOpcwwtZ6fafdj5lGv+dzV
	 HeZXlFjg9FErVoTI0hnne1lIk4FmF2ssq/l+3ZKFT3S1eNqTY2lN6JjYnqyg/q4SmuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
	b=C1umxUbLQvpNYgA3Y7QYKZ2eTj4meERaHHnqNUNKPB0XV+gf8Efe9EMlsAxcsh+T8fS2
	 bHcvPbJSZxHHh/zSq2QQ9gQ6Rnck8v4xnSIQyLnIeQhgFqtuM+vsU2QgGTrIXM7pFQO0r
	 9P6K9felNYQj3DTqim4ft8+N7cERTZv1S7WddHJdHDF5G/Bi790IXbwM5z+T6yvcRBjT0
	 kXXn6ZytFZhupwEadJuPIblrnp/nB2InOomXx2/qXXMac17BizgnNsZcSQZuIRXGWo5Xm
	 D78p3TPg4NDDHv5scqzilRpVYZUUVRajt3E/xrip9VmpISe1a+Z9a7V/F1lpZ+yUJLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Vp36eKlZ;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C1606A31E
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 08:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Vp36eKlZ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1d7c3b38eso23180325e9.2
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483319; x=1793088119; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
        b=Vp36eKlZqgNuN00fd3K8NIDSYtK0bJDn4Dtiy66kUakr5HU+g/BT8YpSxOybZkRkN0
         tJ8m0fLJeLjGmq8REVWa242Q6r7LZJZ58FbWr0wC6bQj6R4J9Gvy5MG+kSHNQU9o0R12
         kOpHuVdAMUh6+grKSLpPGNTd46L4HJvnxBuQV1FyeD9nVN9ReAC9SXjSUk8Q6CfuyOdY
         HB+p4ox2w/8CmVsqMZRx4lP5s4UCzp5BWH4x3TuPcTd7kxSmJBDiDr4GAU0JNs1yPO0C
         tqRNdGhSGEL50oYInVL4GEH0TzFPe71+JakyGzB0MoBNSYkKIBuGjZ6xDvEfHEKMjRfQ
         RMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483319; x=1793088119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5szgawaqFYahDoR6WgawlMOYcIGKmjMs7XIVNwb/WA=;
        b=pYkITosU0hAK+thewxZ1DC3xQMl3GMKQzEVdmFPInhK4lC2APgAMD9itBTLNoQYhfT
         0J6KwO7cE0w0ER4JVdpjm82jYFw/1CUbTwYksxpFv8xGavs/+8atwTjCiBD6IxeAuQfo
         Ezw6UMGD5mw+63KguC/mzuGmCOBeOx8ZEk9/l6oBA4OijwT7uDsVqI2WNvUDd+zgvgwj
         XNKUGxbhRBEiWvnDSMygJOhIc8mVd6peLCfckVuBYWi/VJHn0JqWDB4vYSEuOBmz0Lcu
         NF7CktN3j+aVu3d/aD/lUBl9hnEerd6fVZVd0MFV3lKMPg/iada7U/HEvDghE0tmi1jw
         irgA==
X-Forwarded-Encrypted: i=1; AKwUvBx6ivpoLHp8T9NoACoF8Iv3mDnRpqtvsQEZWYBK6CaRDhExsAicaXPijDx4PkAbi7HRR5PMSpq6WePiiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK7JVXAZE/shr5IlMzCR7eKEztmlrEifGIN60+6rNXfpdsSrQn/
	gEhq2VoHBwxXcttXAUF3+TMcnKWliVcpfG3i7CwGfXMilTSdm71PFHAEa+1av8OEFsugumfbCKU
	Mzqx1H0JjTjJORu5M+A==
X-Received: from wmcu7.prod.google.com ([2002:a7b:c047:0:b0:4a1:f37f:7f0b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:638e:b0:4a1:e6ad:baa3 with SMTP id 5b1f17b1804b1-4a1e6adbbe4mr113338955e9.15.1792483319125;
 Tue, 20 Oct 2026 01:01:59 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:46 +0000
In-Reply-To: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080147.1743459-1-aliceryhl@google.com>
Subject: Re: [PATCH 0/7] rust: io: add read-only and write-only views and registers
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?utf-8?q?Krzysztof_Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 04:19:40PM -0300, Daniel Almeida wrote:
> This series adds read-only and write-only I/O views, and the #[ro]
> and #[wo] attributes to register!. An access in the wrong direction
> then does not compile.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I heard a suggestion that it'd be better to drop the Io from these trait
names so they are just Readable and Writable, because not all
implementations do IO (i.e. if it's SysMem it's arguably not IO). Not
super important to me, though.
